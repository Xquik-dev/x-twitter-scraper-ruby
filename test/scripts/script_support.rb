# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "fileutils"
require "minitest/autorun"
require "open3"
require "tmpdir"

# Helpers for the tests that run the repository's scripts as a maintainer would. Each script runs as a
# process in a throwaway directory, with fake commands on PATH in place of the tools that reach other
# systems.
module ScriptSupport
  ROOT = File.expand_path("../..", __dir__)

  # Variables that a release machine sets. A test names the ones it wants.
  RELEASE_VARIABLES = %w[GEM_HOST_API_KEY GEM_HOST_OTP_CODE RUBYGEMS_HOST RUBYGEMS_KEYCHAIN_SERVICE].freeze

  Result = Struct.new(:status, :stdout, :stderr) do
    def output = "#{stdout}#{stderr}"
  end

  # The test process's environment without Bundler's variables, so a script finds the fake bundle
  # on PATH, and without the release variables.
  def self.environment
    inherited = defined?(Bundler) ? Bundler.unbundled_env : ENV.to_h
    inherited.except(*RELEASE_VARIABLES)
  end

  def self.which(command)
    directory = environment.fetch("PATH").split(File::PATH_SEPARATOR).find do |candidate|
      File.executable?(File.join(candidate, command))
    end
    File.join(directory || raise("#{command} is not on PATH. Install it first."), command)
  end

  def write_file(path, content, mode: 0o644)
    FileUtils.mkdir_p(File.dirname(path))
    File.write(path, content)
    File.chmod(mode, path)
  end

  def write_command(path, source)
    write_file(path, source, mode: 0o755)
  end

  def read_lines(path)
    File.exist?(path) ? File.readlines(path, chomp: true) : []
  end

  # Runs a command with exactly the given environment and no terminal.
  def run_command(*command, env:, chdir: Dir.pwd)
    options = {unsetenv_others: true, stdin_data: "", chdir: chdir}
    stdout, stderr, status = Open3.capture3(env, *command, **options)
    Result.new(status.exitstatus, stdout, stderr)
  end
end
