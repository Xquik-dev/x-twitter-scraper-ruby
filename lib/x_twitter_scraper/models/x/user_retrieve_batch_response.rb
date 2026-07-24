# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_batch
      class UserRetrieveBatchResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute has_next_page
        #   Batch lookups never paginate.
        #
        #   @return [Boolean, false]
        required :has_next_page, const: false

        # @!attribute next_cursor
        #   Empty because batch lookups never paginate.
        #
        #   @return [String]
        required :next_cursor, String

        # @!attribute processed_count
        #   Number of requested IDs included in the lookup.
        #
        #   @return [Integer]
        required :processed_count, Integer

        # @!attribute requested_count
        #   Number of unique IDs requested.
        #
        #   @return [Integer]
        required :requested_count, Integer

        # @!attribute returned_count
        #   Number of user profiles returned and charged.
        #
        #   @return [Integer]
        required :returned_count, Integer

        # @!attribute unavailable_ids
        #   Processed IDs with no returned profile, in first-seen request order.
        #
        #   @return [Array<String>]
        required :unavailable_ids, XTwitterScraper::Internal::Type::ArrayOf[String]

        # @!attribute unprocessed_ids
        #   Requested IDs skipped because available credits limited processing. Retry these
        #   IDs after adding credits.
        #
        #   @return [Array<String>]
        required :unprocessed_ids, XTwitterScraper::Internal::Type::ArrayOf[String]

        # @!attribute users
        #
        #   @return [Array<XTwitterScraper::Models::UserProfile>]
        required :users, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::UserProfile] }

        # @!method initialize(next_cursor:, processed_count:, requested_count:, returned_count:, unavailable_ids:, unprocessed_ids:, users:, has_next_page: false)
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::UserRetrieveBatchResponse} for more details.
        #
        #   Batch user lookup results. Duplicate requested IDs are ignored while preserving
        #   first-seen order. unavailable_ids identifies processed IDs with no returned
        #   profile. unprocessed_ids identifies IDs skipped when available credits limit
        #   processing.
        #
        #   @param next_cursor [String] Empty because batch lookups never paginate.
        #
        #   @param processed_count [Integer] Number of requested IDs included in the lookup.
        #
        #   @param requested_count [Integer] Number of unique IDs requested.
        #
        #   @param returned_count [Integer] Number of user profiles returned and charged.
        #
        #   @param unavailable_ids [Array<String>] Processed IDs with no returned profile, in first-seen request order.
        #
        #   @param unprocessed_ids [Array<String>] Requested IDs skipped because available credits limited processing. Retry these
        #
        #   @param users [Array<XTwitterScraper::Models::UserProfile>]
        #
        #   @param has_next_page [Boolean, false] Batch lookups never paginate.
      end
    end
  end
end
