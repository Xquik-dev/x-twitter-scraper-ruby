# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "date"
require "json"
require "rbconfig"

require_relative "script_support"

# Runs scripts/audit.rb against a throwaway project. A fake bundle command stands in for
# bundler-audit and its advisory database, and writes the report that the test names.
class AuditScriptTest < Minitest::Test
  include ScriptSupport

  SCRIPT = File.join(ScriptSupport::ROOT, "scripts", "audit.rb")
  SEVERITIES = {
    "low" => "low",
    "medium" => "medium",
    "high" => "high",
    "critical" => "critical",
    nil => "unrated"
  }.freeze

  FAKE_BUNDLE = <<~SH
    #!/bin/sh
    # Stands in for "bundle exec bundle-audit check ... --output <file>".
    while [ "$#" -gt 1 ]; do
      if [ "$1" = "--output" ]; then
        [ -f "$FAKE_AUDIT_REPORT" ] && cp "$FAKE_AUDIT_REPORT" "$2"
        break
      fi
      printf '%s ' "$1" >>"$FAKE_AUDIT_LOG"
      shift
    done
    exit 1
  SH

  GEMSPEC = <<~RUBY
    Gem::Specification.new do |s|
      s.name = "x-twitter-scraper"
      s.version = "9.9.9"
      s.summary = "Fixture"
      s.authors = ["Fixture"]
      s.files = []
      s.add_dependency "shipped"
    end
  RUBY

  def day(offset)
    (Time.now.utc.to_date + offset).iso8601
  end

  # A lockfile where the published gem needs "shipped", and "rake" is a development gem. The named
  # parents depend on the vulnerable gem "leftpad".
  def lockfile(parents)
    gems = %w[rake shipped].flat_map do |name|
      ["    #{name} (1.0.0)", *("      leftpad" if parents.include?(name))]
    end
    [
      "PATH",
      "  remote: .",
      "  specs:",
      "    x-twitter-scraper (9.9.9)",
      "      shipped",
      "",
      "GEM",
      "  remote: https://rubygems.org/",
      "  specs:",
      "    leftpad (1.0.0)",
      *gems,
      "",
      "PLATFORMS",
      "  ruby",
      "",
      "DEPENDENCIES",
      "  rake",
      "  x-twitter-scraper!",
      ""
    ].join("\n")
  end

  # A finding in the shape bundler-audit 0.9.3 writes with --format json.
  def finding(criticality: "low", patched: [])
    {
      type: "unpatched_gem",
      gem: {name: "leftpad", version: "1.0.0"},
      advisory: {
        id: "GHSA-aaaa-bbbb-cccc",
        cve: nil,
        osvdb: nil,
        ghsa: "aaaa-bbbb-cccc",
        unaffected_versions: [],
        patched_versions: patched,
        criticality: criticality
      }
    }
  end

  def listed(**overrides)
    {
      advisory: "GHSA-aaaa-bbbb-cccc",
      path: "rake > leftpad",
      reason: "build-time only",
      recheck: day(10)
    }.merge(overrides)
  end

  def audit(results: [], exceptions: [], parents: ["rake"], report: true, files: {})
    Dir.mktmpdir("audit-test-") do |root|
      project = File.join(root, "project")
      write_file(File.join(project, "x_twitter_scraper.gemspec"), GEMSPEC)
      write_file(File.join(project, "Gemfile.lock"), lockfile(parents))
      write_file(File.join(project, "audit-exceptions.json"), JSON.generate(exceptions: exceptions))
      files.each { |name, content| write_file(File.join(project, name), content) }
      write_command(File.join(root, "bin", "bundle"), FAKE_BUNDLE)
      report_path = File.join(root, "report.json")
      write_file(report_path, JSON.generate(version: "0.9.3", results: results)) if report

      environment = ScriptSupport.environment
      result = run_command(
        RbConfig.ruby,
        SCRIPT,
        project,
        env: environment.merge(
          "PATH" => [File.join(root, "bin"), environment.fetch("PATH")].join(File::PATH_SEPARATOR),
          "FAKE_AUDIT_REPORT" => report_path,
          "FAKE_AUDIT_LOG" => File.join(root, "audit.log")
        )
      )
      [result, File.exist?(File.join(root, "audit.log")) ? File.read(File.join(root, "audit.log")) : ""]
    end
  end

  def test_passes_when_the_audit_reports_nothing
    result, command = audit

    assert_equal([0, "Audit passed.\n"], [result.status, result.output])
    assert_equal("exec bundle-audit check --update --quiet --format json ", command)
  end

  # Defines 1 test per severity that bundler-audit can report, since no severity excuses a finding.
  def self.test_each_severity(name, &block)
    SEVERITIES.each do |criticality, label|
      define_method(:"test_#{format(name, label)}") { instance_exec(criticality, label, &block) }
    end
  end

  test_each_severity("blocks_a_%s_finding_in_a_shipped_gem_even_when_it_is_listed") do |criticality, label|
    result, = audit(
      results: [finding(criticality: criticality)],
      exceptions: [listed(path: "shipped > leftpad")],
      parents: %w[rake shipped]
    )

    assert_equal(1, result.status)
    assert_includes(
      result.stderr,
      "GHSA-aaaa-bbbb-cccc in leftpad 1.0.0 (#{label}, shipped > leftpad) ships at runtime. " \
      "Update the gem in Gemfile.lock.\n"
    )
  end

  test_each_severity("blocks_a_%s_development_finding_that_has_a_fix") do |criticality, label|
    result, = audit(results: [finding(criticality: criticality, patched: ["~> 1.6.11", ">= 2.0.6"])])

    assert_equal(1, result.status)
    assert_includes(
      result.stderr,
      "GHSA-aaaa-bbbb-cccc in leftpad 1.0.0 (#{label}, rake > leftpad) has a fix (~> 1.6.11, >= 2.0.6). " \
      "Update the gem in Gemfile.lock.\n"
    )
  end

  test_each_severity("blocks_an_unfixable_%s_development_finding_nobody_reviewed") do |criticality, label|
    result, = audit(results: [finding(criticality: criticality)])

    assert_equal(1, result.status)
    assert_includes(
      result.stderr,
      "GHSA-aaaa-bbbb-cccc in leftpad 1.0.0 (#{label}, rake > leftpad) has no fix or reviewed exception. " \
      "Review it, then list it in audit-exceptions.json.\n"
    )
  end

  def test_passes_a_listed_unfixable_development_finding_and_names_it
    exception = listed(recheck: day(30))
    result, = audit(results: [finding], exceptions: [exception])

    assert_equal(
      [
        0,
        "Allowed GHSA-aaaa-bbbb-cccc in leftpad 1.0.0 (low, rake > leftpad) as build-time only. " \
        "Recheck it by #{exception.fetch(:recheck)}.\n" \
        "Audit passed with 1 reviewed exception.\n"
      ],
      [result.status, result.output]
    )
  end

  def test_blocks_a_listed_finding_again_once_a_fix_exists
    result, = audit(results: [finding(patched: [">= 2.0.0"])], exceptions: [listed])

    assert_equal(1, result.status)
    assert_includes(
      result.stderr,
      "GHSA-aaaa-bbbb-cccc in leftpad 1.0.0 (low, rake > leftpad) has a fix (>= 2.0.0). " \
      "Update the gem in Gemfile.lock, then remove its audit-exceptions.json entry.\n"
    )
  end

  def test_blocks_a_listed_finding_again_on_its_recheck_date
    result, = audit(results: [finding], exceptions: [listed(recheck: day(0))])

    assert_equal(1, result.status)
    assert_includes(
      result.stderr,
      "GHSA-aaaa-bbbb-cccc reached its recheck date. Review it, then update or remove the entry.\n"
    )
  end

  def test_refuses_a_recheck_date_more_than_30_days_out
    result, = audit(results: [finding], exceptions: [listed(recheck: day(31))])

    assert_equal(1, result.status)
    assert_includes(
      result.stderr,
      "GHSA-aaaa-bbbb-cccc rechecks more than 30 days out. Pick an earlier date.\n"
    )
  end

  def test_refuses_an_exception_without_a_reviewed_reason
    result, = audit(results: [finding], exceptions: [listed(reason: "low severity")])

    assert_equal(1, result.status)
    assert_includes(
      result.stderr,
      "GHSA-aaaa-bbbb-cccc needs the reason \"build-time only\" or " \
      "\"peer dependency provided by the host\".\n"
    )
  end

  def test_an_exception_covers_only_the_dependency_path_it_names
    result, = audit(results: [finding], exceptions: [listed(path: "rubocop > leftpad")])

    assert_equal(1, result.status)
    assert_includes(
      result.stderr,
      "GHSA-aaaa-bbbb-cccc in leftpad 1.0.0 (low, rake > leftpad) has no fix or reviewed exception. " \
      "Review it, then list it in audit-exceptions.json.\n"
    )
  end

  def test_blocks_an_insecure_gem_source
    result, = audit(results: [{type: "insecure_source", source: "http://rubygems.org/"}])

    assert_equal(1, result.status)
    assert_includes(
      result.stderr,
      "Gemfile.lock uses the insecure source http://rubygems.org/. Switch it to https.\n"
    )
  end

  def test_refuses_a_bundler_audit_ignore_list
    result, = audit(files: {".bundler-audit.yml" => "ignore:\n  - GHSA-aaaa-bbbb-cccc\n"})

    assert_equal(1, result.status)
    assert_includes(
      result.stderr,
      ".bundler-audit.yml can hide advisories. Remove it, and list reviewed exceptions in " \
      "audit-exceptions.json.\n"
    )
  end

  def test_fails_when_the_audit_tool_writes_no_report
    result, = audit(report: false)

    assert_equal(1, result.status)
    assert_equal(
      "bundle-audit wrote no report. Run bundle exec bundle-audit check --update to see why.\n",
      result.stderr
    )
  end
end
