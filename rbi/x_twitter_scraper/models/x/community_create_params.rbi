# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class CommunityCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::CommunityCreateParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # X account (@username or ID) creating the community
        sig { returns(String) }
        attr_accessor :account

        # Community name
        sig { returns(String) }
        attr_accessor :name

        sig { returns(String) }
        attr_accessor :idempotency_key

        # Community description
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig do
          params(
            account: String,
            name: String,
            idempotency_key: String,
            description: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # X account (@username or ID) creating the community
          account:,
          # Community name
          name:,
          idempotency_key:,
          # Community description
          description: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account: String,
              name: String,
              idempotency_key: String,
              description: String,
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
