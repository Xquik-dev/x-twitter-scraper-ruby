# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TopicFilteredTweets < XTwitterScraper::Models::PaginatedTweets
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::TopicFilteredTweets,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # What the topic filter asked & how many posts it kept.
      sig { returns(XTwitterScraper::Models::TopicFilterSummary) }
      attr_reader :topic_filter

      sig do
        params(
          topic_filter: XTwitterScraper::Models::TopicFilterSummary::OrHash
        ).void
      end
      attr_writer :topic_filter

      sig do
        returns(T::Array[XTwitterScraper::Models::TopicFilteredTweets::Tweet])
      end
      attr_accessor :tweets

      # Posts kept by the topic filter. Each kept post carries its topicScore. Follow
      # next_cursor to check the next posts.
      sig do
        params(
          topic_filter: XTwitterScraper::Models::TopicFilterSummary::OrHash,
          tweets:
            T::Array[
              XTwitterScraper::Models::TopicFilteredTweets::Tweet::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        # What the topic filter asked & how many posts it kept.
        topic_filter:,
        tweets:
      )
      end

      sig do
        override.returns(
          {
            topic_filter: XTwitterScraper::Models::TopicFilterSummary,
            tweets:
              T::Array[XTwitterScraper::Models::TopicFilteredTweets::Tweet]
          }
        )
      end
      def to_hash
      end

      class Tweet < XTwitterScraper::Models::SearchTweet
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::TopicFilteredTweets::Tweet,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # How likely the post is about the topic.
        sig { returns(Float) }
        attr_accessor :topic_score

        sig { params(topic_score: Float).returns(T.attached_class) }
        def self.new(
          # How likely the post is about the topic.
          topic_score:
        )
        end

        sig { override.returns({ topic_score: Float }) }
        def to_hash
        end
      end
    end
  end
end
