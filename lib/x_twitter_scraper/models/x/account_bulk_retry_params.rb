# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Accounts#bulk_retry
      class AccountBulkRetryParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute account_ids
        #   IDs of the X accounts to retry. Accounts that failed for another reason, or
        #   belong to someone else, stay as they are.
        #
        #   @return [Array<String>, nil]
        optional :account_ids, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :accountIds

        # @!method initialize(account_ids: nil, request_options: {})
        #   @param account_ids [Array<String>] IDs of the X accounts to retry. Accounts that failed for another reason, or belo
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
