# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::UnionPropertyTest < Minitest::Test
  SAMPLES = [
    "",
    "abc",
    "12",
    "1.5",
    "2026-01-01T00:00:00Z",
    12,
    1.5,
    true,
    false,
    [],
    ["abc"],
    [1],
    {},
    {id: "1"}
  ].freeze

  def self.unions(namespace = XTwitterScraper::Models, seen = Set.new)
    namespace.constants.sort.flat_map do |name|
      value = namespace.const_get(name)
      next [] unless value.is_a?(Module) && value.name&.start_with?("XTwitterScraper::") && seen.add?(value)

      own = value.singleton_class <= XTwitterScraper::Internal::Type::Union ? [value] : []
      own + unions(value, seen)
    end
  end

  UNIONS = unions.freeze
  PROBES = UNIONS.each_with_index.to_h do |union, index|
    probe = Class.new(XTwitterScraper::Internal::Type::BaseModel) { required :value, union: union }
    [union, const_set(:"Probe#{index}", probe)]
  end.freeze

  def alone(variant, value)
    state = XTwitterScraper::Internal::Type::Converter.new_coerce_state
    XTwitterScraper::Internal::Type::Converter.coerce(variant, value, state: state)
    exactness = state.fetch(:exactness)
    {exact: state.fetch(:error).nil? && (exactness.fetch(:no) + exactness.fetch(:maybe)).zero?, error: state.fetch(:error)}
  end

  def read(union, value)
    XTwitterScraper::Internal::Type::Converter.coerce(PROBES.fetch(union), {value: value}).value
    nil
  rescue XTwitterScraper::Errors::ConversionError => e
    e
  end

  def test_the_walk_reaches_response_and_request_unions
    assert_includes(UNIONS, XTwitterScraper::Models::ActivityLogRow::Results)
    assert_includes(UNIONS, XTwitterScraper::Models::ExtractionRunParams::SinceTime)
  end

  def test_a_value_one_variant_takes_exactly_reads_back
    misses = UNIONS.product(SAMPLES).filter_map do |union, value|
      next unless union.variants.any? { alone(_1, value).fetch(:exact) }

      error = read(union, value)
      "#{union.name} #{value.inspect}: #{error.message}" if error
    end

    assert_empty(misses)
  end

  def test_a_value_every_variant_refuses_fails_its_field
    misses = UNIONS.product(SAMPLES).filter_map do |union, value|
      next unless union.variants.all? { alone(_1, value).fetch(:error) }

      "#{union.name} #{value.inspect}" unless read(union, value)
    end

    assert_empty(misses)
  end
end
