# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetDetail < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::TweetDetail,
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

        # Tweet author profile. The lookup route always includes follower count and
        # verification state. Other profile fields appear when available.
        sig { returns(T.nilable(XTwitterScraper::X::TweetAuthor)) }
        attr_reader :author

        sig { params(author: XTwitterScraper::X::TweetAuthor::OrHash).void }
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

        # ID of the root tweet in the conversation thread
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

        # Parsed entities from the tweet text (URLs, mentions, hashtags, media)
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

        # Whether replies are limited for this tweet
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_limited_reply

        sig { params(is_limited_reply: T::Boolean).void }
        attr_writer :is_limited_reply

        # Whether this is a Note Tweet (long-form post, up to 25,000 characters)
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_note_tweet

        sig { params(is_note_tweet: T::Boolean).void }
        attr_writer :is_note_tweet

        # Whether this tweet quotes another tweet
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_quote_status

        sig { params(is_quote_status: T::Boolean).void }
        attr_writer :is_quote_status

        # Whether this tweet is a reply to another tweet
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_reply

        sig { params(is_reply: T::Boolean).void }
        attr_writer :is_reply

        # Tweet language code
        sig { returns(T.nilable(String)) }
        attr_reader :lang

        sig { params(lang: String).void }
        attr_writer :lang

        # Attached media items, omitted when the tweet has no media
        sig { returns(T.nilable(T::Array[XTwitterScraper::TweetMedia])) }
        attr_reader :media

        sig do
          params(media: T::Array[XTwitterScraper::TweetMedia::OrHash]).void
        end
        attr_writer :media

        # Quoted or retweeted tweet context. Every object includes id, text, and
        # engagement metrics. A zero metric can mean X did not report the count. Author,
        # media, and conversation fields appear when available.
        sig { returns(T.nilable(XTwitterScraper::EmbeddedTweet)) }
        attr_reader :quoted_tweet

        sig do
          params(quoted_tweet: XTwitterScraper::EmbeddedTweet::OrHash).void
        end
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

        # Client application used to post this tweet
        sig { returns(T.nilable(String)) }
        attr_reader :source

        sig { params(source: String).void }
        attr_writer :source

        # Tweet result type
        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        # Tweet permalink URL
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # Full tweet with text, engagement metrics, media, and metadata. A zero metric can
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
            author: XTwitterScraper::X::TweetAuthor::OrHash,
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
          # Tweet author profile. The lookup route always includes follower count and
          # verification state. Other profile fields appear when available.
          author: nil,
          # Content disclosure metadata shown by X when a tweet is labeled as paid
          # partnership content or AI-generated media.
          content_disclosure: nil,
          # ID of the root tweet in the conversation thread
          conversation_id: nil,
          created_at: nil,
          # Start and end offsets for rendered tweet text
          display_text_range: nil,
          # Parsed entities from the tweet text (URLs, mentions, hashtags, media)
          entities: nil,
          # Tweet ID being replied to
          in_reply_to_id: nil,
          # User ID being replied to
          in_reply_to_user_id: nil,
          # Username being replied to
          in_reply_to_username: nil,
          # Whether replies are limited for this tweet
          is_limited_reply: nil,
          # Whether this is a Note Tweet (long-form post, up to 25,000 characters)
          is_note_tweet: nil,
          # Whether this tweet quotes another tweet
          is_quote_status: nil,
          # Whether this tweet is a reply to another tweet
          is_reply: nil,
          # Tweet language code
          lang: nil,
          # Attached media items, omitted when the tweet has no media
          media: nil,
          # Quoted or retweeted tweet context. Every object includes id, text, and
          # engagement metrics. A zero metric can mean X did not report the count. Author,
          # media, and conversation fields appear when available.
          quoted_tweet: nil,
          # Quoted or retweeted tweet context. Every object includes id, text, and
          # engagement metrics. A zero metric can mean X did not report the count. Author,
          # media, and conversation fields appear when available.
          retweeted_tweet: nil,
          # Client application used to post this tweet
          source: nil,
          # Tweet result type
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
              author: XTwitterScraper::X::TweetAuthor,
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
end
