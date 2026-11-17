# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class AccountConnectionLinkListResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::AccountConnectionLinkListResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Your connect links, newest first.
        sig { returns(T::Array[XTwitterScraper::X::XAccountConnectionLink]) }
        attr_accessor :links

        # Whether more links follow. Send next_cursor as cursor to read them.
        sig { returns(T::Boolean) }
        attr_accessor :has_more

        # Pass unchanged as cursor when hasMore is true.
        sig { returns(T.nilable(String)) }
        attr_reader :next_cursor

        sig { params(next_cursor: String).void }
        attr_writer :next_cursor

        sig do
          params(
            links: T::Array[XTwitterScraper::X::XAccountConnectionLink::OrHash],
            has_more: T::Boolean,
            next_cursor: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Your connect links, newest first.
          links:,
          # Whether more links follow. Send next_cursor as cursor to read them.
          has_more:,
          # Pass unchanged as cursor when hasMore is true.
          next_cursor: nil
        )
        end

        sig do
          override.returns(
            {
              links: T::Array[XTwitterScraper::X::XAccountConnectionLink],
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
