# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class EmbeddedTweet < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::EmbeddedTweet,
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

      sig { returns(T.nilable(String)) }
      attr_reader :conversation_id

      sig { params(conversation_id: String).void }
      attr_writer :conversation_id

      sig { returns(T.nilable(String)) }
      attr_reader :created_at

      sig { params(created_at: String).void }
      attr_writer :created_at

      sig { returns(T.nilable(T::Array[Integer])) }
      attr_reader :display_text_range

      sig { params(display_text_range: T::Array[Integer]).void }
      attr_writer :display_text_range

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :entities

      sig { params(entities: T::Hash[Symbol, T.anything]).void }
      attr_writer :entities

      sig { returns(T.nilable(String)) }
      attr_reader :in_reply_to_id

      sig { params(in_reply_to_id: String).void }
      attr_writer :in_reply_to_id

      sig { returns(T.nilable(String)) }
      attr_reader :in_reply_to_user_id

      sig { params(in_reply_to_user_id: String).void }
      attr_writer :in_reply_to_user_id

      sig { returns(T.nilable(String)) }
      attr_reader :in_reply_to_username

      sig { params(in_reply_to_username: String).void }
      attr_writer :in_reply_to_username

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_limited_reply

      sig { params(is_limited_reply: T::Boolean).void }
      attr_writer :is_limited_reply

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_note_tweet

      sig { params(is_note_tweet: T::Boolean).void }
      attr_writer :is_note_tweet

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_quote_status

      sig { params(is_quote_status: T::Boolean).void }
      attr_writer :is_quote_status

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_reply

      sig { params(is_reply: T::Boolean).void }
      attr_writer :is_reply

      sig { returns(T.nilable(String)) }
      attr_reader :lang

      sig { params(lang: String).void }
      attr_writer :lang

      sig { returns(T.nilable(T::Array[XTwitterScraper::TweetMedia])) }
      attr_reader :media

      sig { params(media: T::Array[XTwitterScraper::TweetMedia::OrHash]).void }
      attr_writer :media

      sig { returns(T.nilable(String)) }
      attr_reader :source

      sig { params(source: String).void }
      attr_writer :source

      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      # Quoted or retweeted tweet context. Every object includes id, text, and
      # engagement metrics. A zero metric can mean X did not report the count. Author,
      # media, and conversation fields appear when available.
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
        conversation_id: nil,
        created_at: nil,
        display_text_range: nil,
        entities: nil,
        in_reply_to_id: nil,
        in_reply_to_user_id: nil,
        in_reply_to_username: nil,
        is_limited_reply: nil,
        is_note_tweet: nil,
        is_quote_status: nil,
        is_reply: nil,
        lang: nil,
        media: nil,
        source: nil,
        type: nil,
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
