# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class AccountConnectionLinkCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::AccountConnectionLinkCreateParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Your own ID for this person. It comes back when you read the link.
        sig { returns(T.nilable(String)) }
        attr_reader :reference

        sig { params(reference: String).void }
        attr_writer :reference

        # A public https URL the page offers as a button once the account connects. Xquik
        # never redirects by itself, and never adds the token.
        sig { returns(T.nilable(String)) }
        attr_reader :return_url

        sig { params(return_url: String).void }
        attr_writer :return_url

        # The ID of 1 of your X accounts. The link then reconnects that account.
        sig { returns(T.nilable(String)) }
        attr_reader :account_id

        sig { params(account_id: String).void }
        attr_writer :account_id

        sig do
          params(
            reference: String,
            return_url: String,
            account_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Your own ID for this person. It comes back when you read the link.
          reference: nil,
          # A public https URL the page offers as a button once the account connects. Xquik
          # never redirects by itself, and never adds the token.
          return_url: nil,
          # The ID of 1 of your X accounts. The link then reconnects that account.
          account_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              reference: String,
              return_url: String,
              account_id: String,
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
