# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

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

      # Article metadata attached to a tweet.
      sig { returns(T.nilable(XTwitterScraper::SearchTweet::Article)) }
      attr_reader :article

      sig do
        params(article: XTwitterScraper::SearchTweet::Article::OrHash).void
      end
      attr_writer :article

      # X user profile with bio, follower counts, and verification status.
      sig { returns(T.nilable(XTwitterScraper::UserProfile)) }
      attr_reader :author

      sig { params(author: XTwitterScraper::UserProfile::OrHash).void }
      attr_writer :author

      # Public card metadata attached to a tweet.
      sig { returns(T.nilable(XTwitterScraper::SearchTweet::Card)) }
      attr_reader :card

      sig { params(card: XTwitterScraper::SearchTweet::Card::OrHash).void }
      attr_writer :card

      # Community Note presentation metadata returned by X.
      sig { returns(T.nilable(XTwitterScraper::SearchTweet::CommunityNote)) }
      attr_reader :community_note

      sig do
        params(
          community_note: XTwitterScraper::SearchTweet::CommunityNote::OrHash
        ).void
      end
      attr_writer :community_note

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

      # Rendered text's start and end offsets.
      sig { returns(T.nilable(T::Array[Integer])) }
      attr_reader :display_text_range

      sig { params(display_text_range: T::Array[Integer]).void }
      attr_writer :display_text_range

      # Edit history metadata returned by X.
      sig { returns(T.nilable(XTwitterScraper::SearchTweet::Edit)) }
      attr_reader :edit

      sig { params(edit: XTwitterScraper::SearchTweet::Edit::OrHash).void }
      attr_writer :edit

      # Parsed search-result entities including URLs, mentions, hashtags, and media
      # markers
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :entities

      sig { params(entities: T::Hash[Symbol, T.anything]).void }
      attr_writer :entities

      # ID of the tweet this result replies to.
      sig { returns(T.nilable(String)) }
      attr_reader :in_reply_to_id

      sig { params(in_reply_to_id: String).void }
      attr_writer :in_reply_to_id

      # ID of the user this result replies to.
      sig { returns(T.nilable(String)) }
      attr_reader :in_reply_to_user_id

      sig { params(in_reply_to_user_id: String).void }
      attr_writer :in_reply_to_user_id

      # Username this result replies to.
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

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_translatable

      sig { params(is_translatable: T::Boolean).void }
      attr_writer :is_translatable

      # Search result language code.
      sig { returns(T.nilable(String)) }
      attr_reader :lang

      sig { params(lang: String).void }
      attr_writer :lang

      # Search-result media attachments, omitted when no media is present
      sig { returns(T.nilable(T::Array[XTwitterScraper::TweetMedia])) }
      attr_reader :media

      sig { params(media: T::Array[XTwitterScraper::TweetMedia::OrHash]).void }
      attr_writer :media

      # Complete Note Tweet content and rich-text metadata.
      sig { returns(T.nilable(XTwitterScraper::SearchTweet::NoteTweet)) }
      attr_reader :note_tweet

      sig do
        params(note_tweet: XTwitterScraper::SearchTweet::NoteTweet::OrHash).void
      end
      attr_writer :note_tweet

      # Public place metadata attached to a tweet.
      sig { returns(T.nilable(XTwitterScraper::SearchTweet::Place)) }
      attr_reader :place

      sig { params(place: XTwitterScraper::SearchTweet::Place::OrHash).void }
      attr_writer :place

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :possibly_sensitive

      sig { params(possibly_sensitive: T::Boolean).void }
      attr_writer :possibly_sensitive

      # Engagement counts retained from a prior tweet edit.
      sig { returns(T.nilable(XTwitterScraper::SearchTweet::PreviousCounts)) }
      attr_reader :previous_counts

      sig do
        params(
          previous_counts: XTwitterScraper::SearchTweet::PreviousCounts::OrHash
        ).void
      end
      attr_writer :previous_counts

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

      # Search result permalink.
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig { returns(T.nilable(String)) }
      attr_reader :view_state

      sig { params(view_state: String).void }
      attr_writer :view_state

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
          article: XTwitterScraper::SearchTweet::Article::OrHash,
          author: XTwitterScraper::UserProfile::OrHash,
          card: XTwitterScraper::SearchTweet::Card::OrHash,
          community_note: XTwitterScraper::SearchTweet::CommunityNote::OrHash,
          content_disclosure: XTwitterScraper::ContentDisclosure::OrHash,
          conversation_id: String,
          created_at: String,
          display_text_range: T::Array[Integer],
          edit: XTwitterScraper::SearchTweet::Edit::OrHash,
          entities: T::Hash[Symbol, T.anything],
          in_reply_to_id: String,
          in_reply_to_user_id: String,
          in_reply_to_username: String,
          is_limited_reply: T::Boolean,
          is_note_tweet: T::Boolean,
          is_quote_status: T::Boolean,
          is_reply: T::Boolean,
          is_translatable: T::Boolean,
          lang: String,
          media: T::Array[XTwitterScraper::TweetMedia::OrHash],
          note_tweet: XTwitterScraper::SearchTweet::NoteTweet::OrHash,
          place: XTwitterScraper::SearchTweet::Place::OrHash,
          possibly_sensitive: T::Boolean,
          previous_counts: XTwitterScraper::SearchTweet::PreviousCounts::OrHash,
          quoted_tweet: XTwitterScraper::EmbeddedTweet::OrHash,
          retweeted_tweet: XTwitterScraper::EmbeddedTweet::OrHash,
          source: String,
          type: String,
          url: String,
          view_state: String
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
        # Article metadata attached to a tweet.
        article: nil,
        # X user profile with bio, follower counts, and verification status.
        author: nil,
        # Public card metadata attached to a tweet.
        card: nil,
        # Community Note presentation metadata returned by X.
        community_note: nil,
        # Content disclosure metadata shown by X when a tweet is labeled as paid
        # partnership content or AI-generated media.
        content_disclosure: nil,
        # Root tweet ID for the search result conversation
        conversation_id: nil,
        created_at: nil,
        # Rendered text's start and end offsets.
        display_text_range: nil,
        # Edit history metadata returned by X.
        edit: nil,
        # Parsed search-result entities including URLs, mentions, hashtags, and media
        # markers
        entities: nil,
        # ID of the tweet this result replies to.
        in_reply_to_id: nil,
        # ID of the user this result replies to.
        in_reply_to_user_id: nil,
        # Username this result replies to.
        in_reply_to_username: nil,
        # Whether the tweet has limited reply permissions
        is_limited_reply: nil,
        # True for Note Tweets (long-form content, up to 25,000 characters)
        is_note_tweet: nil,
        # True when this search result quotes another tweet
        is_quote_status: nil,
        # True when this search result is a reply
        is_reply: nil,
        is_translatable: nil,
        # Search result language code.
        lang: nil,
        # Search-result media attachments, omitted when no media is present
        media: nil,
        # Complete Note Tweet content and rich-text metadata.
        note_tweet: nil,
        # Public place metadata attached to a tweet.
        place: nil,
        possibly_sensitive: nil,
        # Engagement counts retained from a prior tweet edit.
        previous_counts: nil,
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
        # Search result permalink.
        url: nil,
        view_state: nil
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
            article: XTwitterScraper::SearchTweet::Article,
            author: XTwitterScraper::UserProfile,
            card: XTwitterScraper::SearchTweet::Card,
            community_note: XTwitterScraper::SearchTweet::CommunityNote,
            content_disclosure: XTwitterScraper::ContentDisclosure,
            conversation_id: String,
            created_at: String,
            display_text_range: T::Array[Integer],
            edit: XTwitterScraper::SearchTweet::Edit,
            entities: T::Hash[Symbol, T.anything],
            in_reply_to_id: String,
            in_reply_to_user_id: String,
            in_reply_to_username: String,
            is_limited_reply: T::Boolean,
            is_note_tweet: T::Boolean,
            is_quote_status: T::Boolean,
            is_reply: T::Boolean,
            is_translatable: T::Boolean,
            lang: String,
            media: T::Array[XTwitterScraper::TweetMedia],
            note_tweet: XTwitterScraper::SearchTweet::NoteTweet,
            place: XTwitterScraper::SearchTweet::Place,
            possibly_sensitive: T::Boolean,
            previous_counts: XTwitterScraper::SearchTweet::PreviousCounts,
            quoted_tweet: XTwitterScraper::EmbeddedTweet,
            retweeted_tweet: XTwitterScraper::EmbeddedTweet,
            source: String,
            type: String,
            url: String,
            view_state: String
          }
        )
      end
      def to_hash
      end

      class Article < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::Article,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig { returns(T.nilable(String)) }
        attr_reader :cover_media_url

        sig { params(cover_media_url: String).void }
        attr_writer :cover_media_url

        sig { returns(T.nilable(String)) }
        attr_reader :preview_text

        sig { params(preview_text: String).void }
        attr_writer :preview_text

        sig { returns(T.nilable(String)) }
        attr_reader :title

        sig { params(title: String).void }
        attr_writer :title

        # Article metadata attached to a tweet.
        sig do
          params(
            id: String,
            cover_media_url: String,
            preview_text: String,
            title: String
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          cover_media_url: nil,
          preview_text: nil,
          title: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              cover_media_url: String,
              preview_text: String,
              title: String
            }
          )
        end
        def to_hash
        end
      end

      class Card < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::Card,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :binding_values

        sig { params(binding_values: T::Hash[Symbol, T.anything]).void }
        attr_writer :binding_values

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # Public card metadata attached to a tweet.
        sig do
          params(
            id: String,
            binding_values: T::Hash[Symbol, T.anything],
            name: String,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(id: nil, binding_values: nil, name: nil, url: nil)
        end

        sig do
          override.returns(
            {
              id: String,
              binding_values: T::Hash[Symbol, T.anything],
              name: String,
              url: String
            }
          )
        end
        def to_hash
        end
      end

      class CommunityNote < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::CommunityNote,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig { returns(T.nilable(String)) }
        attr_reader :destination_url

        sig { params(destination_url: String).void }
        attr_writer :destination_url

        sig { returns(T.nilable(String)) }
        attr_reader :footer

        sig { params(footer: String).void }
        attr_writer :footer

        sig { returns(T.nilable(String)) }
        attr_reader :short_title

        sig { params(short_title: String).void }
        attr_writer :short_title

        sig { returns(T.nilable(String)) }
        attr_reader :subtitle

        sig { params(subtitle: String).void }
        attr_writer :subtitle

        sig { returns(T.nilable(String)) }
        attr_reader :title

        sig { params(title: String).void }
        attr_writer :title

        sig { returns(T.nilable(String)) }
        attr_reader :visual_style

        sig { params(visual_style: String).void }
        attr_writer :visual_style

        # Community Note presentation metadata returned by X.
        sig do
          params(
            id: String,
            destination_url: String,
            footer: String,
            short_title: String,
            subtitle: String,
            title: String,
            visual_style: String
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          destination_url: nil,
          footer: nil,
          short_title: nil,
          subtitle: nil,
          title: nil,
          visual_style: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              destination_url: String,
              footer: String,
              short_title: String,
              subtitle: String,
              title: String,
              visual_style: String
            }
          )
        end
        def to_hash
        end
      end

      class Edit < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::Edit,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :editable_until_msecs

        sig { params(editable_until_msecs: String).void }
        attr_writer :editable_until_msecs

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :edit_tweet_ids

        sig { params(edit_tweet_ids: T::Array[String]).void }
        attr_writer :edit_tweet_ids

        # Edit history metadata returned by X.
        sig do
          params(
            editable_until_msecs: String,
            edit_tweet_ids: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(editable_until_msecs: nil, edit_tweet_ids: nil)
        end

        sig do
          override.returns(
            { editable_until_msecs: String, edit_tweet_ids: T::Array[String] }
          )
        end
        def to_hash
        end
      end

      class NoteTweet < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::NoteTweet,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :text

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :entities

        sig { params(entities: T::Hash[Symbol, T.anything]).void }
        attr_writer :entities

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_expandable

        sig { params(is_expandable: T::Boolean).void }
        attr_writer :is_expandable

        sig do
          returns(
            T.nilable(
              T::Array[XTwitterScraper::SearchTweet::NoteTweet::RichtextTag]
            )
          )
        end
        attr_reader :richtext_tags

        sig do
          params(
            richtext_tags:
              T::Array[
                XTwitterScraper::SearchTweet::NoteTweet::RichtextTag::OrHash
              ]
          ).void
        end
        attr_writer :richtext_tags

        # Complete Note Tweet content and rich-text metadata.
        sig do
          params(
            text: String,
            id: String,
            entities: T::Hash[Symbol, T.anything],
            is_expandable: T::Boolean,
            richtext_tags:
              T::Array[
                XTwitterScraper::SearchTweet::NoteTweet::RichtextTag::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          text:,
          id: nil,
          entities: nil,
          is_expandable: nil,
          richtext_tags: nil
        )
        end

        sig do
          override.returns(
            {
              text: String,
              id: String,
              entities: T::Hash[Symbol, T.anything],
              is_expandable: T::Boolean,
              richtext_tags:
                T::Array[XTwitterScraper::SearchTweet::NoteTweet::RichtextTag]
            }
          )
        end
        def to_hash
        end

        class RichtextTag < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::SearchTweet::NoteTweet::RichtextTag,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(Integer) }
          attr_accessor :from_index

          sig { returns(Integer) }
          attr_accessor :to_index

          sig { returns(T::Array[String]) }
          attr_accessor :types

          sig do
            params(
              from_index: Integer,
              to_index: Integer,
              types: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(from_index:, to_index:, types:)
          end

          sig do
            override.returns(
              {
                from_index: Integer,
                to_index: Integer,
                types: T::Array[String]
              }
            )
          end
          def to_hash
          end
        end
      end

      class Place < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::Place,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :bounding_box

        sig { params(bounding_box: T::Hash[Symbol, T.anything]).void }
        attr_writer :bounding_box

        sig { returns(T.nilable(String)) }
        attr_reader :country

        sig { params(country: String).void }
        attr_writer :country

        sig { returns(T.nilable(String)) }
        attr_reader :country_code

        sig { params(country_code: String).void }
        attr_writer :country_code

        sig { returns(T.nilable(String)) }
        attr_reader :full_name

        sig { params(full_name: String).void }
        attr_writer :full_name

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(String)) }
        attr_reader :place_type

        sig { params(place_type: String).void }
        attr_writer :place_type

        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # Public place metadata attached to a tweet.
        sig do
          params(
            id: String,
            bounding_box: T::Hash[Symbol, T.anything],
            country: String,
            country_code: String,
            full_name: String,
            name: String,
            place_type: String,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          bounding_box: nil,
          country: nil,
          country_code: nil,
          full_name: nil,
          name: nil,
          place_type: nil,
          url: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              bounding_box: T::Hash[Symbol, T.anything],
              country: String,
              country_code: String,
              full_name: String,
              name: String,
              place_type: String,
              url: String
            }
          )
        end
        def to_hash
        end
      end

      class PreviousCounts < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::PreviousCounts,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :bookmark_count

        sig { params(bookmark_count: Integer).void }
        attr_writer :bookmark_count

        sig { returns(T.nilable(Integer)) }
        attr_reader :like_count

        sig { params(like_count: Integer).void }
        attr_writer :like_count

        sig { returns(T.nilable(Integer)) }
        attr_reader :quote_count

        sig { params(quote_count: Integer).void }
        attr_writer :quote_count

        sig { returns(T.nilable(Integer)) }
        attr_reader :reply_count

        sig { params(reply_count: Integer).void }
        attr_writer :reply_count

        sig { returns(T.nilable(Integer)) }
        attr_reader :retweet_count

        sig { params(retweet_count: Integer).void }
        attr_writer :retweet_count

        # Engagement counts retained from a prior tweet edit.
        sig do
          params(
            bookmark_count: Integer,
            like_count: Integer,
            quote_count: Integer,
            reply_count: Integer,
            retweet_count: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          bookmark_count: nil,
          like_count: nil,
          quote_count: nil,
          reply_count: nil,
          retweet_count: nil
        )
        end

        sig do
          override.returns(
            {
              bookmark_count: Integer,
              like_count: Integer,
              quote_count: Integer,
              reply_count: Integer,
              retweet_count: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
