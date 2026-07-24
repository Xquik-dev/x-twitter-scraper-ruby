# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Credits#topup_balance
    class CreditTopupBalanceParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute dollars
      #   Amount to top up in US dollars. Minimum 10.
      #
      #   @return [Integer]
      required :dollars, Integer

      # @!attribute locale
      #   Optional checkout locale. Defaults to en.
      #
      #   @return [String, nil]
      optional :locale, String

      # @!method initialize(dollars:, locale: nil, request_options: {})
      #   @param dollars [Integer] Amount to top up in US dollars. Minimum 10.
      #
      #   @param locale [String] Optional checkout locale. Defaults to en.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
