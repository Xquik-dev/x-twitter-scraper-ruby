# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Subscribe#create
    class SubscribeCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute tier
      #   Subscription tier to pre-select.
      #
      #   @return [Symbol, XTwitterScraper::Models::SubscribeCreateParams::Tier, nil]
      optional :tier, enum: -> { XTwitterScraper::SubscribeCreateParams::Tier }

      # @!method initialize(tier: nil, request_options: {})
      #   @param tier [Symbol, XTwitterScraper::Models::SubscribeCreateParams::Tier] Subscription tier to pre-select.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      # Subscription tier to pre-select.
      module Tier
        extend XTwitterScraper::Internal::Type::Enum

        STARTER = :starter
        PRO = :pro
        BUSINESS = :business

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
