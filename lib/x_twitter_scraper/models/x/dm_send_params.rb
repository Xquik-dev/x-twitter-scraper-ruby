# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Dm#send_
      class DmSendParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute account
        #   X account (@username or ID) sending the DM
        #
        #   @return [String]
        required :account, String

        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute idempotency_key
        #
        #   @return [String]
        required :idempotency_key, String

        # @!attribute media_ids
        #   Optional array containing exactly 1 uploaded media ID.
        #
        #   @return [Array<String>, nil]
        optional :media_ids, XTwitterScraper::Internal::Type::ArrayOf[String]

        # @!method initialize(user_id:, account:, text:, idempotency_key:, media_ids: nil, request_options: {})
        #   @param user_id [String]
        #
        #   @param account [String] X account (@username or ID) sending the DM
        #
        #   @param text [String]
        #
        #   @param idempotency_key [String]
        #
        #   @param media_ids [Array<String>] Optional array containing exactly 1 uploaded media ID.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
