# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Accounts#bulk_retry
      class AccountBulkRetryResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute cleared
        #   Number of accounts cleared
        #
        #   @return [Integer]
        required :cleared, Integer

        # @!method initialize(cleared:)
        #   @param cleared [Integer] Number of accounts cleared
      end
    end
  end
end
