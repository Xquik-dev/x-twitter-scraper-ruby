# typed: strong

module XTwitterScraper
  module Models
    class SearchTweet < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::SearchTweet,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Integer) }
      attr_accessor :bookmark_count

      sig { returns(Integer) }
      attr_accessor :like_count

      sig { returns(Integer) }
      attr_accessor :quote_count

      sig { returns(Integer) }
      attr_accessor :reply_count

      sig { returns(Integer) }
      attr_accessor :retweet_count

      sig { returns(String) }
      attr_accessor :text

      sig { returns(Integer) }
      attr_accessor :view_count

      # X user profile with bio, follower counts, and verification status.
      sig { returns(T.nilable(XTwitterScraper::UserProfile)) }
      attr_reader :author

      sig { params(author: XTwitterScraper::UserProfile::OrHash).void }
      attr_writer :author

      # Content disclosure metadata shown by X when a tweet is labeled as paid
      # partnership content or AI-generated media.
      sig { returns(T.nilable(XTwitterScraper::ContentDisclosure)) }
      attr_reader :content_disclosure

      sig do
        params(
          content_disclosure: XTwitterScraper::ContentDisclosure::OrHash
        ).void
      end
      attr_writer :content_disclosure

      # Root tweet ID for the search result conversation
      sig { returns(T.nilable(String)) }
      attr_reader :conversation_id

      sig { params(conversation_id: String).void }
      attr_writer :conversation_id

      sig { returns(T.nilable(String)) }
      attr_reader :created_at

      sig { params(created_at: String).void }
      attr_writer :created_at

      # Start and end offsets for rendered tweet text
      sig { returns(T.nilable(T::Array[Integer])) }
      attr_reader :display_text_range

      sig { params(display_text_range: T::Array[Integer]).void }
      attr_writer :display_text_range

      # Parsed search-result entities including URLs, mentions, hashtags, and media
      # markers
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :entities

      sig { params(entities: T::Hash[Symbol, T.anything]).void }
      attr_writer :entities

      # Tweet ID being replied to
      sig { returns(T.nilable(String)) }
      attr_reader :in_reply_to_id

      sig { params(in_reply_to_id: String).void }
      attr_writer :in_reply_to_id

      # User ID being replied to
      sig { returns(T.nilable(String)) }
      attr_reader :in_reply_to_user_id

      sig { params(in_reply_to_user_id: String).void }
      attr_writer :in_reply_to_user_id

      # Username being replied to
      sig { returns(T.nilable(String)) }
      attr_reader :in_reply_to_username

      sig { params(in_reply_to_username: String).void }
      attr_writer :in_reply_to_username

      # Whether the tweet has limited reply permissions
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_limited_reply

      sig { params(is_limited_reply: T::Boolean).void }
      attr_writer :is_limited_reply

      # True for Note Tweets (long-form content, up to 25,000 characters)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_note_tweet

      sig { params(is_note_tweet: T::Boolean).void }
      attr_writer :is_note_tweet

      # True when this search result quotes another tweet
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_quote_status

      sig { params(is_quote_status: T::Boolean).void }
      attr_writer :is_quote_status

      # True when this search result is a reply
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_reply

      sig { params(is_reply: T::Boolean).void }
      attr_writer :is_reply

      # Tweet language code
      sig { returns(T.nilable(String)) }
      attr_reader :lang

      sig { params(lang: String).void }
      attr_writer :lang

      # Search-result media attachments, omitted when no media is present
      sig { returns(T.nilable(T::Array[XTwitterScraper::TweetMedia])) }
      attr_reader :media

      sig { params(media: T::Array[XTwitterScraper::TweetMedia::OrHash]).void }
      attr_writer :media

      # Quoted or retweeted tweet context. Every object includes id, text, and
      # engagement metrics. A zero metric can mean X did not report the count. Author,
      # media, and conversation fields appear when available.
      sig { returns(T.nilable(XTwitterScraper::EmbeddedTweet)) }
      attr_reader :quoted_tweet

      sig { params(quoted_tweet: XTwitterScraper::EmbeddedTweet::OrHash).void }
      attr_writer :quoted_tweet

      # Quoted or retweeted tweet context. Every object includes id, text, and
      # engagement metrics. A zero metric can mean X did not report the count. Author,
      # media, and conversation fields appear when available.
      sig { returns(T.nilable(XTwitterScraper::EmbeddedTweet)) }
      attr_reader :retweeted_tweet

      sig do
        params(retweeted_tweet: XTwitterScraper::EmbeddedTweet::OrHash).void
      end
      attr_writer :retweeted_tweet

      # Client application used to post the tweet
      sig { returns(T.nilable(String)) }
      attr_reader :source

      sig { params(source: String).void }
      attr_writer :source

      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      # Tweet permalink URL
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      # Tweet returned from search results with inline author info. A zero metric can
      # mean X did not report the count.
      sig do
        params(
          id: String,
          bookmark_count: Integer,
          like_count: Integer,
          quote_count: Integer,
          reply_count: Integer,
          retweet_count: Integer,
          text: String,
          view_count: Integer,
          author: XTwitterScraper::UserProfile::OrHash,
          content_disclosure: XTwitterScraper::ContentDisclosure::OrHash,
          conversation_id: String,
          created_at: String,
          display_text_range: T::Array[Integer],
          entities: T::Hash[Symbol, T.anything],
          in_reply_to_id: String,
          in_reply_to_user_id: String,
          in_reply_to_username: String,
          is_limited_reply: T::Boolean,
          is_note_tweet: T::Boolean,
          is_quote_status: T::Boolean,
          is_reply: T::Boolean,
          lang: String,
          media: T::Array[XTwitterScraper::TweetMedia::OrHash],
          quoted_tweet: XTwitterScraper::EmbeddedTweet::OrHash,
          retweeted_tweet: XTwitterScraper::EmbeddedTweet::OrHash,
          source: String,
          type: String,
          url: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        bookmark_count:,
        like_count:,
        quote_count:,
        reply_count:,
        retweet_count:,
        text:,
        view_count:,
        # X user profile with bio, follower counts, and verification status.
        author: nil,
        # Content disclosure metadata shown by X when a tweet is labeled as paid
        # partnership content or AI-generated media.
        content_disclosure: nil,
        # Root tweet ID for the search result conversation
        conversation_id: nil,
        created_at: nil,
        # Start and end offsets for rendered tweet text
        display_text_range: nil,
        # Parsed search-result entities including URLs, mentions, hashtags, and media
        # markers
        entities: nil,
        # Tweet ID being replied to
        in_reply_to_id: nil,
        # User ID being replied to
        in_reply_to_user_id: nil,
        # Username being replied to
        in_reply_to_username: nil,
        # Whether the tweet has limited reply permissions
        is_limited_reply: nil,
        # True for Note Tweets (long-form content, up to 25,000 characters)
        is_note_tweet: nil,
        # True when this search result quotes another tweet
        is_quote_status: nil,
        # True when this search result is a reply
        is_reply: nil,
        # Tweet language code
        lang: nil,
        # Search-result media attachments, omitted when no media is present
        media: nil,
        # Quoted or retweeted tweet context. Every object includes id, text, and
        # engagement metrics. A zero metric can mean X did not report the count. Author,
        # media, and conversation fields appear when available.
        quoted_tweet: nil,
        # Quoted or retweeted tweet context. Every object includes id, text, and
        # engagement metrics. A zero metric can mean X did not report the count. Author,
        # media, and conversation fields appear when available.
        retweeted_tweet: nil,
        # Client application used to post the tweet
        source: nil,
        type: nil,
        # Tweet permalink URL
        url: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            bookmark_count: Integer,
            like_count: Integer,
            quote_count: Integer,
            reply_count: Integer,
            retweet_count: Integer,
            text: String,
            view_count: Integer,
            author: XTwitterScraper::UserProfile,
            content_disclosure: XTwitterScraper::ContentDisclosure,
            conversation_id: String,
            created_at: String,
            display_text_range: T::Array[Integer],
            entities: T::Hash[Symbol, T.anything],
            in_reply_to_id: String,
            in_reply_to_user_id: String,
            in_reply_to_username: String,
            is_limited_reply: T::Boolean,
            is_note_tweet: T::Boolean,
            is_quote_status: T::Boolean,
            is_reply: T::Boolean,
            lang: String,
            media: T::Array[XTwitterScraper::TweetMedia],
            quoted_tweet: XTwitterScraper::EmbeddedTweet,
            retweeted_tweet: XTwitterScraper::EmbeddedTweet,
            source: String,
            type: String,
            url: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
