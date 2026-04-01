# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#retrieve
      class TweetRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute tweet
        #
        #   @return [XTwitterScraper::Models::X::TweetRetrieveResponse::Tweet]
        required :tweet, -> { XTwitterScraper::Models::X::TweetRetrieveResponse::Tweet }

        # @!attribute author
        #
        #   @return [XTwitterScraper::Models::X::TweetRetrieveResponse::Author, nil]
        optional :author, -> { XTwitterScraper::Models::X::TweetRetrieveResponse::Author }

        # @!method initialize(tweet:, author: nil)
        #   @param tweet [XTwitterScraper::Models::X::TweetRetrieveResponse::Tweet]
        #   @param author [XTwitterScraper::Models::X::TweetRetrieveResponse::Author]

        # @see XTwitterScraper::Models::X::TweetRetrieveResponse#tweet
        class Tweet < XTwitterScraper::Internal::Type::BaseModel
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

        # @see XTwitterScraper::Models::X::TweetRetrieveResponse#author
        class Author < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute followers
          #
          #   @return [Integer]
          required :followers, Integer

          # @!attribute username
          #
          #   @return [String]
          required :username, String

          # @!attribute verified
          #
          #   @return [Boolean]
          required :verified, XTwitterScraper::Internal::Type::Boolean

          # @!attribute profile_picture
          #
          #   @return [String, nil]
          optional :profile_picture, String, api_name: :profilePicture

          # @!method initialize(id:, followers:, username:, verified:, profile_picture: nil)
          #   @param id [String]
          #   @param followers [Integer]
          #   @param username [String]
          #   @param verified [Boolean]
          #   @param profile_picture [String]
        end
      end
    end
  end
end
