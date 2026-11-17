# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::AccountConnectionLinks#create
      class AccountConnectionLinkCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute reference
        #   Your own ID for this person. It comes back when you read the link.
        #
        #   @return [String, nil]
        optional :reference, String

        # @!attribute return_url
        #   A public https URL the page offers as a button once the account connects. Xquik
        #   never redirects by itself, and never adds the token.
        #
        #   @return [String, nil]
        optional :return_url, String, api_name: :returnUrl

        # @!attribute account_id
        #   The ID of 1 of your X accounts. The link then reconnects that account.
        #
        #   @return [String, nil]
        optional :account_id, String, api_name: :accountId

        # @!method initialize(reference: nil, return_url: nil, account_id: nil, request_options: {})
        #   @param reference [String] Your own ID for this person. It comes back when you read the link.
        #
        #   @param return_url [String] A public https URL the page offers as a button once the account connects. Xquik never redirects by itself, and never adds the token.
        #
        #   @param account_id [String] The ID of 1 of your X accounts. The link then reconnects that account.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
