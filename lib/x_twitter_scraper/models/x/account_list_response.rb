# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Accounts#list
      class AccountListResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute accounts
        #
        #   @return [Array<XTwitterScraper::Models::X::XAccount>]
        required :accounts, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::XAccount] }

        # @!method initialize(accounts:)
        #   @param accounts [Array<XTwitterScraper::Models::X::XAccount>]
      end
    end
  end
end
