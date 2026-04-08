# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Communities
        # @see XTwitterScraper::Resources::X::Communities::Tweets#list
        class TweetListResponse < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute has_next_page
          #
          #   @return [Boolean]
          required :has_next_page, XTwitterScraper::Internal::Type::Boolean

          # @!attribute next_cursor
          #
          #   @return [String]
          required :next_cursor, String

          # @!attribute tweets
          #
          #   @return [Array<XTwitterScraper::Models::X::Communities::TweetListResponse::Tweet>]
          required :tweets,
                   -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::Communities::TweetListResponse::Tweet] }

          # @!method initialize(has_next_page:, next_cursor:, tweets:)
          #   Paginated list of tweets with cursor-based navigation.
          #
          #   @param has_next_page [Boolean]
          #   @param next_cursor [String]
          #   @param tweets [Array<XTwitterScraper::Models::X::Communities::TweetListResponse::Tweet>]

          class Tweet < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String]
            required :id, String

            # @!attribute text
            #
            #   @return [String]
            required :text, String

            # @!attribute author
            #
            #   @return [XTwitterScraper::Models::X::Communities::TweetListResponse::Tweet::Author, nil]
            optional :author, -> { XTwitterScraper::Models::X::Communities::TweetListResponse::Tweet::Author }

            # @!attribute bookmark_count
            #
            #   @return [Integer, nil]
            optional :bookmark_count, Integer, api_name: :bookmarkCount

            # @!attribute created_at
            #
            #   @return [String, nil]
            optional :created_at, String, api_name: :createdAt

            # @!attribute is_note_tweet
            #   True for Note Tweets (long-form content, up to 25,000 characters)
            #
            #   @return [Boolean, nil]
            optional :is_note_tweet, XTwitterScraper::Internal::Type::Boolean, api_name: :isNoteTweet

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

            # @!method initialize(id:, text:, author: nil, bookmark_count: nil, created_at: nil, is_note_tweet: nil, like_count: nil, quote_count: nil, reply_count: nil, retweet_count: nil, view_count: nil)
            #   Tweet returned from search results with inline author info.
            #
            #   @param id [String]
            #
            #   @param text [String]
            #
            #   @param author [XTwitterScraper::Models::X::Communities::TweetListResponse::Tweet::Author]
            #
            #   @param bookmark_count [Integer]
            #
            #   @param created_at [String]
            #
            #   @param is_note_tweet [Boolean] True for Note Tweets (long-form content, up to 25,000 characters)
            #
            #   @param like_count [Integer]
            #
            #   @param quote_count [Integer]
            #
            #   @param reply_count [Integer]
            #
            #   @param retweet_count [Integer]
            #
            #   @param view_count [Integer]

            # @see XTwitterScraper::Models::X::Communities::TweetListResponse::Tweet#author
            class Author < XTwitterScraper::Internal::Type::BaseModel
              # @!attribute id
              #
              #   @return [String]
              required :id, String

              # @!attribute name
              #
              #   @return [String]
              required :name, String

              # @!attribute username
              #
              #   @return [String]
              required :username, String

              # @!attribute verified
              #
              #   @return [Boolean, nil]
              optional :verified, XTwitterScraper::Internal::Type::Boolean

              # @!method initialize(id:, name:, username:, verified: nil)
              #   @param id [String]
              #   @param name [String]
              #   @param username [String]
              #   @param verified [Boolean]
            end
          end
        end
      end
    end
  end
end
