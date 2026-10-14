# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "fileutils"
require "json"
require "rbconfig"
require "tmpdir"

require_relative "test_helper"

class XTwitterScraper::Test::CoverageReportTest < Minitest::Test
  def test_reports_native_metrics_without_relabeling_lines_as_statements
    with_collector do |directory, report_path|
      File.write("#{directory}/lib/fixture.rb", <<~RUBY)
        module Fixture
          def self.pick(first)
            if first
              7
            else
              9
            end
          end
        end
      RUBY
      File.write("#{directory}/test/fixture_test.rb", <<~RUBY)
        require_relative "../lib/fixture"
        raise "Wrong public result" unless Fixture.pick(true) == 7
      RUBY
      File.write("#{directory}/lib/nested/unloaded.rb", "UNUSED_FIXTURE = 11\n")
      assert_process(directory, report_path)
      report = JSON.parse(File.read(report_path))
      assert_nil(report.fetch("metrics").fetch("statements"))
      assert_equal({"covered" => 4, "total" => 6}, report.fetch("metrics").fetch("lines"))
      assert_equal({"covered" => 1, "total" => 2}, report.fetch("metrics").fetch("branches"))
      assert_equal({"covered" => 1, "total" => 1}, report.fetch("metrics").fetch("methods"))
      assert_equal(["lib/fixture.rb", "lib/nested/unloaded.rb"], report.fetch("source_files"))
    end
  end

  def test_reports_methods_without_calling_a_modules_custom_inspect
    with_collector do |directory, report_path|
      File.write("#{directory}/lib/fixture.rb", <<~RUBY)
        module Fixture
          extend self
          def called = 7
          def inspect(value, depth:)
            value
          end
        end
      RUBY
      File.write("#{directory}/test/fixture_test.rb", <<~RUBY)
        require_relative "../lib/fixture"
        raise "Wrong public result" unless Fixture.called == 7
      RUBY
      assert_process(directory, report_path)
      report = JSON.parse(File.read(report_path))
      assert_equal({"covered" => 1, "total" => 2}, report.fetch("metrics").fetch("methods"))
      methods = report.fetch("coverage").fetch("lib/fixture.rb").fetch("methods")
      assert_equal({"called" => 1, "inspect" => 0}, methods.to_h { [_1.fetch("name"), _1.fetch("hits")] })
    end
  end

  private

  def with_collector
    Dir.mktmpdir("ruby-coverage-") do |directory|
      FileUtils.mkdir_p(["#{directory}/lib/nested", "#{directory}/scripts", "#{directory}/test"])
      FileUtils.cp(File.expand_path("../../scripts/coverage.rb", __dir__), "#{directory}/scripts/coverage.rb")
      yield(directory, "#{directory}/report.json")
    end
  end

  def assert_process(directory, report_path)
    command = [{"COVERAGE_OUTPUT" => report_path}, RbConfig.ruby, "#{directory}/scripts/coverage.rb"]
    File.open("#{directory}/output", "w+") do |output|
      pid = Process.spawn(*command, chdir: directory, out: output, err: output)
      waiter = Process.detach(pid)
      unless waiter.join(5)
        cleanup = begin
          Process.kill("KILL", pid)
          "Killed the child after the deadline."
        rescue Errno::ESRCH
          "The child exited during timeout cleanup."
        end
        reaped = waiter.join(2)
        output.rewind
        flunk(
          "Process exceeded 5 seconds. #{cleanup}\n" \
          "Child reaped: #{!reaped.nil?}\n#{output.read}"
        )
      end
      output.rewind
      assert_predicate(waiter.value, :success?, output.read)
    end
  end
end
