# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class UserRetrieveBatchResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::UserRetrieveBatchResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Batch lookups never paginate.
        sig { returns(T::Boolean) }
        attr_accessor :has_next_page

        # Empty because batch lookups never paginate.
        sig { returns(String) }
        attr_accessor :next_cursor

        # Number of requested IDs included in the lookup.
        sig { returns(Integer) }
        attr_accessor :processed_count

        # Number of unique IDs requested.
        sig { returns(Integer) }
        attr_accessor :requested_count

        # Number of user profiles returned and charged.
        sig { returns(Integer) }
        attr_accessor :returned_count

        # Processed IDs with no returned profile, in first-seen request order.
        sig { returns(T::Array[String]) }
        attr_accessor :unavailable_ids

        # Requested IDs skipped because available credits limited processing. Retry these
        # IDs after adding credits.
        sig { returns(T::Array[String]) }
        attr_accessor :unprocessed_ids

        sig { returns(T::Array[XTwitterScraper::UserProfile]) }
        attr_accessor :users

        # Batch user lookup results. Duplicate requested IDs are ignored while preserving
        # first-seen order. unavailable_ids identifies processed IDs with no returned
        # profile. unprocessed_ids identifies IDs skipped when available credits limit
        # processing.
        sig do
          params(
            next_cursor: String,
            processed_count: Integer,
            requested_count: Integer,
            returned_count: Integer,
            unavailable_ids: T::Array[String],
            unprocessed_ids: T::Array[String],
            users: T::Array[XTwitterScraper::UserProfile::OrHash],
            has_next_page: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Empty because batch lookups never paginate.
          next_cursor:,
          # Number of requested IDs included in the lookup.
          processed_count:,
          # Number of unique IDs requested.
          requested_count:,
          # Number of user profiles returned and charged.
          returned_count:,
          # Processed IDs with no returned profile, in first-seen request order.
          unavailable_ids:,
          # Requested IDs skipped because available credits limited processing. Retry these
          # IDs after adding credits.
          unprocessed_ids:,
          users:,
          # Batch lookups never paginate.
          has_next_page: false
        )
        end

        sig do
          override.returns(
            {
              has_next_page: T::Boolean,
              next_cursor: String,
              processed_count: Integer,
              requested_count: Integer,
              returned_count: Integer,
              unavailable_ids: T::Array[String],
              unprocessed_ids: T::Array[String],
              users: T::Array[XTwitterScraper::UserProfile]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
