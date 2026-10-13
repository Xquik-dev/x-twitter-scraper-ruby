# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

# Audits Gemfile.lock with bundler-audit and applies reviewed exceptions.
#
# It blocks on an insecure gem source, on any advisory for a gem the published
# gem loads at runtime, and on any development advisory that has a patched
# version. Severity never excuses a finding, and a .bundler-audit.yml ignore
# list is refused. An unpatched development-only advisory passes only while
# audit-exceptions.json lists it. Each entry holds advisory, path, reason and
# recheck. The path is the dependency path the audit prints. The reason is
# "build-time only" or "peer dependency provided by the host". The recheck date
# must fall within the next 30 days.
#
# Pass a directory to audit it instead of this repository.

require "bundler"
require "date"
require "json"
require "tempfile"

ROOT = File.expand_path(ARGV.fetch(0, File.join(__dir__, "..")))
EXCEPTIONS_PATH = File.join(ROOT, "audit-exceptions.json")
GEMSPEC_PATH = File.join(ROOT, "x_twitter_scraper.gemspec")
LOCKFILE_PATH = File.join(ROOT, "Gemfile.lock")
IGNORE_LIST_PATH = File.join(ROOT, ".bundler-audit.yml")
EXCEPTION_KEYS = %w[advisory path reason recheck].freeze
REASONS = ["build-time only", "peer dependency provided by the host"].freeze
MAX_RECHECK_DAYS = 30

def audit_results
  Tempfile.create(["bundle-audit", ".json"]) do |report|
    report.close
    command = %w[bundle exec bundle-audit check --update --quiet --format json --output] << report.path
    system(*command, chdir: ROOT)
    JSON.parse(File.read(report.path)).fetch("results")
  end
rescue JSON::ParserError, KeyError
  abort("bundle-audit wrote no report. Run bundle exec bundle-audit check --update to see why.")
end

def dependency_graph(lockfile)
  lockfile.specs.each_with_object(Hash.new { |graph, name| graph[name] = [] }) do |spec, graph|
    graph[spec.name] |= spec.dependencies.map(&:name)
  end
end

def reachable(graph, roots)
  seen = Set.new
  pending = roots.dup
  until pending.empty?
    name = pending.pop
    pending.concat(graph.fetch(name, [])) if seen.add?(name)
  end
  seen
end

def dependency_path(graph, roots, target)
  queue = roots.map { |root| [root] }
  seen = Set.new(roots)
  until queue.empty?
    path = queue.shift
    return path.join(" > ") if path.last == target

    graph.fetch(path.last, []).each do |child|
      queue << (path + [child]) if seen.add?(child)
    end
  end
  target
end

def blank_text?(value)
  !value.is_a?(String) || value.strip.empty?
end

def parse_date(value)
  date = Date.strptime(value.to_s, "%Y-%m-%d")
  date if date.iso8601 == value
rescue Date::Error
  nil
end

def recheck_problem(label, value, today)
  recheck = parse_date(value)
  return "#{label} has recheck \"#{value}\". Use a YYYY-MM-DD date." if recheck.nil?
  return "#{label} reached its recheck date. Review it, then update or remove the entry." if recheck <= today
  return if recheck <= today + MAX_RECHECK_DAYS

  "#{label} rechecks more than #{MAX_RECHECK_DAYS} days out. Pick an earlier date."
end

def entry_problem(entry, today)
  return "audit-exceptions.json has an entry that is not an object. Fix the file." unless entry.is_a?(Hash)

  label = entry.fetch("advisory", "An entry")
  unless entry.keys.sort == EXCEPTION_KEYS.sort
    return "#{label} needs exactly the keys #{EXCEPTION_KEYS.join(', ')}."
  end
  if blank_text?(entry["advisory"]) || blank_text?(entry["path"])
    return "#{label} needs a non-empty advisory and path."
  end
  return "#{label} needs the reason \"#{REASONS.join('" or "')}\"." unless REASONS.include?(entry["reason"])

  recheck_problem(label, entry["recheck"], today)
end

def matching_exception(exceptions, ids, path)
  exceptions.find { |entry| ids.include?(entry["advisory"]) && entry["path"] == path }
end

def advisory_ids(advisory)
  [
    advisory["id"],
    advisory["cve"] && "CVE-#{advisory['cve']}",
    advisory["ghsa"] && "GHSA-#{advisory['ghsa']}",
    advisory["osvdb"] && "OSVDB-#{advisory['osvdb']}"
  ].compact.uniq
end

today = Time.now.utc.to_date
exceptions = JSON.parse(File.read(EXCEPTIONS_PATH)).fetch("exceptions")
abort("audit-exceptions.json needs an \"exceptions\" array. Fix the file.") unless exceptions.is_a?(Array)

lockfile = Bundler::LockfileParser.new(File.read(LOCKFILE_PATH))
graph = dependency_graph(lockfile)
runtime_roots = Gem::Specification.load(GEMSPEC_PATH).runtime_dependencies.map(&:name)
runtime_gems = reachable(graph, runtime_roots)
top_level_gems = lockfile.dependencies.keys

blocking = exceptions.filter_map { |entry| entry_problem(entry, today) }
valid_exceptions = exceptions.select { |entry| entry_problem(entry, today).nil? }
used_exceptions = []
allowed = 0

if File.exist?(IGNORE_LIST_PATH)
  blocking << ".bundler-audit.yml can hide advisories. Remove it, and list reviewed exceptions in " \
              "audit-exceptions.json."
end

audit_results.each do |result|
  if result["type"] == "insecure_source"
    blocking << "Gemfile.lock uses the insecure source #{result['source']}. Switch it to https."
    next
  end

  gem_name = result.dig("gem", "name")
  advisory = result.fetch("advisory")
  ids = advisory_ids(advisory)
  runtime = runtime_gems.include?(gem_name)
  path = dependency_path(graph, runtime ? runtime_roots : top_level_gems, gem_name)
  severity = advisory["criticality"] || "unrated"
  finding = "#{ids.first} in #{gem_name} #{result.dig('gem', 'version')} (#{severity}, #{path})"
  patched = Array(advisory["patched_versions"])
  entry = matching_exception(valid_exceptions, ids, path)

  if runtime
    blocking << "#{finding} ships at runtime. Update the gem in Gemfile.lock."
  elsif !patched.empty?
    used_exceptions << entry if entry
    cleanup = entry ? ", then remove its audit-exceptions.json entry" : ""
    blocking << "#{finding} has a fix (#{patched.join(', ')}). Update the gem in Gemfile.lock#{cleanup}."
  elsif entry
    used_exceptions << entry
    allowed += 1
    puts("Allowed #{finding} as #{entry['reason']}. Recheck it by #{entry['recheck']}.")
  else
    blocking << "#{finding} has no fix or reviewed exception. Review it, then list it in audit-exceptions.json."
  end
end

(valid_exceptions - used_exceptions).each do |entry|
  puts("audit-exceptions.json lists #{entry['advisory']}, but no finding matches it. Remove the entry.")
end

unless blocking.empty?
  blocking.each { |line| warn(line) }
  abort("Dependency audit failed with #{blocking.length} blocking item(s).")
end

case allowed
when 0 then puts("Audit passed.")
when 1 then puts("Audit passed with 1 reviewed exception.")
else puts("Audit passed with #{allowed} reviewed exceptions.")
end
