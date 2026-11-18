# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class SpaceSearchResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::SpaceSearchResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Public Spaces, each once. Latest & Top list them in the order the posts share
        # them. Live & Upcoming keep X's order.
        sig { returns(T::Array[XTwitterScraper::Models::Space]) }
        attr_reader :spaces

        sig do
          params(spaces: T::Array[XTwitterScraper::Models::Space::OrHash]).void
        end
        attr_writer :spaces

        sig { returns(T::Boolean) }
        attr_accessor :has_next_page

        # Cursor for the next page. Send it unchanged. Each next page arrives fast.
        sig { returns(String) }
        attr_accessor :next_cursor

        sig do
          params(
            spaces: T::Array[XTwitterScraper::Models::Space::OrHash],
            has_next_page: T::Boolean,
            next_cursor: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Public Spaces, each once. Latest & Top list them in the order the posts share
          # them. Live & Upcoming keep X's order.
          spaces:,
          has_next_page:,
          # Cursor for the next page. Send it unchanged. Each next page arrives fast.
          next_cursor:
        )
        end

        sig do
          override.returns(
            {
              spaces: T::Array[XTwitterScraper::Models::Space],
              has_next_page: T::Boolean,
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
