# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Styles#get_performance
    class StyleGetPerformanceResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute tweet_count
      #
      #   @return [Integer]
      required :tweet_count, Integer, api_name: :tweetCount

      # @!attribute tweets
      #
      #   @return [Array<XTwitterScraper::Models::StyleGetPerformanceResponse::Tweet>]
      required :tweets,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::StyleGetPerformanceResponse::Tweet] }

      # @!attribute x_username
      #
      #   @return [String]
      required :x_username, String, api_name: :xUsername

      # @!method initialize(tweet_count:, tweets:, x_username:)
      #   @param tweet_count [Integer]
      #   @param tweets [Array<XTwitterScraper::Models::StyleGetPerformanceResponse::Tweet>]
      #   @param x_username [String]

      class Tweet < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute bookmark_count
        #
        #   @return [Integer, nil]
        optional :bookmark_count, Integer, api_name: :bookmarkCount

        # @!attribute like_count
        #
        #   @return [Integer, nil]
        optional :like_count, Integer, api_name: :likeCount

        # @!attribute quote_count
        #
        #   @return [Integer, nil]
        optional :quote_count, Integer, api_name: :quoteCount

        # @!attribute reply_count
        #
        #   @return [Integer, nil]
        optional :reply_count, Integer, api_name: :replyCount

        # @!attribute retweet_count
        #
        #   @return [Integer, nil]
        optional :retweet_count, Integer, api_name: :retweetCount

        # @!attribute view_count
        #
        #   @return [Integer, nil]
        optional :view_count, Integer, api_name: :viewCount

        # @!method initialize(id:, text:, bookmark_count: nil, like_count: nil, quote_count: nil, reply_count: nil, retweet_count: nil, view_count: nil)
        #   @param id [String]
        #   @param text [String]
        #   @param bookmark_count [Integer]
        #   @param like_count [Integer]
        #   @param quote_count [Integer]
        #   @param reply_count [Integer]
        #   @param retweet_count [Integer]
        #   @param view_count [Integer]
      end
    end
  end
end
