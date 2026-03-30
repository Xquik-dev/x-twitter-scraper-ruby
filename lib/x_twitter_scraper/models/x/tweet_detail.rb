# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      class TweetDetail < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute bookmark_count
        #
        #   @return [Integer]
        required :bookmark_count, Integer, api_name: :bookmarkCount

        # @!attribute like_count
        #
        #   @return [Integer]
        required :like_count, Integer, api_name: :likeCount

        # @!attribute quote_count
        #
        #   @return [Integer]
        required :quote_count, Integer, api_name: :quoteCount

        # @!attribute reply_count
        #
        #   @return [Integer]
        required :reply_count, Integer, api_name: :replyCount

        # @!attribute retweet_count
        #
        #   @return [Integer]
        required :retweet_count, Integer, api_name: :retweetCount

        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute view_count
        #
        #   @return [Integer]
        required :view_count, Integer, api_name: :viewCount

        # @!attribute created_at
        #
        #   @return [String, nil]
        optional :created_at, String, api_name: :createdAt

        # @!method initialize(id:, bookmark_count:, like_count:, quote_count:, reply_count:, retweet_count:, text:, view_count:, created_at: nil)
        #   @param id [String]
        #   @param bookmark_count [Integer]
        #   @param like_count [Integer]
        #   @param quote_count [Integer]
        #   @param reply_count [Integer]
        #   @param retweet_count [Integer]
        #   @param text [String]
        #   @param view_count [Integer]
        #   @param created_at [String]
      end
    end
  end
end
