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

        # Present on cursor-paginated responses.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_more

        sig { params(has_more: T::Boolean).void }
        attr_writer :has_more

        # Pass unchanged as cursor when hasMore is true.
        sig { returns(T.nilable(String)) }
        attr_reader :next_cursor

        sig { params(next_cursor: String).void }
        attr_writer :next_cursor

        sig do
          params(
            accounts: T::Array[XTwitterScraper::X::XAccount::OrHash],
            has_more: T::Boolean,
            next_cursor: String
          ).returns(T.attached_class)
        end
        def self.new(
          accounts:,
          # Present on cursor-paginated responses.
          has_more: nil,
          # Pass unchanged as cursor when hasMore is true.
          next_cursor: nil
        )
        end

        sig do
          override.returns(
            {
              accounts: T::Array[XTwitterScraper::X::XAccount],
              has_more: T::Boolean,
              next_cursor: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
