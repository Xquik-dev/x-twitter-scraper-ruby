# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class UserTipJar < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute bandcamp_handle
      #
      #   @return [String, nil]
      optional :bandcamp_handle, String, api_name: :bandcampHandle

      # @!attribute bitcoin_handle
      #
      #   @return [String, nil]
      optional :bitcoin_handle, String, api_name: :bitcoinHandle

      # @!attribute cash_app_handle
      #
      #   @return [String, nil]
      optional :cash_app_handle, String, api_name: :cashAppHandle

      # @!attribute ethereum_handle
      #
      #   @return [String, nil]
      optional :ethereum_handle, String, api_name: :ethereumHandle

      # @!attribute gofundme_handle
      #
      #   @return [String, nil]
      optional :gofundme_handle, String, api_name: :gofundmeHandle

      # @!attribute is_enabled
      #
      #   @return [Boolean, nil]
      optional :is_enabled, XTwitterScraper::Internal::Type::Boolean, api_name: :isEnabled

      # @!attribute patreon_handle
      #
      #   @return [String, nil]
      optional :patreon_handle, String, api_name: :patreonHandle

      # @!attribute pay_pal_handle
      #
      #   @return [String, nil]
      optional :pay_pal_handle, String, api_name: :payPalHandle

      # @!attribute venmo_handle
      #
      #   @return [String, nil]
      optional :venmo_handle, String, api_name: :venmoHandle

      # @!method initialize(bandcamp_handle: nil, bitcoin_handle: nil, cash_app_handle: nil, ethereum_handle: nil, gofundme_handle: nil, is_enabled: nil, patreon_handle: nil, pay_pal_handle: nil, venmo_handle: nil)
      #   Public payment and creator-support handles shown on X.
      #
      #   @param bandcamp_handle [String]
      #   @param bitcoin_handle [String]
      #   @param cash_app_handle [String]
      #   @param ethereum_handle [String]
      #   @param gofundme_handle [String]
      #   @param is_enabled [Boolean]
      #   @param patreon_handle [String]
      #   @param pay_pal_handle [String]
      #   @param venmo_handle [String]
    end
  end
end
