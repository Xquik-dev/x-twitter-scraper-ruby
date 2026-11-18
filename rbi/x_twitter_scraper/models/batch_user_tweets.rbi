# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class BatchUserTweets < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::BatchUserTweets,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::Models::SearchTweet]) }
      attr_reader :tweets

      sig do
        params(
          tweets: T::Array[XTwitterScraper::Models::SearchTweet::OrHash]
        ).void
      end
      attr_writer :tweets

      # Always false. The answer holds every post in 1 page.
      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      # Always empty. The answer holds every post in 1 page.
      sig { returns(String) }
      attr_accessor :next_cursor

      # Users with no account on X or with protected posts, in first-seen request order.
      # They cost nothing. not_found_ids, suspended_ids and protected_ids split them by
      # X's answer.
      sig { returns(T::Array[String]) }
      attr_accessor :unavailable_ids

      # The unavailable users no account holds, as X answers for an account that was
      # deactivated or deleted, in first-seen request order.
      sig { returns(T::Array[String]) }
      attr_accessor :not_found_ids

      # The unavailable users X suspended, in first-seen request order.
      sig { returns(T::Array[String]) }
      attr_accessor :suspended_ids

      # The unavailable users whose posts only approved followers see, in first-seen
      # request order.
      sig { returns(T::Array[String]) }
      attr_accessor :protected_ids

      # Users the call did not read, in first-seen request order. Their read failed, the
      # call ran out of time or credits ran out. They cost nothing. Send them again.
      sig { returns(T::Array[String]) }
      attr_accessor :unprocessed_ids

      sig do
        params(
          tweets: T::Array[XTwitterScraper::Models::SearchTweet::OrHash],
          has_next_page: T::Boolean,
          next_cursor: String,
          unavailable_ids: T::Array[String],
          not_found_ids: T::Array[String],
          suspended_ids: T::Array[String],
          protected_ids: T::Array[String],
          unprocessed_ids: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(
        tweets:,
        # Always false. The answer holds every post in 1 page.
        has_next_page:,
        # Always empty. The answer holds every post in 1 page.
        next_cursor:,
        # Users with no account on X or with protected posts, in first-seen request order.
        # They cost nothing. not_found_ids, suspended_ids and protected_ids split them by
        # X's answer.
        unavailable_ids:,
        # The unavailable users no account holds, as X answers for an account that was
        # deactivated or deleted, in first-seen request order.
        not_found_ids:,
        # The unavailable users X suspended, in first-seen request order.
        suspended_ids:,
        # The unavailable users whose posts only approved followers see, in first-seen
        # request order.
        protected_ids:,
        # Users the call did not read, in first-seen request order. Their read failed, the
        # call ran out of time or credits ran out. They cost nothing. Send them again.
        unprocessed_ids:
      )
      end

      sig do
        override.returns(
          {
            tweets: T::Array[XTwitterScraper::Models::SearchTweet],
            has_next_page: T::Boolean,
            next_cursor: String,
            unavailable_ids: T::Array[String],
            not_found_ids: T::Array[String],
            suspended_ids: T::Array[String],
            protected_ids: T::Array[String],
            unprocessed_ids: T::Array[String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
