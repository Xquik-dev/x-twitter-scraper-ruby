# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "expect"
require "pty"
require "socket"

require_relative "script_support"

# Runs bin/release-local in a throwaway repository whose origin is a local bare repository. Fake
# commands stand in for Bundler, curl, the GitHub CLI and the macOS Keychain. The real gem command
# pushes to a fake gem host on 127.0.0.1, so no test can reach RubyGems.org or GitHub.
class ReleaseLocalScriptTest < Minitest::Test
  include ScriptSupport

  # Answers as RubyGems.org does for an account that uses one-time codes and has no security device.
  class FakeGemHost
    MFA_REFUSAL = "You have enabled multifactor authentication but your request doesn't have the " \
                  "correct OTP code. Please check it and retry."

    attr_reader :requests

    def initialize(valid_code)
      @valid_code = valid_code
      @requests = []
      @server = TCPServer.new("127.0.0.1", 0)
      @thread = Thread.new { serve }
    end

    def url = "http://127.0.0.1:#{@server.addr.fetch(1)}"

    def close
      @server.close
      @thread.join
    end

    private

    def serve
      loop { answer(@server.accept) }
    rescue IOError
      nil
    end

    def answer(client)
      verb, path = client.gets.to_s.split
      headers = {}
      while (line = client.gets.to_s.chomp) != ""
        name, value = line.split(": ", 2)
        headers[name.downcase] = value
      end
      client.read(headers.fetch("content-length", "0").to_i)
      @requests << "#{verb} #{path} key=#{headers['authorization']} code=#{headers['otp']}"
      status, body = response(path, headers["otp"])
      head = ["HTTP/1.1 #{status}", "Content-Length: #{body.bytesize}", "Connection: close"]
      client.write("#{head.join("\r\n")}\r\n\r\n#{body}")
    rescue SystemCallError
      # The client went away. The host keeps answering later requests.
      nil
    ensure
      client.close
    end

    def response(path, code)
      return ["404 Not Found", "This account has no security device."] unless path == "/api/v1/gems"
      return ["401 Unauthorized", MFA_REFUSAL] unless code == @valid_code

      ["200 OK", "Successfully registered gem: x-twitter-scraper (9.9.9)"]
    end
  end

  KEYCHAIN_LINE = "RUBYGEMS_KEYCHAIN_SERVICE is unset or empty. Set it to the Keychain service that holds " \
                  "the RubyGems API key, then run bin/release-local again.\n"
  CODE_LINE = "GEM_HOST_OTP_CODE is unset or empty, and this run has no terminal. Run bin/release-local in " \
              "a terminal and type the code when RubyGems asks, or set GEM_HOST_OTP_CODE to a current " \
              "one-time code.\n"
  KEYCHAIN = {"RUBYGEMS_KEYCHAIN_SERVICE" => "example-service"}.freeze
  CHECK_LOCAL_STUB = "#!/bin/sh\necho ran >>\"$FAKE_LOGS/check-local\"\n"
  PUSH = "POST /api/v1/gems key=not-a-real-api-key"
  RELEASE = "release create v9.9.9 --title v9.9.9 --notes-file NOTES --verify-tag"

  FAKE_COMMANDS = {
    "bundle" => <<~SH,
      #!/bin/sh
      # Stands in for "bundle exec". The rake build becomes a plain gem build. Other commands run as given.
      shift
      if [ "$1" = "rake" ]; then
        mkdir -p pkg
        exec gem build --quiet --output pkg/x-twitter-scraper-9.9.9.gem x_twitter_scraper.gemspec
      fi
      exec "$@"
    SH
    "curl" => <<~SH,
      #!/bin/sh
      # Stands in for curl. It answers the version lookup with the HTTP status the test names.
      for argument in "$@"; do url="$argument"; done
      printf '%s\\n' "$url" >>"$FAKE_LOGS/curl"
      printf '%s' "$FAKE_REGISTRY_STATUS"
    SH
    "gem" => <<~SH,
      #!/bin/sh
      # Sends "gem push" to the fake gem host instead of RubyGems.org, and refuses any other push.
      # Every other gem command runs as given.
      if [ "$1" != "push" ]; then
        exec "$REAL_GEM" "$@"
      fi
      printf '%s\\n' "$*" >>"$FAKE_LOGS/gem"
      if [ "$#" -ne 4 ] || [ "$3" != "--host" ] || [ "$4" != "https://rubygems.org" ]; then
        echo "The fake gem refuses a push that does not name https://rubygems.org." >&2
        exit 97
      fi
      exec "$REAL_GEM" push "$2" --host "$FAKE_GEM_HOST"
    SH
    "gh" => <<~SH,
      #!/bin/sh
      # Stands in for the GitHub CLI. It is signed in, and it records each release and its notes.
      if [ "$1" = "release" ]; then
        line=""
        previous=""
        for argument in "$@"; do
          if [ "$previous" = "--notes-file" ]; then
            cp "$argument" "$FAKE_LOGS/notes"
            argument="NOTES"
          fi
          line="$line $argument"
          previous="$argument"
        done
        printf '%s\\n' "${line# }" >>"$FAKE_LOGS/gh"
      fi
    SH
    "security" => <<~SH
      #!/bin/sh
      # Stands in for the macOS Keychain. It holds 1 item, under the service "example-service".
      printf '%s\\n' "$*" >>"$FAKE_LOGS/security"
      [ "$*" = "find-generic-password -s example-service -w" ] || exit 44
      echo "not-a-real-api-key"
    SH
  }.freeze

  PROJECT_FILES = {
    ".gitignore" => "*.gem\n",
    "CHANGELOG.md" => <<~TEXT,
      # Changelog

      ## 9.9.9 (2026-01-02)

      * A fixture note.

      ## 9.9.8 (2026-01-01)

      * An older note.
    TEXT
    "LICENSE" => "Fixture license\n",
    "lib/fixture.rb" => "# frozen_string_literal: true\n",
    "scripts/audit.rb" => "puts(\"Audit passed.\")\n",
    "x_twitter_scraper.gemspec" => <<~RUBY
      Gem::Specification.new do |s|
        s.name = "x-twitter-scraper"
        s.version = "9.9.9"
        s.summary = "Fixture summary"
        s.description = "Fixture description"
        s.authors = ["Fixture"]
        s.license = "Apache-2.0"
        s.homepage = "https://example.com/home"
        s.metadata["source_code_uri"] = "https://example.com/source"
        s.required_ruby_version = ">= 3.2.0"
        s.files = ["LICENSE", "lib/fixture.rb"]
      end
    RUBY
  }.freeze

  DRY_RUN_LISTING = <<~TEXT
    ==> Listing what x-twitter-scraper 9.9.9 would publish
    name                      x-twitter-scraper
    version                   9.9.9
    summary                   Fixture summary
    description               Fixture description
    homepage                  https://example.com/home
    metadata source_code_uri  https://example.com/source
    license                   Apache-2.0
    required Ruby version     >= 3.2.0
    x-twitter-scraper-9.9.9.gem holds 2 files.
    LICENSE
    lib/fixture.rb
    RubyGems verified x-twitter-scraper-9.9.9.gem.
    Dry run finished. Nothing was published, tagged or released.
  TEXT

  def setup
    super
    @root = Dir.mktmpdir("release-local-test-")
    @host = FakeGemHost.new("123456")
    @project = File.join(@root, "project")
    @script = File.join(@project, "bin", "release-local")
    @origin = File.join(@root, "origin.git")
    @logs = File.join(@root, "logs")
    FileUtils.mkdir_p([@logs, File.join(@root, "home")])
    build_project
  end

  def teardown
    @host.close
    FileUtils.remove_entry(@root)
    super
  end

  def environment(variables = {}, registry_status: "404")
    inherited = ScriptSupport.environment
    inherited.merge(variables).merge(
      "PATH" => [File.join(@root, "bin"), inherited.fetch("PATH")].join(File::PATH_SEPARATOR),
      "HOME" => File.join(@root, "home"),
      "GIT_AUTHOR_NAME" => "Fixture",
      "GIT_AUTHOR_EMAIL" => "fixture@example.com",
      "GIT_COMMITTER_NAME" => "Fixture",
      "GIT_COMMITTER_EMAIL" => "fixture@example.com",
      "GIT_CONFIG_GLOBAL" => File::NULL,
      "GIT_CONFIG_SYSTEM" => File::NULL,
      "NO_PROXY" => "127.0.0.1",
      "REAL_GEM" => ScriptSupport.which("gem"),
      "FAKE_GEM_HOST" => @host.url,
      "FAKE_LOGS" => @logs,
      "FAKE_REGISTRY_STATUS" => registry_status
    )
  end

  def build_project
    PROJECT_FILES.each { |name, content| write_file(File.join(@project, name), content) }
    write_command(File.join(@project, "bin", "check-local"), CHECK_LOCAL_STUB)
    FileUtils.cp(File.join(ScriptSupport::ROOT, "bin", "release-local"), @script)
    FAKE_COMMANDS.each { |name, source| write_command(File.join(@root, "bin", name), source) }
    [
      ["init", "--quiet", "--bare", @origin],
      %w[init --quiet --initial-branch=main],
      %w[add --all],
      %w[commit --quiet --message Fixture],
      ["remote", "add", "origin", @origin],
      %w[push --quiet origin main]
    ].each { |arguments| run_command("git", *arguments, env: environment, chdir: @project) }
  end

  def release(*arguments, variables: {}, registry_status: "404")
    run_command(@script, *arguments, env: environment(variables, registry_status: registry_status))
  end

  # Runs the release in a terminal and types the code when RubyGems asks for it.
  def release_in_terminal(variables, code)
    pairs = environment(variables).map { |name, value| "#{name}=#{value}" }
    output = +""
    status = nil
    PTY.spawn("/usr/bin/env", "-i", *pairs, @script) do |reader, writer, pid|
      prompt = reader.expect("Code:", 30)
      output << prompt.to_a.join
      writer.puts(code) if prompt
      begin
        loop { output << reader.readpartial(4096) }
      rescue EOFError, Errno::EIO
        nil
      end
      status = Process.wait2(pid).last
    end
    [status.exitstatus, output]
  end

  def log(name) = read_lines(File.join(@logs, name))

  def origin_git(*arguments)
    run_command("git", *arguments, env: environment, chdir: @origin).stdout.strip
  end

  def origin_tags = origin_git("tag", "--list").split

  # The gem host requests, origin tags and GitHub releases that a release leaves behind.
  def published = [@host.requests, origin_tags, log("gh")]

  [["unset", {}], ["empty", {"RUBYGEMS_KEYCHAIN_SERVICE" => ""}]].each do |state, variables|
    define_method(:"test_stops_at_once_when_the_keychain_variable_is_#{state}") do
      result = release(variables: variables.merge("GEM_HOST_OTP_CODE" => "123456"))

      assert_equal([1, "", KEYCHAIN_LINE], result.to_a)
      assert_equal([[], [], []], [log("curl"), log("check-local"), log("security")])
      assert_equal([[], [], []], published)
    end
  end

  def test_dry_run_lists_the_gem_without_the_keychain_variable_and_publishes_nothing
    result = release("--dry-run")

    assert_equal(0, result.status, result.output)
    assert_equal(DRY_RUN_LISTING, result.stdout[result.stdout.index("==> Listing")..])
    assert_includes(
      result.stdout,
      "RubyGems.org does not have x-twitter-scraper 9.9.9 yet. A release uploads it.\n"
    )
    assert_equal(["ran"], log("check-local"))
    assert_equal([[], []], [log("security"), log("gem")])
    assert_equal([[], [], []], published)
  end

  [["unset", {}], ["empty", {"GEM_HOST_OTP_CODE" => ""}]].each do |state, variables|
    define_method(:"test_stops_before_the_checks_when_there_is_no_terminal_and_the_code_is_#{state}") do
      result = release(variables: variables.merge(KEYCHAIN))

      assert_equal([1, CODE_LINE], [result.status, result.stderr])
      assert_equal([[], [], []], [log("check-local"), log("security"), log("gem")])
      assert_equal([[], [], []], published)
    end
  end

  def test_pushes_with_the_code_from_the_environment_then_tags_and_releases
    result = release(variables: KEYCHAIN.merge("GEM_HOST_OTP_CODE" => "123456"))

    assert_equal(0, result.status, result.output)
    assert_equal(["https://rubygems.org/api/v2/rubygems/x-twitter-scraper/versions/9.9.9.json"], log("curl"))
    assert_equal(["ran"], log("check-local"))
    assert_equal(["find-generic-password -s example-service -w"], log("security"))
    assert_equal(["push pkg/x-twitter-scraper-9.9.9.gem --host https://rubygems.org"], log("gem"))
    assert_equal([["#{PUSH} code=123456"], ["v9.9.9"], [RELEASE]], published)
    assert_equal("* A fixture note.", File.read(File.join(@logs, "notes")).strip)
    assert_equal("tag", origin_git("cat-file", "-t", "v9.9.9"))
    refute_includes(result.output, "not-a-real-api-key")
    refute_includes(result.output, "example-service")
  end

  def test_pushes_with_the_code_the_owner_types_in_a_terminal
    status, output = release_in_terminal(KEYCHAIN, "123456")

    assert_equal(0, status, output)
    assert_equal(
      [
        [
          "#{PUSH} code=",
          "POST /api/v1/webauthn_verification key=not-a-real-api-key code=",
          "#{PUSH} code=123456"
        ],
        ["v9.9.9"],
        [RELEASE]
      ],
      published
    )
  end

  def test_stops_without_a_tag_when_rubygems_refuses_the_code
    result = release(variables: KEYCHAIN.merge("GEM_HOST_OTP_CODE" => "000000"))

    assert_equal(1, result.status)
    assert_includes(result.stdout, FakeGemHost::MFA_REFUSAL)
    assert_includes(
      result.stderr,
      "gem push failed. Read the RubyGems output above. If it refused the one-time code, run " \
      "bin/release-local again with a current code.\n"
    )
    assert_equal("#{PUSH} code=000000", @host.requests.first)
    assert_equal([[], []], [origin_tags, log("gh")])
  end

  def test_skips_the_upload_when_rubygems_already_has_the_version
    result = release(variables: KEYCHAIN, registry_status: "200")

    assert_equal(0, result.status, result.output)
    assert_includes(
      result.stdout,
      "RubyGems.org already has x-twitter-scraper 9.9.9. A release skips the upload.\n"
    )
    assert_equal([[], []], [log("security"), log("gem")])
    assert_equal([[], ["v9.9.9"], [RELEASE]], published)
  end

  def test_stops_when_the_keychain_has_no_item_for_the_named_service
    variables = {"RUBYGEMS_KEYCHAIN_SERVICE" => "example-other-service", "GEM_HOST_OTP_CODE" => "1"}
    result = release(variables: variables)

    assert_equal(1, result.status)
    assert_includes(
      result.stderr,
      "The Keychain has no item under the service that RUBYGEMS_KEYCHAIN_SERVICE names. The owner must " \
      "add the RubyGems API key there.\n"
    )
    refute_includes(result.output, "example-other-service")
    assert_equal([[], [], []], published)
  end
end
