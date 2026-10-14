# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "coverage"
require "json"

LINE_MINIMUM = 90.0
BRANCH_MINIMUM = 80.0

def percentage(covered, total)
  return 100.0 if total.zero?

  covered.fdiv(total) * 100
end

def counts(hits)
  {covered: hits.count(&:positive?), total: hits.length}
end

def write_report(output, results, metrics)
  results.each_value do |file|
    file[:methods] = file.fetch(:methods).map do |(owner, name, *location), hits|
      owner_name = Module.instance_method(:name).bind_call(owner)
      {owner: owner_name, name: name.to_s, location: location, hits: hits}
    end
  end
  report = JSON.pretty_generate(
    engine: "Ruby Coverage",
    runtime: RUBY_DESCRIPTION,
    method_semantics: "Invocations of defined methods",
    metrics: metrics,
    source_files: results.keys,
    coverage: results
  )
  File.write(output, "#{report}\n")
end

def coverage_summary(metrics)
  summaries = {lines: "Executable lines", branches: "Branches"}.map do |name, label|
    metric = metrics.fetch(name)
    format(
      "%<label>s: %<rate>.2f%% (%<covered>d/%<total>d).",
      label: label,
      rate: percentage(*metric.values_at(:covered, :total)),
      **metric
    )
  end
  summaries.join(" ")
end

output = ENV["COVERAGE_OUTPUT"]
root = File.expand_path("..", __dir__) + File::SEPARATOR
sources = Dir["#{root}lib/**/*.rb"]
Coverage.start(lines: true, branches: true, methods: true)
sources.each { RubyVM::InstructionSequence.compile_file(_1, coverage_enabled: true) }

at_exit do
  native = Coverage.result
  results = sources.to_h { [_1.delete_prefix(root), native.fetch(_1)] }
  metrics = {
    statements: nil,
    lines: counts(results.values.flat_map { _1.fetch(:lines) }.compact),
    branches: counts(results.values.flat_map { _1.fetch(:branches).values.flat_map(&:values) }),
    methods: counts(results.values.flat_map { _1.fetch(:methods).values })
  }
  if output
    write_report(output, results, metrics)
  end
  puts coverage_summary(metrics)
  next if output || {lines: LINE_MINIMUM, branches: BRANCH_MINIMUM}.all? do |name, minimum|
    percentage(*metrics.fetch(name).values_at(:covered, :total)) >= minimum
  end

  warn format(
    "Coverage is below required thresholds: executable lines %<lines>.2f%%, " \
    "branches %<branches>.2f%%. Add tests.",
    lines: LINE_MINIMUM,
    branches: BRANCH_MINIMUM
  )
  exit(false)
end

Dir[File.expand_path("../test/**/*_test.rb", __dir__)].each { |file| require file }
