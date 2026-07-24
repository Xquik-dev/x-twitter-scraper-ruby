# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class DmRetrieveHistoryParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::DmRetrieveHistoryParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :user_id

        # X handle (without the `@` prefix) of the connected X account used to read the
        # conversation. The account must be a participant in the conversation.
        sig { returns(String) }
        attr_accessor :account

        # Pagination cursor for DM history
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Legacy pagination cursor (backward compat)
        sig { returns(T.nilable(String)) }
        attr_reader :max_id

        sig { params(max_id: String).void }
        attr_writer :max_id

        sig do
          params(
            user_id: String,
            account: String,
            cursor: String,
            max_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          user_id:,
          # X handle (without the `@` prefix) of the connected X account used to read the
          # conversation. The account must be a participant in the conversation.
          account:,
          # Pagination cursor for DM history
          cursor: nil,
          # Legacy pagination cursor (backward compat)
          max_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              user_id: String,
              account: String,
              cursor: String,
              max_id: String,
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
