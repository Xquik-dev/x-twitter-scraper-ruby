# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PostMetricReading < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute current
      #
      #   @return [Integer, nil]
      required :current, Integer, nil?: true

      # @!attribute gain
      #
      #   @return [Integer, nil]
      required :gain, Integer, nil?: true

      # @!method initialize(current:, gain:)
      #   A metric's current value & its gain since tracking began. Both are null when X
      #   shows no count, as for views on old posts.
      #
      #   @param current [Integer, nil]
      #
      #   @param gain [Integer, nil]
    end
  end
end
