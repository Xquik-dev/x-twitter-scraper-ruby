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

      # @!attribute return_path
      #   Optional Xquik tool page to return to after Checkout, such as
      #   /en/x-article-reader.
      #
      #   @return [String, nil]
      optional :return_path, String, api_name: :returnPath

      # @!method initialize(dollars:, locale: nil, return_path: nil, request_options: {})
      #   @param dollars [Integer] Amount to top up in US dollars. Minimum 10.
      #
      #   @param locale [String] Optional checkout locale. Defaults to en.
      #
      #   @param return_path [String] Optional Xquik tool page to return to after Checkout, such as /en/x-article-read
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
