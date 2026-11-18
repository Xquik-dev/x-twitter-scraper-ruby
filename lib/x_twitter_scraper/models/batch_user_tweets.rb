# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class BatchUserTweets < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute tweets
      #
      #   @return [Array<XTwitterScraper::Models::SearchTweet>]
      required :tweets, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SearchTweet] }

      # @!attribute has_next_page
      #   Always false. The answer holds every post in 1 page.
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #   Always empty. The answer holds every post in 1 page.
      #
      #   @return [String]
      required :next_cursor, String

      # @!attribute unavailable_ids
      #   Users with no account on X or with protected posts, in first-seen request order.
      #   They cost nothing. not_found_ids, suspended_ids and protected_ids split them by
      #   X's answer.
      #
      #   @return [Array<String>]
      required :unavailable_ids, XTwitterScraper::Internal::Type::ArrayOf[String]

      # @!attribute not_found_ids
      #   The unavailable users no account holds, as X answers for an account that was
      #   deactivated or deleted, in first-seen request order.
      #
      #   @return [Array<String>]
      required :not_found_ids, XTwitterScraper::Internal::Type::ArrayOf[String]

      # @!attribute suspended_ids
      #   The unavailable users X suspended, in first-seen request order.
      #
      #   @return [Array<String>]
      required :suspended_ids, XTwitterScraper::Internal::Type::ArrayOf[String]

      # @!attribute protected_ids
      #   The unavailable users whose posts only approved followers see, in first-seen
      #   request order.
      #
      #   @return [Array<String>]
      required :protected_ids, XTwitterScraper::Internal::Type::ArrayOf[String]

      # @!attribute unprocessed_ids
      #   Users the call did not read, in first-seen request order. Their read failed, the
      #   call ran out of time or credits ran out. They cost nothing. Send them again.
      #
      #   @return [Array<String>]
      required :unprocessed_ids, XTwitterScraper::Internal::Type::ArrayOf[String]

      # @!method initialize(tweets:, has_next_page:, next_cursor:, unavailable_ids:, not_found_ids:, suspended_ids:, protected_ids:, unprocessed_ids:)
      #   Each user's newest posts, in the order the users were named, with the pinned
      #   post first. The ID lists name the requested IDs or usernames. They name a
      #   profile link by its username.
      #
      #   @param tweets [Array<XTwitterScraper::Models::SearchTweet>]
      #
      #   @param has_next_page [Boolean] Always false. The answer holds every post in 1 page.
      #
      #   @param next_cursor [String] Always empty. The answer holds every post in 1 page.
      #
      #   @param unavailable_ids [Array<String>] Users with no account on X or with protected posts, in first-seen request order. They cost nothing. not_found_ids, suspended_ids and protected_ids split them by X's answer.
      #
      #   @param not_found_ids [Array<String>] The unavailable users no account holds, as X answers for an account that was deactivated or deleted, in first-seen request order.
      #
      #   @param suspended_ids [Array<String>] The unavailable users X suspended, in first-seen request order.
      #
      #   @param protected_ids [Array<String>] The unavailable users whose posts only approved followers see, in first-seen request order.
      #
      #   @param unprocessed_ids [Array<String>] Users the call did not read, in first-seen request order. Their read failed, the call ran out of time or credits ran out. They cost nothing. Send them again.
    end
  end
end
