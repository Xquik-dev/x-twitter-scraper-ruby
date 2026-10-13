# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "json"

require_relative "script_support"

# Runs bin/check-local in a throwaway repository. Fake commands stand in for Bundler, CodeQL, uv and
# the GitHub CLI, so the test sees which checks ran and which commit statuses the script posted.
class CheckLocalScriptTest < Minitest::Test
  include ScriptSupport

  FAKE_COMMANDS = {
    "bundle" => <<~SH,
      #!/bin/sh
      # Stands in for Bundler. Every command passes, and the audit prints the summary the test names.
      case "$*" in
        *scripts/audit.rb*) printf '%s\\n' "$FAKE_AUDIT_SUMMARY" ;;
      esac
    SH
    "codeql" => <<~SH,
      #!/bin/sh
      # Stands in for the CodeQL CLI. The analysis writes the SARIF file that the test names.
      for argument in "$@"; do
        case "$argument" in
          --output=*) cp "$FAKE_CODEQL_SARIF" "${argument#--output=}" ;;
        esac
      done
    SH
    "uvx" => <<~SH,
      #!/bin/sh
      # Stands in for uvx. It records the tool it was asked to run and exits as the test names.
      printf '%s\\n' "$*" >>"$FAKE_UVX_LOG"
      exit "$FAKE_REUSE_EXIT"
    SH
    "gh" => <<~SH
      #!/bin/sh
      # Stands in for the GitHub CLI. It finds every commit on GitHub and records each status post.
      case "$2" in
        */statuses/*)
          for argument in "$@"; do
            case "$argument" in
              state=*) state="${argument#state=}" ;;
              description=*) description="${argument#description=}" ;;
            esac
          done
          printf '%s\\t%s\\t%s\\n' "$2" "$state" "$description" >>"$FAKE_GH_LOG"
          ;;
      esac
    SH
  }.freeze

  TEST_STUB = <<~SH
    #!/bin/sh
    echo "2 runs, 2 assertions, 0 failures, 0 errors, 0 skips"
  SH

  GIT_IDENTITY = {
    "GIT_AUTHOR_NAME" => "Fixture",
    "GIT_AUTHOR_EMAIL" => "fixture@example.com",
    "GIT_COMMITTER_NAME" => "Fixture",
    "GIT_COMMITTER_EMAIL" => "fixture@example.com",
    "GIT_CONFIG_GLOBAL" => File::NULL,
    "GIT_CONFIG_SYSTEM" => File::NULL
  }.freeze

  def setup
    super
    @root = Dir.mktmpdir("check-local-test-")
    @project = File.join(@root, "project")
    @script = File.join(@project, "bin", "check-local")
    FileUtils.mkdir_p(File.dirname(@script))
    FileUtils.cp(File.join(ScriptSupport::ROOT, "bin", "check-local"), @script)
    write_command(File.join(@project, "scripts", "lint"), "#!/bin/sh\n")
    write_command(File.join(@project, "scripts", "test"), TEST_STUB)
  end

  def teardown
    FileUtils.remove_entry(@root)
    super
  end

  EXTRACTION_DIAGNOSTICS = %w[rb/diagnostics/extraction-errors rb/diagnostics/extraction-warnings].freeze

  # A SARIF file in the shape CodeQL 2.27 writes for a scan without findings. "unread" maps each file
  # that CodeQL could not parse to the line of the error, and "diagnostics" names the diagnostic
  # queries that ran.
  def sarif(unread: {}, diagnostics: EXTRACTION_DIAGNOSTICS)
    notifications = unread.map do |file, line|
      {
        "locations" => [
          {
            "physicalLocation" => {
              "artifactLocation" => {"uri" => file, "uriBaseId" => "%SRCROOT%"},
              "region" => {"startLine" => line}
            }
          }
        ],
        "message" => {"text" => "Extraction warning in #{file} with message A parse error occurred."},
        "descriptor" => {"id" => "rb/diagnostics/extraction-warnings"}
      }
    end
    run = {
      "tool" => {"driver" => {"name" => "CodeQL", "notifications" => diagnostics.map { |id| {"id" => id} }}},
      "invocations" => [{"toolExecutionNotifications" => notifications, "executionSuccessful" => true}],
      "results" => []
    }
    JSON.generate({"runs" => [run]})
  end

  def environment(path, audit_summary, reuse_exit)
    ScriptSupport.environment.merge(GIT_IDENTITY).merge(
      "PATH" => [File.join(@root, "bin"), path].join(File::PATH_SEPARATOR),
      "FAKE_CODEQL_SARIF" => File.join(@root, "codeql.sarif"),
      "FAKE_AUDIT_SUMMARY" => audit_summary,
      "FAKE_REUSE_EXIT" => reuse_exit.to_s,
      "FAKE_UVX_LOG" => File.join(@root, "uvx.log"),
      "FAKE_GH_LOG" => File.join(@root, "gh.log")
    )
  end

  # Runs bin/check-local on a clean, committed tree. "codeql_sarif" is the file the fake CodeQL
  # writes, "without" names fake commands to leave out, and "system_path_only" hides the tools
  # installed on this machine.
  def check_local(
    audit_summary: "Audit passed.",
    reuse_exit: 0,
    codeql_sarif: sarif,
    without: [],
    system_path_only: false
  )
    FAKE_COMMANDS.except(*without).each do |name, source|
      write_command(File.join(@root, "bin", name), source)
    end
    write_file(File.join(@root, "codeql.sarif"), codeql_sarif)
    path = system_path_only ? "/usr/bin:/bin" : ScriptSupport.environment.fetch("PATH")
    env = environment(path, audit_summary, reuse_exit)
    [%w[init --quiet], %w[add --all], %w[commit --quiet --message Fixture]].each do |arguments|
      run_command("git", *arguments, env: env, chdir: @project)
    end
    head = run_command("git", "rev-parse", "HEAD", env: env, chdir: @project).stdout.strip

    result = run_command(@script, env: env)
    posts = read_lines(File.join(@root, "gh.log")).map { |line| line.split("\t") }
    {
      result: result,
      status_paths: posts.map(&:first).uniq,
      expected_status_path: "repos/Xquik-dev/x-twitter-scraper-ruby/statuses/#{head}",
      statuses: posts.map { |post| post.drop(1) },
      uvx: read_lines(File.join(@root, "uvx.log"))
    }
  end

  def test_runs_the_pinned_reuse_lint_and_lists_it_in_the_success_status
    run = check_local

    assert_equal(0, run.fetch(:result).status, run.fetch(:result).output)
    assert_equal(["--from reuse==6.2.0 reuse lint"], run.fetch(:uvx))
    assert_equal([run.fetch(:expected_status_path)], run.fetch(:status_paths))
    assert_equal(
      [
        ["pending", "Local checks are running."],
        [
          "success",
          "Passed reproducible build, lint & types, audit, tests (2 passed), coverage, CodeQL and REUSE."
        ]
      ],
      run.fetch(:statuses)
    )
  end

  def test_fails_and_posts_no_success_when_the_reuse_lint_fails
    run = check_local(reuse_exit: 1)

    assert_equal(1, run.fetch(:result).status)
    assert_includes(
      run.fetch(:result).stderr,
      "Check failed for REUSE license compliance. Add the missing license notice or REUSE.toml entry.\n"
    )
    assert_equal(
      [
        ["pending", "Local checks are running."],
        [
          "failure",
          "Check failed for REUSE license compliance. Add the missing license notice or REUSE.toml entry."
        ]
      ],
      run.fetch(:statuses)
    )
  end

  def test_fails_with_the_install_command_when_uv_is_missing
    run = check_local(without: ["uvx"], system_path_only: true)

    assert_equal(1, run.fetch(:result).status)
    assert_includes(run.fetch(:result).stderr, "Check failed for uv. Install it with brew install uv.\n")
    assert_equal(
      [
        ["pending", "Local checks are running."],
        ["failure", "Check failed for uv. Install it with brew install uv."]
      ],
      run.fetch(:statuses)
    )
  end

  CODEQL_FAILURE_STATUS = [
    "failure",
    "Check failed for CodeQL security-extended scan. Fix what CodeQL reported above, then rerun bin/check-local."
  ].freeze

  def test_fails_and_names_each_file_that_codeql_could_not_parse
    run = check_local(codeql_sarif: sarif(unread: {"lib/client.rb" => 921, "lib/errors.rb" => 7}))

    assert_equal(1, run.fetch(:result).status)
    assert_includes(
      run.fetch(:result).stderr,
      "CodeQL could not parse lib/client.rb at line 921 and lib/errors.rb at line 7, so the scan did not " \
      "cover all code. Rewrite that syntax so CodeQL parses it, then rerun bin/check-local.\n"
    )
    refute_includes(run.fetch(:result).stdout, "CodeQL reported no findings.")
    assert_equal([["pending", "Local checks are running."], CODEQL_FAILURE_STATUS], run.fetch(:statuses))
  end

  def test_fails_when_the_scan_ran_no_extraction_diagnostic
    run = check_local(codeql_sarif: sarif(diagnostics: ["rb/diagnostics/successfully-extracted-files"]))

    assert_equal(1, run.fetch(:result).status)
    assert_includes(
      run.fetch(:result).stderr,
      "The CodeQL scan lacks rb/diagnostics/extraction-errors and rb/diagnostics/extraction-warnings, so " \
      "it cannot show that it read every file. Make the suite in bin/check-local run each missing " \
      "diagnostic query.\n"
    )
    assert_equal(CODEQL_FAILURE_STATUS, run.fetch(:statuses).last)
  end

  def test_names_reviewed_audit_exceptions_in_the_success_status
    run = check_local(audit_summary: "Audit passed with 1 reviewed exception.")

    assert_equal(
      [
        "success",
        "Passed reproducible build, lint & types, audit (1 reviewed exception), tests (2 passed), " \
        "coverage, CodeQL and REUSE."
      ],
      run.fetch(:statuses).last
    )
  end
end
