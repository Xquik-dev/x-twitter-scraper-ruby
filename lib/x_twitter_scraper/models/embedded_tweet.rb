# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class EmbeddedTweet < XTwitterScraper::Internal::Type::BaseModel
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

      # @!attribute article
      #   Article metadata attached to a tweet.
      #
      #   @return [XTwitterScraper::Models::EmbeddedTweet::Article, nil]
      optional :article, -> { XTwitterScraper::EmbeddedTweet::Article }

      # @!attribute author
      #   X user profile with bio, follower counts, and verification status.
      #
      #   @return [XTwitterScraper::Models::UserProfile, nil]
      optional :author, -> { XTwitterScraper::UserProfile }

      # @!attribute card
      #   Public card metadata attached to a tweet.
      #
      #   @return [XTwitterScraper::Models::EmbeddedTweet::Card, nil]
      optional :card, -> { XTwitterScraper::EmbeddedTweet::Card }

      # @!attribute community_note
      #   Community Note presentation metadata returned by X.
      #
      #   @return [XTwitterScraper::Models::EmbeddedTweet::CommunityNote, nil]
      optional :community_note, -> { XTwitterScraper::EmbeddedTweet::CommunityNote }, api_name: :communityNote

      # @!attribute content_disclosure
      #   Content disclosure metadata shown by X when a tweet is labeled as paid
      #   partnership content or AI-generated media.
      #
      #   @return [XTwitterScraper::Models::ContentDisclosure, nil]
      optional :content_disclosure, -> { XTwitterScraper::ContentDisclosure }, api_name: :contentDisclosure

      # @!attribute conversation_id
      #
      #   @return [String, nil]
      optional :conversation_id, String, api_name: :conversationId

      # @!attribute created_at
      #
      #   @return [String, nil]
      optional :created_at, String, api_name: :createdAt

      # @!attribute display_text_range
      #
      #   @return [Array<Integer>, nil]
      optional :display_text_range,
               XTwitterScraper::Internal::Type::ArrayOf[Integer],
               api_name: :displayTextRange

      # @!attribute edit
      #   Edit history metadata returned by X.
      #
      #   @return [XTwitterScraper::Models::EmbeddedTweet::Edit, nil]
      optional :edit, -> { XTwitterScraper::EmbeddedTweet::Edit }

      # @!attribute entities
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :entities, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

      # @!attribute in_reply_to_id
      #
      #   @return [String, nil]
      optional :in_reply_to_id, String, api_name: :inReplyToId

      # @!attribute in_reply_to_user_id
      #
      #   @return [String, nil]
      optional :in_reply_to_user_id, String, api_name: :inReplyToUserId

      # @!attribute in_reply_to_username
      #
      #   @return [String, nil]
      optional :in_reply_to_username, String, api_name: :inReplyToUsername

      # @!attribute is_limited_reply
      #
      #   @return [Boolean, nil]
      optional :is_limited_reply, XTwitterScraper::Internal::Type::Boolean, api_name: :isLimitedReply

      # @!attribute is_note_tweet
      #
      #   @return [Boolean, nil]
      optional :is_note_tweet, XTwitterScraper::Internal::Type::Boolean, api_name: :isNoteTweet

      # @!attribute is_quote_status
      #
      #   @return [Boolean, nil]
      optional :is_quote_status, XTwitterScraper::Internal::Type::Boolean, api_name: :isQuoteStatus

      # @!attribute is_reply
      #
      #   @return [Boolean, nil]
      optional :is_reply, XTwitterScraper::Internal::Type::Boolean, api_name: :isReply

      # @!attribute is_translatable
      #
      #   @return [Boolean, nil]
      optional :is_translatable, XTwitterScraper::Internal::Type::Boolean, api_name: :isTranslatable

      # @!attribute lang
      #
      #   @return [String, nil]
      optional :lang, String

      # @!attribute media
      #
      #   @return [Array<XTwitterScraper::Models::TweetMedia>, nil]
      optional :media, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetMedia] }

      # @!attribute note_tweet
      #   Complete Note Tweet content and rich-text metadata.
      #
      #   @return [XTwitterScraper::Models::EmbeddedTweet::NoteTweet, nil]
      optional :note_tweet, -> { XTwitterScraper::EmbeddedTweet::NoteTweet }, api_name: :noteTweet

      # @!attribute place
      #   Public place metadata attached to a tweet.
      #
      #   @return [XTwitterScraper::Models::EmbeddedTweet::Place, nil]
      optional :place, -> { XTwitterScraper::EmbeddedTweet::Place }

      # @!attribute possibly_sensitive
      #
      #   @return [Boolean, nil]
      optional :possibly_sensitive, XTwitterScraper::Internal::Type::Boolean, api_name: :possiblySensitive

      # @!attribute previous_counts
      #   Engagement counts retained from a prior tweet edit.
      #
      #   @return [XTwitterScraper::Models::EmbeddedTweet::PreviousCounts, nil]
      optional :previous_counts,
               -> { XTwitterScraper::EmbeddedTweet::PreviousCounts },
               api_name: :previousCounts

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
      #
      #   @return [String, nil]
      optional :source, String

      # @!attribute type
      #
      #   @return [String, nil]
      optional :type, String

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String

      # @!attribute view_state
      #
      #   @return [String, nil]
      optional :view_state, String, api_name: :viewState

      # @!method initialize(id:, bookmark_count:, like_count:, quote_count:, reply_count:, retweet_count:, text:, view_count:, article: nil, author: nil, card: nil, community_note: nil, content_disclosure: nil, conversation_id: nil, created_at: nil, display_text_range: nil, edit: nil, entities: nil, in_reply_to_id: nil, in_reply_to_user_id: nil, in_reply_to_username: nil, is_limited_reply: nil, is_note_tweet: nil, is_quote_status: nil, is_reply: nil, is_translatable: nil, lang: nil, media: nil, note_tweet: nil, place: nil, possibly_sensitive: nil, previous_counts: nil, quoted_tweet: nil, retweeted_tweet: nil, source: nil, type: nil, url: nil, view_state: nil)
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::EmbeddedTweet} for more details.
      #
      #   Quoted or retweeted tweet context. Every object includes id, text, and
      #   engagement metrics. A zero metric can mean X did not report the count. Author,
      #   media, and conversation fields appear when available.
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
      #   @param article [XTwitterScraper::Models::EmbeddedTweet::Article] Article metadata attached to a tweet.
      #
      #   @param author [XTwitterScraper::Models::UserProfile] X user profile with bio, follower counts, and verification status.
      #
      #   @param card [XTwitterScraper::Models::EmbeddedTweet::Card] Public card metadata attached to a tweet.
      #
      #   @param community_note [XTwitterScraper::Models::EmbeddedTweet::CommunityNote] Community Note presentation metadata returned by X.
      #
      #   @param content_disclosure [XTwitterScraper::Models::ContentDisclosure] Content disclosure metadata shown by X when a tweet is labeled as paid partnersh
      #
      #   @param conversation_id [String]
      #
      #   @param created_at [String]
      #
      #   @param display_text_range [Array<Integer>]
      #
      #   @param edit [XTwitterScraper::Models::EmbeddedTweet::Edit] Edit history metadata returned by X.
      #
      #   @param entities [Hash{Symbol=>Object}]
      #
      #   @param in_reply_to_id [String]
      #
      #   @param in_reply_to_user_id [String]
      #
      #   @param in_reply_to_username [String]
      #
      #   @param is_limited_reply [Boolean]
      #
      #   @param is_note_tweet [Boolean]
      #
      #   @param is_quote_status [Boolean]
      #
      #   @param is_reply [Boolean]
      #
      #   @param is_translatable [Boolean]
      #
      #   @param lang [String]
      #
      #   @param media [Array<XTwitterScraper::Models::TweetMedia>]
      #
      #   @param note_tweet [XTwitterScraper::Models::EmbeddedTweet::NoteTweet] Complete Note Tweet content and rich-text metadata.
      #
      #   @param place [XTwitterScraper::Models::EmbeddedTweet::Place] Public place metadata attached to a tweet.
      #
      #   @param possibly_sensitive [Boolean]
      #
      #   @param previous_counts [XTwitterScraper::Models::EmbeddedTweet::PreviousCounts] Engagement counts retained from a prior tweet edit.
      #
      #   @param quoted_tweet [XTwitterScraper::Models::EmbeddedTweet] Quoted or retweeted tweet context. Every object includes id, text, and engagemen
      #
      #   @param retweeted_tweet [XTwitterScraper::Models::EmbeddedTweet] Quoted or retweeted tweet context. Every object includes id, text, and engagemen
      #
      #   @param source [String]
      #
      #   @param type [String]
      #
      #   @param url [String]
      #
      #   @param view_state [String]

      # @see XTwitterScraper::Models::EmbeddedTweet#article
      class Article < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute cover_media_url
        #
        #   @return [String, nil]
        optional :cover_media_url, String, api_name: :coverMediaUrl

        # @!attribute preview_text
        #
        #   @return [String, nil]
        optional :preview_text, String, api_name: :previewText

        # @!attribute title
        #
        #   @return [String, nil]
        optional :title, String

        # @!method initialize(id: nil, cover_media_url: nil, preview_text: nil, title: nil)
        #   Article metadata attached to a tweet.
        #
        #   @param id [String]
        #   @param cover_media_url [String]
        #   @param preview_text [String]
        #   @param title [String]
      end

      # @see XTwitterScraper::Models::EmbeddedTweet#card
      class Card < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute binding_values
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :binding_values,
                 XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
                 api_name: :bindingValues

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute url
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(id: nil, binding_values: nil, name: nil, url: nil)
        #   Public card metadata attached to a tweet.
        #
        #   @param id [String]
        #   @param binding_values [Hash{Symbol=>Object}]
        #   @param name [String]
        #   @param url [String]
      end

      # @see XTwitterScraper::Models::EmbeddedTweet#community_note
      class CommunityNote < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute destination_url
        #
        #   @return [String, nil]
        optional :destination_url, String, api_name: :destinationUrl

        # @!attribute footer
        #
        #   @return [String, nil]
        optional :footer, String

        # @!attribute short_title
        #
        #   @return [String, nil]
        optional :short_title, String, api_name: :shortTitle

        # @!attribute subtitle
        #
        #   @return [String, nil]
        optional :subtitle, String

        # @!attribute title
        #
        #   @return [String, nil]
        optional :title, String

        # @!attribute visual_style
        #
        #   @return [String, nil]
        optional :visual_style, String, api_name: :visualStyle

        # @!method initialize(id: nil, destination_url: nil, footer: nil, short_title: nil, subtitle: nil, title: nil, visual_style: nil)
        #   Community Note presentation metadata returned by X.
        #
        #   @param id [String]
        #   @param destination_url [String]
        #   @param footer [String]
        #   @param short_title [String]
        #   @param subtitle [String]
        #   @param title [String]
        #   @param visual_style [String]
      end

      # @see XTwitterScraper::Models::EmbeddedTweet#edit
      class Edit < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute editable_until_msecs
        #
        #   @return [String, nil]
        optional :editable_until_msecs, String, api_name: :editableUntilMsecs

        # @!attribute edit_tweet_ids
        #
        #   @return [Array<String>, nil]
        optional :edit_tweet_ids, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :editTweetIds

        # @!method initialize(editable_until_msecs: nil, edit_tweet_ids: nil)
        #   Edit history metadata returned by X.
        #
        #   @param editable_until_msecs [String]
        #   @param edit_tweet_ids [Array<String>]
      end

      # @see XTwitterScraper::Models::EmbeddedTweet#note_tweet
      class NoteTweet < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute entities
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :entities, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

        # @!attribute is_expandable
        #
        #   @return [Boolean, nil]
        optional :is_expandable, XTwitterScraper::Internal::Type::Boolean, api_name: :isExpandable

        # @!attribute richtext_tags
        #
        #   @return [Array<XTwitterScraper::Models::EmbeddedTweet::NoteTweet::RichtextTag>, nil]
        optional :richtext_tags,
                 -> {
                   XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::EmbeddedTweet::NoteTweet::RichtextTag]
                 },
                 api_name: :richtextTags

        # @!method initialize(text:, id: nil, entities: nil, is_expandable: nil, richtext_tags: nil)
        #   Complete Note Tweet content and rich-text metadata.
        #
        #   @param text [String]
        #   @param id [String]
        #   @param entities [Hash{Symbol=>Object}]
        #   @param is_expandable [Boolean]
        #   @param richtext_tags [Array<XTwitterScraper::Models::EmbeddedTweet::NoteTweet::RichtextTag>]

        class RichtextTag < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute from_index
          #
          #   @return [Integer]
          required :from_index, Integer, api_name: :fromIndex

          # @!attribute to_index
          #
          #   @return [Integer]
          required :to_index, Integer, api_name: :toIndex

          # @!attribute types
          #
          #   @return [Array<String>]
          required :types, XTwitterScraper::Internal::Type::ArrayOf[String]

          # @!method initialize(from_index:, to_index:, types:)
          #   @param from_index [Integer]
          #   @param to_index [Integer]
          #   @param types [Array<String>]
        end
      end

      # @see XTwitterScraper::Models::EmbeddedTweet#place
      class Place < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute bounding_box
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :bounding_box,
                 XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
                 api_name: :boundingBox

        # @!attribute country
        #
        #   @return [String, nil]
        optional :country, String

        # @!attribute country_code
        #
        #   @return [String, nil]
        optional :country_code, String, api_name: :countryCode

        # @!attribute full_name
        #
        #   @return [String, nil]
        optional :full_name, String, api_name: :fullName

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute place_type
        #
        #   @return [String, nil]
        optional :place_type, String, api_name: :placeType

        # @!attribute url
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(id: nil, bounding_box: nil, country: nil, country_code: nil, full_name: nil, name: nil, place_type: nil, url: nil)
        #   Public place metadata attached to a tweet.
        #
        #   @param id [String]
        #   @param bounding_box [Hash{Symbol=>Object}]
        #   @param country [String]
        #   @param country_code [String]
        #   @param full_name [String]
        #   @param name [String]
        #   @param place_type [String]
        #   @param url [String]
      end

      # @see XTwitterScraper::Models::EmbeddedTweet#previous_counts
      class PreviousCounts < XTwitterScraper::Internal::Type::BaseModel
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

        # @!method initialize(bookmark_count: nil, like_count: nil, quote_count: nil, reply_count: nil, retweet_count: nil)
        #   Engagement counts retained from a prior tweet edit.
        #
        #   @param bookmark_count [Integer]
        #   @param like_count [Integer]
        #   @param quote_count [Integer]
        #   @param reply_count [Integer]
        #   @param retweet_count [Integer]
      end
    end
  end
end
