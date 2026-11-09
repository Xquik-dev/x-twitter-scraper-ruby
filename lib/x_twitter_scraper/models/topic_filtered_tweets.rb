# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TopicFilteredTweets < XTwitterScraper::Models::PaginatedTweets
      # @!attribute topic_filter
      #   What the topic filter asked & how many posts it kept.
      #
      #   @return [XTwitterScraper::Models::TopicFilterSummary]
      required :topic_filter, -> { XTwitterScraper::TopicFilterSummary }, api_name: :topicFilter

      # @!attribute tweets
      #
      #   @return [Array<XTwitterScraper::Models::TopicFilteredTweets::Tweet>]
      required :tweets, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::TopicFilteredTweets::Tweet] }

      # @!method initialize(topic_filter:, tweets:)
      #   Posts kept by the topic filter. Each kept post carries its topicScore. Follow
      #   next_cursor to check the next posts.
      #
      #   @param topic_filter [XTwitterScraper::Models::TopicFilterSummary] What the topic filter asked & how many posts it kept.
      #
      #   @param tweets [Array<XTwitterScraper::Models::TopicFilteredTweets::Tweet>]

      class Tweet < XTwitterScraper::Models::SearchTweet
        # @!attribute topic_score
        #   How likely the post is about the topic.
        #
        #   @return [Float]
        required :topic_score, Float, api_name: :topicScore

        # @!method initialize(topic_score:)
        #   @param topic_score [Float] How likely the post is about the topic.
      end
    end
  end
end
