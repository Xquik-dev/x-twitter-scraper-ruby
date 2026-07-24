# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Communities#delete
      class CommunityDeleteParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute account
        #   X account (@username or ID) deleting the community
        #
        #   @return [String]
        required :account, String

        # @!attribute community_name
        #   Community name for confirmation
        #
        #   @return [String]
        required :community_name, String

        # @!attribute idempotency_key
        #
        #   @return [String]
        required :idempotency_key, String

        # @!method initialize(id:, account:, community_name:, idempotency_key:, request_options: {})
        #   @param id [String]
        #
        #   @param account [String] X account (@username or ID) deleting the community
        #
        #   @param community_name [String] Community name for confirmation
        #
        #   @param idempotency_key [String]
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
