# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class AccountListParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::AccountListParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Previous nextCursor. The after alias also works. Offset pagination is not
        # supported.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Maximum items per page, from 1 to 10,000. Default 50. A low credit balance can
        # return fewer paid results. When it covers none, the answer is 402
        # insufficient_credits.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        sig do
          params(
            cursor: String,
            limit: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Previous nextCursor. The after alias also works. Offset pagination is not
          # supported.
          cursor: nil,
          # Maximum items per page, from 1 to 10,000. Default 50. A low credit balance can
          # return fewer paid results. When it covers none, the answer is 402
          # insufficient_credits.
          limit: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              cursor: String,
              limit: Integer,
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
