# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "coverage"

STATEMENT_MINIMUM = 90.0
BRANCH_MINIMUM = 80.0

def percentage(covered, total)
  return 100.0 if total.zero?

  covered.fdiv(total) * 100
end

def project_results(results)
  root = File.expand_path("../lib", __dir__) + File::SEPARATOR
  results.select { |path, _result| path.start_with?(root) }
end

def coverage_counts(results)
  lines = results.values.flat_map { |result| result.fetch(:lines) }.compact
  branches = results.values.flat_map { |result| result.fetch(:branches).values.flat_map(&:values) }
  {
    statements: [lines.count(&:positive?), lines.length],
    branches: [branches.count(&:positive?), branches.length]
  }
end

Coverage.start(lines: true, branches: true)

at_exit do
  counts = coverage_counts(project_results(Coverage.result))
  statement_covered, statement_total = counts.fetch(:statements)
  branch_covered, branch_total = counts.fetch(:branches)
  statement_percentage = percentage(statement_covered, statement_total)
  branch_percentage = percentage(branch_covered, branch_total)

  puts format(
    "Statements: %.2f%% (%d/%d). Branches: %.2f%% (%d/%d).",
    statement_percentage,
    statement_covered,
    statement_total,
    branch_percentage,
    branch_covered,
    branch_total
  )

  next if statement_percentage >= STATEMENT_MINIMUM && branch_percentage >= BRANCH_MINIMUM

  warn format(
    "Coverage below required thresholds: statements %.2f%%, branches %.2f%%.",
    STATEMENT_MINIMUM,
    BRANCH_MINIMUM
  )
  exit(false)
end

Dir[File.expand_path("../test/**/*_test.rb", __dir__)].sort.each { |file| require file }
