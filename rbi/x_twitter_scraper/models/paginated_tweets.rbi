# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class PaginatedTweets < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::PaginatedTweets,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      sig { returns(String) }
      attr_accessor :next_cursor

      sig { returns(T::Array[XTwitterScraper::SearchTweet]) }
      attr_accessor :tweets

      # Paginated tweets. Source visibility, filters, or remaining credits can reduce
      # results. An empty filtered page can still have has_next_page true. Follow
      # next_cursor while has_next_page is true. Zero affordable results returns 402
      # insufficient_credits.
      sig do
        params(
          has_next_page: T::Boolean,
          next_cursor: String,
          tweets: T::Array[XTwitterScraper::SearchTweet::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(has_next_page:, next_cursor:, tweets:)
      end

      sig do
        override.returns(
          {
            has_next_page: T::Boolean,
            next_cursor: String,
            tweets: T::Array[XTwitterScraper::SearchTweet]
          }
        )
      end
      def to_hash
      end
    end
  end
end
