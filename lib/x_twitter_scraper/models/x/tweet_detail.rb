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

        # @!attribute conversation_id
        #   ID of the root tweet in the conversation thread
        #
        #   @return [String, nil]
        optional :conversation_id, String, api_name: :conversationId

        # @!attribute created_at
        #
        #   @return [String, nil]
        optional :created_at, String, api_name: :createdAt

        # @!attribute entities
        #   Parsed entities from the tweet text (URLs, mentions, hashtags, media)
        #
        #   @return [Object, nil]
        optional :entities, XTwitterScraper::Internal::Type::Unknown

        # @!attribute is_note_tweet
        #   Whether this is a Note Tweet (long-form post, up to 25,000 characters)
        #
        #   @return [Boolean, nil]
        optional :is_note_tweet, XTwitterScraper::Internal::Type::Boolean, api_name: :isNoteTweet

        # @!attribute is_quote_status
        #   Whether this tweet quotes another tweet
        #
        #   @return [Boolean, nil]
        optional :is_quote_status, XTwitterScraper::Internal::Type::Boolean, api_name: :isQuoteStatus

        # @!attribute is_reply
        #   Whether this tweet is a reply to another tweet
        #
        #   @return [Boolean, nil]
        optional :is_reply, XTwitterScraper::Internal::Type::Boolean, api_name: :isReply

        # @!attribute media
        #   Attached media items, omitted when the tweet has no media
        #
        #   @return [Array<XTwitterScraper::Models::X::TweetDetail::Media>, nil]
        optional :media, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::TweetDetail::Media] }

        # @!attribute quoted_tweet
        #   The quoted tweet object, present when isQuoteStatus is true
        #
        #   @return [Object, nil]
        optional :quoted_tweet, XTwitterScraper::Internal::Type::Unknown

        # @!attribute source
        #   Client application used to post this tweet
        #
        #   @return [String, nil]
        optional :source, String

        # @!method initialize(id:, bookmark_count:, like_count:, quote_count:, reply_count:, retweet_count:, text:, view_count:, conversation_id: nil, created_at: nil, entities: nil, is_note_tweet: nil, is_quote_status: nil, is_reply: nil, media: nil, quoted_tweet: nil, source: nil)
        #   @param id [String]
        #
        #   @param bookmark_count [Integer]
        #
        #   @param like_count [Integer]
        #
        #   @param quote_count [Integer]
        #
        #   @param reply_count [Integer]
        #
        #   @param retweet_count [Integer]
        #
        #   @param text [String]
        #
        #   @param view_count [Integer]
        #
        #   @param conversation_id [String] ID of the root tweet in the conversation thread
        #
        #   @param created_at [String]
        #
        #   @param entities [Object] Parsed entities from the tweet text (URLs, mentions, hashtags, media)
        #
        #   @param is_note_tweet [Boolean] Whether this is a Note Tweet (long-form post, up to 25,000 characters)
        #
        #   @param is_quote_status [Boolean] Whether this tweet quotes another tweet
        #
        #   @param is_reply [Boolean] Whether this tweet is a reply to another tweet
        #
        #   @param media [Array<XTwitterScraper::Models::X::TweetDetail::Media>] Attached media items, omitted when the tweet has no media
        #
        #   @param quoted_tweet [Object] The quoted tweet object, present when isQuoteStatus is true
        #
        #   @param source [String] Client application used to post this tweet

        class Media < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute media_url
          #
          #   @return [String, nil]
          optional :media_url, String, api_name: :mediaUrl

          # @!attribute type
          #
          #   @return [Symbol, XTwitterScraper::Models::X::TweetDetail::Media::Type, nil]
          optional :type, enum: -> { XTwitterScraper::X::TweetDetail::Media::Type }

          # @!attribute url
          #
          #   @return [String, nil]
          optional :url, String

          # @!method initialize(media_url: nil, type: nil, url: nil)
          #   @param media_url [String]
          #   @param type [Symbol, XTwitterScraper::Models::X::TweetDetail::Media::Type]
          #   @param url [String]

          # @see XTwitterScraper::Models::X::TweetDetail::Media#type
          module Type
            extend XTwitterScraper::Internal::Type::Enum

            PHOTO = :photo
            VIDEO = :video
            ANIMATED_GIF = :animated_gif

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
