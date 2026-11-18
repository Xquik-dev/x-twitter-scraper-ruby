# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "script_support"

class FormatTest < Minitest::Test
  include ScriptSupport

  HEADER = <<~TEXT
    # SPDX-FileCopyrightText: 2026 Xquik contributors
    #
    # SPDX-License-Identifier: Apache-2.0

  TEXT
  COPIED = %w[Rakefile lib/x_twitter_scraper/version.rb].freeze

  def setup
    @root = Dir.mktmpdir("format-test-")
    COPIED.each { write_file(File.join(@root, _1), File.read(File.join(ScriptSupport::ROOT, _1))) }
  end

  def teardown
    FileUtils.remove_entry(@root)
  end

  def test_formatting_a_signature_keeps_its_license_header
    path = File.join(@root, "sig", "widget.rbs")
    write_file(path, "#{HEADER}module Widget\n      def size:   -> Integer\nend\n")
    write_file(File.join(@root, "files"), "./sig/widget.rbs\n")
    env = ENV.to_h.merge(
      "BUNDLE_GEMFILE" => File.join(ScriptSupport::ROOT, "Gemfile"),
      "FORMAT_FILE" => File.join(@root, "files")
    )

    result = run_command(ScriptSupport.which("bundle"), "exec", "rake", "format:rbs", env: env, chdir: @root)

    assert_equal(0, result.status, result.output)
    assert_equal("#{HEADER}module Widget\n  def size: -> Integer\nend\n", File.read(path))
  end
end
