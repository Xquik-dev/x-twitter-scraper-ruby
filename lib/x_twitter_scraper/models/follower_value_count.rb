# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FollowerValueCount < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute count
      #
      #   @return [Integer]
      required :count, Integer

      # @!attribute percent
      #
      #   @return [Float]
      required :percent, Float

      # @!attribute value
      #
      #   @return [String]
      required :value, String

      # @!method initialize(count:, percent:, value:)
      #   How many followers share 1 value, such as a language or place.
      #
      #   @param count [Integer]
      #
      #   @param percent [Float]
      #
      #   @param value [String]
    end
  end
end
