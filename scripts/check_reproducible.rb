# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "open3"

ROOT = File.expand_path("..", __dir__)

def run(*command, env: {})
  success = system(env, *command, chdir: ROOT)
  return if success

  raise "Command failed: #{command.join(' ')}. Fix the preceding error."
end

def source_date_epoch
  output, status = Open3.capture2("git", "log", "-1", "--format=%ct", chdir: ROOT)
  raise "Source commit timestamp is unavailable. Check Git history." unless status.success?

  output.strip
end

def built_gem
  files = Dir[File.join(ROOT, "pkg", "*.gem")]
  raise "Gem count is wrong. Build exactly one gem." unless files.length == 1

  File.binread(files.fetch(0))
end

environment = {"SOURCE_DATE_EPOCH" => source_date_epoch}

run("bundle", "exec", "rake", "clobber", "build:gem", env: environment)
first = built_gem

run("bundle", "exec", "rake", "clobber", "build:gem", env: environment)
second = built_gem

raise "Gem builds differ. Remove nondeterministic build inputs." unless first == second

puts "Gem builds are reproducible."
