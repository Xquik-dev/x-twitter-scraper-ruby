# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PostMetricPoint < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute value
      #
      #   @return [Integer, nil]
      required :value, Integer, nil?: true

      # @!attribute gain
      #
      #   @return [Integer, nil]
      required :gain, Integer, nil?: true

      # @!method initialize(value:, gain:)
      #   A metric's value at the hour's end & its gain over that hour. Both are null when
      #   X shows no count.
      #
      #   @param value [Integer, nil]
      #
      #   @param gain [Integer, nil]
    end
  end
end
