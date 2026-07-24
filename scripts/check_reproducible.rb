# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "open3"

ROOT = File.expand_path("..", __dir__)

def run(*command, env: {})
  success = system(env, *command, chdir: ROOT)
  return if success

  raise "Command failed: #{command.join(' ')}"
end

def source_date_epoch
  output, status = Open3.capture2("git", "log", "-1", "--format=%ct", chdir: ROOT)
  raise "Could not read the source commit timestamp" unless status.success?

  output.strip
end

def built_gem
  files = Dir[File.join(ROOT, "pkg", "*.gem")]
  raise "Expected exactly one built gem" unless files.length == 1

  File.binread(files.fetch(0))
end

environment = {"SOURCE_DATE_EPOCH" => source_date_epoch}

run("bundle", "exec", "rake", "clobber", "build:gem", env: environment)
first = built_gem

run("bundle", "exec", "rake", "clobber", "build:gem", env: environment)
second = built_gem

raise "Repeated gem builds differ" unless first == second

puts "Gem builds are reproducible."
