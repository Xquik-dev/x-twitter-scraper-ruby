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

        # @!attribute author
        #   Tweet author profile. The lookup route always includes follower count and
        #   verification state. Other profile fields appear when available.
        #
        #   @return [XTwitterScraper::Models::X::TweetAuthor, nil]
        optional :author, -> { XTwitterScraper::X::TweetAuthor }

        # @!attribute content_disclosure
        #   Content disclosure metadata shown by X when a tweet is labeled as paid
        #   partnership content or AI-generated media.
        #
        #   @return [XTwitterScraper::Models::ContentDisclosure, nil]
        optional :content_disclosure, -> { XTwitterScraper::ContentDisclosure }, api_name: :contentDisclosure

        # @!attribute conversation_id
        #   ID of the root tweet in the conversation thread
        #
        #   @return [String, nil]
        optional :conversation_id, String, api_name: :conversationId

        # @!attribute created_at
        #
        #   @return [String, nil]
        optional :created_at, String, api_name: :createdAt

        # @!attribute display_text_range
        #   Start and end offsets for rendered tweet text
        #
        #   @return [Array<Integer>, nil]
        optional :display_text_range,
                 XTwitterScraper::Internal::Type::ArrayOf[Integer],
                 api_name: :displayTextRange

        # @!attribute entities
        #   Parsed entities from the tweet text (URLs, mentions, hashtags, media)
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :entities, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

        # @!attribute in_reply_to_id
        #   Tweet ID being replied to
        #
        #   @return [String, nil]
        optional :in_reply_to_id, String, api_name: :inReplyToId

        # @!attribute in_reply_to_user_id
        #   User ID being replied to
        #
        #   @return [String, nil]
        optional :in_reply_to_user_id, String, api_name: :inReplyToUserId

        # @!attribute in_reply_to_username
        #   Username being replied to
        #
        #   @return [String, nil]
        optional :in_reply_to_username, String, api_name: :inReplyToUsername

        # @!attribute is_limited_reply
        #   Whether replies are limited for this tweet
        #
        #   @return [Boolean, nil]
        optional :is_limited_reply, XTwitterScraper::Internal::Type::Boolean, api_name: :isLimitedReply

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

        # @!attribute lang
        #   Tweet language code
        #
        #   @return [String, nil]
        optional :lang, String

        # @!attribute media
        #   Attached media items, omitted when the tweet has no media
        #
        #   @return [Array<XTwitterScraper::Models::TweetMedia>, nil]
        optional :media, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetMedia] }

        # @!attribute quoted_tweet
        #   Quoted or retweeted tweet context. Every object includes id, text, and
        #   engagement metrics. A zero metric can mean X did not report the count. Author,
        #   media, and conversation fields appear when available.
        #
        #   @return [XTwitterScraper::Models::EmbeddedTweet, nil]
        optional :quoted_tweet, -> { XTwitterScraper::EmbeddedTweet }

        # @!attribute retweeted_tweet
        #   Quoted or retweeted tweet context. Every object includes id, text, and
        #   engagement metrics. A zero metric can mean X did not report the count. Author,
        #   media, and conversation fields appear when available.
        #
        #   @return [XTwitterScraper::Models::EmbeddedTweet, nil]
        optional :retweeted_tweet, -> { XTwitterScraper::EmbeddedTweet }

        # @!attribute source
        #   Client application used to post this tweet
        #
        #   @return [String, nil]
        optional :source, String

        # @!attribute type
        #   Tweet result type
        #
        #   @return [String, nil]
        optional :type, String

        # @!attribute url
        #   Tweet permalink URL
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(id:, bookmark_count:, like_count:, quote_count:, reply_count:, retweet_count:, text:, view_count:, author: nil, content_disclosure: nil, conversation_id: nil, created_at: nil, display_text_range: nil, entities: nil, in_reply_to_id: nil, in_reply_to_user_id: nil, in_reply_to_username: nil, is_limited_reply: nil, is_note_tweet: nil, is_quote_status: nil, is_reply: nil, lang: nil, media: nil, quoted_tweet: nil, retweeted_tweet: nil, source: nil, type: nil, url: nil)
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::TweetDetail} for more details.
        #
        #   Full tweet with text, engagement metrics, media, and metadata. A zero metric can
        #   mean X did not report the count.
        #
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
        #   @param author [XTwitterScraper::Models::X::TweetAuthor] Tweet author profile. The lookup route always includes follower count and verifi
        #
        #   @param content_disclosure [XTwitterScraper::Models::ContentDisclosure] Content disclosure metadata shown by X when a tweet is labeled as paid partnersh
        #
        #   @param conversation_id [String] ID of the root tweet in the conversation thread
        #
        #   @param created_at [String]
        #
        #   @param display_text_range [Array<Integer>] Start and end offsets for rendered tweet text
        #
        #   @param entities [Hash{Symbol=>Object}] Parsed entities from the tweet text (URLs, mentions, hashtags, media)
        #
        #   @param in_reply_to_id [String] Tweet ID being replied to
        #
        #   @param in_reply_to_user_id [String] User ID being replied to
        #
        #   @param in_reply_to_username [String] Username being replied to
        #
        #   @param is_limited_reply [Boolean] Whether replies are limited for this tweet
        #
        #   @param is_note_tweet [Boolean] Whether this is a Note Tweet (long-form post, up to 25,000 characters)
        #
        #   @param is_quote_status [Boolean] Whether this tweet quotes another tweet
        #
        #   @param is_reply [Boolean] Whether this tweet is a reply to another tweet
        #
        #   @param lang [String] Tweet language code
        #
        #   @param media [Array<XTwitterScraper::Models::TweetMedia>] Attached media items, omitted when the tweet has no media
        #
        #   @param quoted_tweet [XTwitterScraper::Models::EmbeddedTweet] Quoted or retweeted tweet context. Every object includes id, text, and engagemen
        #
        #   @param retweeted_tweet [XTwitterScraper::Models::EmbeddedTweet] Quoted or retweeted tweet context. Every object includes id, text, and engagemen
        #
        #   @param source [String] Client application used to post this tweet
        #
        #   @param type [String] Tweet result type
        #
        #   @param url [String] Tweet permalink URL
      end
    end
  end
end
