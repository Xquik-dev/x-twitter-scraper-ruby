# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class AccountBulkRetryParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::AccountBulkRetryParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # IDs of the X accounts to retry. Accounts that failed for another reason, or
        # belong to someone else, stay as they are.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :account_ids

        sig { params(account_ids: T::Array[String]).void }
        attr_writer :account_ids

        sig do
          params(
            account_ids: T::Array[String],
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # IDs of the X accounts to retry. Accounts that failed for another reason, or
          # belong to someone else, stay as they are.
          account_ids: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account_ids: T::Array[String],
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
