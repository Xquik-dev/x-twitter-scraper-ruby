# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "date"

module XTwitterScraper::Test::MockPayload
  module_function

  def example(type, active = Set.new)
    case type
    when Class
      return model(type, active) if type < XTwitterScraper::Internal::Type::BaseModel
      return "x" if type == String
      return 1 if type == Integer
      return 1.0 if type == Float
      return true if type == XTwitterScraper::Internal::Type::Boolean
      return "2026-01-01T00:00:00Z" if type == Time
      return "2026-01-01" if type == Date
      return nil if type == NilClass
    when Symbol
      return type
    end

    if type.is_a?(Module) && type.singleton_class.ancestors.include?(XTwitterScraper::Internal::Type::Enum)
      return type.values.first
    end
    return [] if type.is_a?(XTwitterScraper::Internal::Type::ArrayOf)
    return {} if type.is_a?(XTwitterScraper::Internal::Type::HashOf)
    if type.is_a?(Module) && type.singleton_class.ancestors.include?(XTwitterScraper::Internal::Type::Union)
      return example(type.variants.first, active)
    end
    return {} if type == XTwitterScraper::Internal::Type::Unknown

    raise TypeError, "Unsupported mock type: #{type.inspect}"
  end

  def model(type, active)
    return {} if active.include?(type)

    type.fields.each_with_object({}) do |(_name, field), payload|
      next unless field.fetch(:required)

      const = field.fetch(:const)
      payload[field.fetch(:api_name)] =
        if const != XTwitterScraper::Internal::OMIT
          const
        elsif field.fetch(:nilable)
          nil
        else
          example(field.fetch(:type), active | [type])
        end
    end
  end
end
