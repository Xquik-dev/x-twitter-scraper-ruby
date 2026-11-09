# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class AccountBasedIn < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute value
      #
      #   @return [String]
      required :value, String

      # @!attribute level
      #
      #   @return [Symbol, XTwitterScraper::Models::AccountBasedIn::Level]
      required :level, enum: -> { XTwitterScraper::AccountBasedIn::Level }

      # @!attribute observed_at
      #
      #   @return [Time]
      required :observed_at, Time, api_name: :observedAt

      # @!method initialize(value:, level:, observed_at:)
      #   Null when X shows no label.
      #
      #   @param value [String]
      #   @param level [Symbol, XTwitterScraper::Models::AccountBasedIn::Level]
      #   @param observed_at [Time]

      # @see XTwitterScraper::Models::AccountBasedIn#level
      module Level
        extend XTwitterScraper::Internal::Type::Enum

        COUNTRY = :country
        REGION = :region

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
