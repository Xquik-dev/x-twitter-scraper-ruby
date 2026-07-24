# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class AccountListResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::AccountListResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T::Array[XTwitterScraper::X::XAccount]) }
        attr_accessor :accounts

        sig do
          params(
            accounts: T::Array[XTwitterScraper::X::XAccount::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(accounts:)
        end

        sig do
          override.returns({ accounts: T::Array[XTwitterScraper::X::XAccount] })
        end
        def to_hash
        end
      end
    end
  end
end
