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

      sig { returns(T.nilable(XTwitterScraper::TweetAuthorUnavailable)) }
      attr_reader :author_unavailable

      sig do
        params(
          author_unavailable: XTwitterScraper::TweetAuthorUnavailable::OrHash
        ).void
      end
      attr_writer :author_unavailable

      # Public card metadata attached to a tweet.
      sig { returns(T.nilable(XTwitterScraper::SearchTweet::Card)) }
      attr_reader :card

      sig { params(card: XTwitterScraper::SearchTweet::Card::OrHash).void }
      attr_writer :card

      # Price charts the author attached under the post, 1 per cashtag. Absent when the
      # post has none. X may send a cashtag without a chart window.
      sig do
        returns(
          T.nilable(T::Array[XTwitterScraper::SearchTweet::CashtagAttachment])
        )
      end
      attr_reader :cashtag_attachments

      sig do
        params(
          cashtag_attachments:
            T::Array[XTwitterScraper::SearchTweet::CashtagAttachment::OrHash]
        ).void
      end
      attr_writer :cashtag_attachments

      # Community ID.
      sig { returns(T.nilable(String)) }
      attr_reader :community_id

      sig { params(community_id: String).void }
      attr_writer :community_id

      # Community name. Present when X sends it with the post.
      sig { returns(T.nilable(String)) }
      attr_reader :community_name

      sig { params(community_name: String).void }
      attr_writer :community_name

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

      # Reply policy & conversation owner.
      sig do
        returns(T.nilable(XTwitterScraper::SearchTweet::ConversationControl))
      end
      attr_reader :conversation_control

      sig do
        params(
          conversation_control:
            XTwitterScraper::SearchTweet::ConversationControl::OrHash
        ).void
      end
      attr_writer :conversation_control

      # Root tweet ID for the search result conversation
      sig { returns(T.nilable(String)) }
      attr_reader :conversation_id

      sig { params(conversation_id: String).void }
      attr_writer :conversation_id

      # Author-published point, with longitude before latitude.
      sig { returns(T.nilable(XTwitterScraper::TweetPoint)) }
      attr_reader :coordinates

      sig { params(coordinates: XTwitterScraper::TweetPoint::OrHash).void }
      attr_writer :coordinates

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

      sig { returns(T.nilable(XTwitterScraper::TweetExclusiveContent)) }
      attr_reader :exclusive_content

      sig do
        params(
          exclusive_content: XTwitterScraper::TweetExclusiveContent::OrHash
        ).void
      end
      attr_writer :exclusive_content

      # Author-published point, with latitude before longitude.
      sig { returns(T.nilable(XTwitterScraper::TweetPoint)) }
      attr_reader :geo

      sig { params(geo: XTwitterScraper::TweetPoint::OrHash).void }
      attr_writer :geo

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :grok_share_attachment

      sig { params(grok_share_attachment: T::Hash[Symbol, T.anything]).void }
      attr_writer :grok_share_attachment

      # Grok's translation of the post, as X shows it.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :grok_translated_post

      sig { params(grok_translated_post: T::Hash[Symbol, T.anything]).void }
      attr_writer :grok_translated_post

      # Whether X holds Community Notes on the post, shown or not.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_community_notes

      sig { params(has_community_notes: T::Boolean).void }
      attr_writer :has_community_notes

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

      sig { returns(T.nilable(XTwitterScraper::TweetInterstitial)) }
      attr_reader :interstitial

      sig do
        params(interstitial: XTwitterScraper::TweetInterstitial::OrHash).void
      end
      attr_writer :interstitial

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

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_pinned

      sig { params(is_pinned: T::Boolean).void }
      attr_writer :is_pinned

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
      attr_reader :is_retweet

      sig { params(is_retweet: T::Boolean).void }
      attr_writer :is_retweet

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_translatable

      sig { params(is_translatable: T::Boolean).void }
      attr_writer :is_translatable

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :jetfuel_attachment

      sig { params(jetfuel_attachment: T::Hash[Symbol, T.anything]).void }
      attr_writer :jetfuel_attachment

      # Search result language code.
      sig { returns(T.nilable(String)) }
      attr_reader :lang

      sig { params(lang: String).void }
      attr_writer :lang

      # Public restrictions & prompts.
      sig do
        returns(
          T.nilable(T::Array[XTwitterScraper::SearchTweet::LimitedAction])
        )
      end
      attr_reader :limited_actions

      sig do
        params(
          limited_actions:
            T::Array[XTwitterScraper::SearchTweet::LimitedAction::OrHash]
        ).void
      end
      attr_writer :limited_actions

      # The live event the post belongs to, such as an election.
      sig { returns(T.nilable(XTwitterScraper::SearchTweet::LiveEventContext)) }
      attr_reader :live_event_context

      sig do
        params(
          live_event_context:
            XTwitterScraper::SearchTweet::LiveEventContext::OrHash
        ).void
      end
      attr_writer :live_event_context

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

      sig { returns(T.nilable(XTwitterScraper::EmbeddedTweet)) }
      attr_reader :parent_tweet

      sig { params(parent_tweet: XTwitterScraper::EmbeddedTweet::OrHash).void }
      attr_writer :parent_tweet

      # Public place metadata attached to a tweet.
      sig { returns(T.nilable(XTwitterScraper::SearchTweet::Place)) }
      attr_reader :place

      sig { params(place: XTwitterScraper::SearchTweet::Place::OrHash).void }
      attr_writer :place

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :possibly_sensitive

      sig { params(possibly_sensitive: T::Boolean).void }
      attr_writer :possibly_sensitive

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :post_cta

      sig { params(post_cta: T::Hash[Symbol, T.anything]).void }
      attr_writer :post_cta

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

      sig { returns(T.nilable(String)) }
      attr_reader :quoted_tweet_id

      sig { params(quoted_tweet_id: String).void }
      attr_writer :quoted_tweet_id

      # The quoted post's link, kept when X withholds that post.
      sig do
        returns(T.nilable(XTwitterScraper::SearchTweet::QuotedTweetPermalink))
      end
      attr_reader :quoted_tweet_permalink

      sig do
        params(
          quoted_tweet_permalink:
            XTwitterScraper::SearchTweet::QuotedTweetPermalink::OrHash
        ).void
      end
      attr_writer :quoted_tweet_permalink

      # Why X shows no quoted post. Omitted when X names no reason.
      sig do
        returns(T.nilable(XTwitterScraper::SearchTweet::QuotedTweetUnavailable))
      end
      attr_reader :quoted_tweet_unavailable

      sig do
        params(
          quoted_tweet_unavailable:
            XTwitterScraper::SearchTweet::QuotedTweetUnavailable::OrHash
        ).void
      end
      attr_writer :quoted_tweet_unavailable

      # Public post & user this reaction references.
      sig { returns(T.nilable(XTwitterScraper::SearchTweet::ReactionContext)) }
      attr_reader :reaction_context

      sig do
        params(
          reaction_context:
            XTwitterScraper::SearchTweet::ReactionContext::OrHash
        ).void
      end
      attr_writer :reaction_context

      # Repost event time in UTC. Null when unavailable. Omitted for other posts.
      sig { returns(T.nilable(Time)) }
      attr_accessor :retweeted_at

      # Quoted or retweeted tweet context. Every object includes id, text, and
      # engagement metrics. A zero metric can mean X did not report the count. Author,
      # media, and conversation fields appear when available.
      sig { returns(T.nilable(XTwitterScraper::EmbeddedTweet)) }
      attr_reader :retweeted_tweet

      sig do
        params(retweeted_tweet: XTwitterScraper::EmbeddedTweet::OrHash).void
      end
      attr_writer :retweeted_tweet

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :scopes

      sig { params(scopes: T::Hash[Symbol, T.anything]).void }
      attr_writer :scopes

      # The label X shows under a post whose reach it limits. It links to the page that
      # explains it.
      sig { returns(T.nilable(XTwitterScraper::SearchTweet::SoftIntervention)) }
      attr_reader :soft_intervention

      sig do
        params(
          soft_intervention:
            XTwitterScraper::SearchTweet::SoftIntervention::OrHash
        ).void
      end
      attr_writer :soft_intervention

      # Client application used to post the tweet
      sig { returns(T.nilable(String)) }
      attr_reader :source

      sig { params(source: String).void }
      attr_writer :source

      # Game metadata attached to this post.
      sig { returns(T.nilable(XTwitterScraper::SearchTweet::SportsContext)) }
      attr_reader :sports_context

      sig do
        params(
          sports_context: XTwitterScraper::SearchTweet::SportsContext::OrHash
        ).void
      end
      attr_writer :sports_context

      sig { returns(T.nilable(XTwitterScraper::TweetSubscriberBadge)) }
      attr_reader :subscriber_badge

      sig do
        params(
          subscriber_badge: XTwitterScraper::TweetSubscriberBadge::OrHash
        ).void
      end
      attr_writer :subscriber_badge

      # Where `text` matches the search, on each row a search read. Offsets count code
      # points of `text`, as `displayTextRange` does. Empty when the post holds no
      # marked match. Highlights cover a post's first 280 characters.
      sig do
        returns(
          T.nilable(T::Array[XTwitterScraper::SearchTweet::TextHighlight])
        )
      end
      attr_reader :text_highlights

      sig do
        params(
          text_highlights:
            T::Array[XTwitterScraper::SearchTweet::TextHighlight::OrHash]
        ).void
      end
      attr_writer :text_highlights

      sig { returns(T.nilable(XTwitterScraper::TweetTombstone)) }
      attr_reader :tombstone

      sig { params(tombstone: XTwitterScraper::TweetTombstone::OrHash).void }
      attr_writer :tombstone

      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      # The author's ID when X withholds the author's profile.
      sig { returns(T.nilable(String)) }
      attr_reader :unavailable_author_id

      sig { params(unavailable_author_id: String).void }
      attr_writer :unavailable_author_id

      # The counts X did not send for this post. Each one reads 0, so treat it as
      # unknown rather than none. Names follow the response's key style, so
      # `xquik-api-contract: 2026-04-29` lists bookmark_count. Posts from before X
      # counted views, & new posts X has not counted views for yet, list viewCount. Left
      # out when X sent every count. Counts X didn't send are listed in `unknownCounts`,
      # never shown as 0.
      sig do
        returns(
          T.nilable(
            T::Array[XTwitterScraper::SearchTweet::UnknownCount::TaggedSymbol]
          )
        )
      end
      attr_reader :unknown_counts

      sig do
        params(
          unknown_counts:
            T::Array[XTwitterScraper::SearchTweet::UnknownCount::OrSymbol]
        ).void
      end
      attr_writer :unknown_counts

      # The fields X did not send for this post. text reads empty, so treat it as
      # unknown rather than empty. Left out when X sent the text.
      sig do
        returns(
          T.nilable(
            T::Array[XTwitterScraper::SearchTweet::UnknownField::TaggedSymbol]
          )
        )
      end
      attr_reader :unknown_fields

      sig do
        params(
          unknown_fields:
            T::Array[XTwitterScraper::SearchTweet::UnknownField::OrSymbol]
        ).void
      end
      attr_writer :unknown_fields

      # User IDs that left this conversation.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :unmentioned_user_ids

      sig { params(unmentioned_user_ids: T::Array[String]).void }
      attr_writer :unmentioned_user_ids

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
          author_unavailable: XTwitterScraper::TweetAuthorUnavailable::OrHash,
          card: XTwitterScraper::SearchTweet::Card::OrHash,
          cashtag_attachments:
            T::Array[XTwitterScraper::SearchTweet::CashtagAttachment::OrHash],
          community_id: String,
          community_name: String,
          community_note: XTwitterScraper::SearchTweet::CommunityNote::OrHash,
          content_disclosure: XTwitterScraper::ContentDisclosure::OrHash,
          conversation_control:
            XTwitterScraper::SearchTweet::ConversationControl::OrHash,
          conversation_id: String,
          coordinates: XTwitterScraper::TweetPoint::OrHash,
          created_at: String,
          display_text_range: T::Array[Integer],
          edit: XTwitterScraper::SearchTweet::Edit::OrHash,
          entities: T::Hash[Symbol, T.anything],
          exclusive_content: XTwitterScraper::TweetExclusiveContent::OrHash,
          geo: XTwitterScraper::TweetPoint::OrHash,
          grok_share_attachment: T::Hash[Symbol, T.anything],
          grok_translated_post: T::Hash[Symbol, T.anything],
          has_community_notes: T::Boolean,
          in_reply_to_id: String,
          in_reply_to_user_id: String,
          in_reply_to_username: String,
          interstitial: XTwitterScraper::TweetInterstitial::OrHash,
          is_limited_reply: T::Boolean,
          is_note_tweet: T::Boolean,
          is_pinned: T::Boolean,
          is_quote_status: T::Boolean,
          is_reply: T::Boolean,
          is_retweet: T::Boolean,
          is_translatable: T::Boolean,
          jetfuel_attachment: T::Hash[Symbol, T.anything],
          lang: String,
          limited_actions:
            T::Array[XTwitterScraper::SearchTweet::LimitedAction::OrHash],
          live_event_context:
            XTwitterScraper::SearchTweet::LiveEventContext::OrHash,
          media: T::Array[XTwitterScraper::TweetMedia::OrHash],
          note_tweet: XTwitterScraper::SearchTweet::NoteTweet::OrHash,
          parent_tweet: XTwitterScraper::EmbeddedTweet::OrHash,
          place: XTwitterScraper::SearchTweet::Place::OrHash,
          possibly_sensitive: T::Boolean,
          post_cta: T::Hash[Symbol, T.anything],
          previous_counts: XTwitterScraper::SearchTweet::PreviousCounts::OrHash,
          quoted_tweet: XTwitterScraper::EmbeddedTweet::OrHash,
          quoted_tweet_id: String,
          quoted_tweet_permalink:
            XTwitterScraper::SearchTweet::QuotedTweetPermalink::OrHash,
          quoted_tweet_unavailable:
            XTwitterScraper::SearchTweet::QuotedTweetUnavailable::OrHash,
          reaction_context:
            XTwitterScraper::SearchTweet::ReactionContext::OrHash,
          retweeted_at: T.nilable(Time),
          retweeted_tweet: XTwitterScraper::EmbeddedTweet::OrHash,
          scopes: T::Hash[Symbol, T.anything],
          soft_intervention:
            XTwitterScraper::SearchTweet::SoftIntervention::OrHash,
          source: String,
          sports_context: XTwitterScraper::SearchTweet::SportsContext::OrHash,
          subscriber_badge: XTwitterScraper::TweetSubscriberBadge::OrHash,
          text_highlights:
            T::Array[XTwitterScraper::SearchTweet::TextHighlight::OrHash],
          tombstone: XTwitterScraper::TweetTombstone::OrHash,
          type: String,
          unavailable_author_id: String,
          unknown_counts:
            T::Array[XTwitterScraper::SearchTweet::UnknownCount::OrSymbol],
          unknown_fields:
            T::Array[XTwitterScraper::SearchTweet::UnknownField::OrSymbol],
          unmentioned_user_ids: T::Array[String],
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
        author_unavailable: nil,
        # Public card metadata attached to a tweet.
        card: nil,
        # Price charts the author attached under the post, 1 per cashtag. Absent when the
        # post has none. X may send a cashtag without a chart window.
        cashtag_attachments: nil,
        # Community ID.
        community_id: nil,
        # Community name. Present when X sends it with the post.
        community_name: nil,
        # Community Note presentation metadata returned by X.
        community_note: nil,
        # Content disclosure metadata shown by X when a tweet is labeled as paid
        # partnership content or AI-generated media.
        content_disclosure: nil,
        # Reply policy & conversation owner.
        conversation_control: nil,
        # Root tweet ID for the search result conversation
        conversation_id: nil,
        # Author-published point, with longitude before latitude.
        coordinates: nil,
        created_at: nil,
        # Rendered text's start and end offsets.
        display_text_range: nil,
        # Edit history metadata returned by X.
        edit: nil,
        # Parsed search-result entities including URLs, mentions, hashtags, and media
        # markers
        entities: nil,
        exclusive_content: nil,
        # Author-published point, with latitude before longitude.
        geo: nil,
        grok_share_attachment: nil,
        # Grok's translation of the post, as X shows it.
        grok_translated_post: nil,
        # Whether X holds Community Notes on the post, shown or not.
        has_community_notes: nil,
        # ID of the tweet this result replies to.
        in_reply_to_id: nil,
        # ID of the user this result replies to.
        in_reply_to_user_id: nil,
        # Username this result replies to.
        in_reply_to_username: nil,
        interstitial: nil,
        # Whether the tweet has limited reply permissions
        is_limited_reply: nil,
        # True for Note Tweets (long-form content, up to 25,000 characters)
        is_note_tweet: nil,
        is_pinned: nil,
        # True when this search result quotes another tweet
        is_quote_status: nil,
        # True when this search result is a reply
        is_reply: nil,
        is_retweet: nil,
        is_translatable: nil,
        jetfuel_attachment: nil,
        # Search result language code.
        lang: nil,
        # Public restrictions & prompts.
        limited_actions: nil,
        # The live event the post belongs to, such as an election.
        live_event_context: nil,
        # Search-result media attachments, omitted when no media is present
        media: nil,
        # Complete Note Tweet content and rich-text metadata.
        note_tweet: nil,
        parent_tweet: nil,
        # Public place metadata attached to a tweet.
        place: nil,
        possibly_sensitive: nil,
        post_cta: nil,
        # Engagement counts retained from a prior tweet edit.
        previous_counts: nil,
        # Quoted or retweeted tweet context. Every object includes id, text, and
        # engagement metrics. A zero metric can mean X did not report the count. Author,
        # media, and conversation fields appear when available.
        quoted_tweet: nil,
        quoted_tweet_id: nil,
        # The quoted post's link, kept when X withholds that post.
        quoted_tweet_permalink: nil,
        # Why X shows no quoted post. Omitted when X names no reason.
        quoted_tweet_unavailable: nil,
        # Public post & user this reaction references.
        reaction_context: nil,
        # Repost event time in UTC. Null when unavailable. Omitted for other posts.
        retweeted_at: nil,
        # Quoted or retweeted tweet context. Every object includes id, text, and
        # engagement metrics. A zero metric can mean X did not report the count. Author,
        # media, and conversation fields appear when available.
        retweeted_tweet: nil,
        scopes: nil,
        # The label X shows under a post whose reach it limits. It links to the page that
        # explains it.
        soft_intervention: nil,
        # Client application used to post the tweet
        source: nil,
        # Game metadata attached to this post.
        sports_context: nil,
        subscriber_badge: nil,
        # Where `text` matches the search, on each row a search read. Offsets count code
        # points of `text`, as `displayTextRange` does. Empty when the post holds no
        # marked match. Highlights cover a post's first 280 characters.
        text_highlights: nil,
        tombstone: nil,
        type: nil,
        # The author's ID when X withholds the author's profile.
        unavailable_author_id: nil,
        # The counts X did not send for this post. Each one reads 0, so treat it as
        # unknown rather than none. Names follow the response's key style, so
        # `xquik-api-contract: 2026-04-29` lists bookmark_count. Posts from before X
        # counted views, & new posts X has not counted views for yet, list viewCount. Left
        # out when X sent every count. Counts X didn't send are listed in `unknownCounts`,
        # never shown as 0.
        unknown_counts: nil,
        # The fields X did not send for this post. text reads empty, so treat it as
        # unknown rather than empty. Left out when X sent the text.
        unknown_fields: nil,
        # User IDs that left this conversation.
        unmentioned_user_ids: nil,
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
            author_unavailable: XTwitterScraper::TweetAuthorUnavailable,
            card: XTwitterScraper::SearchTweet::Card,
            cashtag_attachments:
              T::Array[XTwitterScraper::SearchTweet::CashtagAttachment],
            community_id: String,
            community_name: String,
            community_note: XTwitterScraper::SearchTweet::CommunityNote,
            content_disclosure: XTwitterScraper::ContentDisclosure,
            conversation_control:
              XTwitterScraper::SearchTweet::ConversationControl,
            conversation_id: String,
            coordinates: XTwitterScraper::TweetPoint,
            created_at: String,
            display_text_range: T::Array[Integer],
            edit: XTwitterScraper::SearchTweet::Edit,
            entities: T::Hash[Symbol, T.anything],
            exclusive_content: XTwitterScraper::TweetExclusiveContent,
            geo: XTwitterScraper::TweetPoint,
            grok_share_attachment: T::Hash[Symbol, T.anything],
            grok_translated_post: T::Hash[Symbol, T.anything],
            has_community_notes: T::Boolean,
            in_reply_to_id: String,
            in_reply_to_user_id: String,
            in_reply_to_username: String,
            interstitial: XTwitterScraper::TweetInterstitial,
            is_limited_reply: T::Boolean,
            is_note_tweet: T::Boolean,
            is_pinned: T::Boolean,
            is_quote_status: T::Boolean,
            is_reply: T::Boolean,
            is_retweet: T::Boolean,
            is_translatable: T::Boolean,
            jetfuel_attachment: T::Hash[Symbol, T.anything],
            lang: String,
            limited_actions:
              T::Array[XTwitterScraper::SearchTweet::LimitedAction],
            live_event_context: XTwitterScraper::SearchTweet::LiveEventContext,
            media: T::Array[XTwitterScraper::TweetMedia],
            note_tweet: XTwitterScraper::SearchTweet::NoteTweet,
            parent_tweet: XTwitterScraper::EmbeddedTweet,
            place: XTwitterScraper::SearchTweet::Place,
            possibly_sensitive: T::Boolean,
            post_cta: T::Hash[Symbol, T.anything],
            previous_counts: XTwitterScraper::SearchTweet::PreviousCounts,
            quoted_tweet: XTwitterScraper::EmbeddedTweet,
            quoted_tweet_id: String,
            quoted_tweet_permalink:
              XTwitterScraper::SearchTweet::QuotedTweetPermalink,
            quoted_tweet_unavailable:
              XTwitterScraper::SearchTweet::QuotedTweetUnavailable,
            reaction_context: XTwitterScraper::SearchTweet::ReactionContext,
            retweeted_at: T.nilable(Time),
            retweeted_tweet: XTwitterScraper::EmbeddedTweet,
            scopes: T::Hash[Symbol, T.anything],
            soft_intervention: XTwitterScraper::SearchTweet::SoftIntervention,
            source: String,
            sports_context: XTwitterScraper::SearchTweet::SportsContext,
            subscriber_badge: XTwitterScraper::TweetSubscriberBadge,
            text_highlights:
              T::Array[XTwitterScraper::SearchTweet::TextHighlight],
            tombstone: XTwitterScraper::TweetTombstone,
            type: String,
            unavailable_author_id: String,
            unknown_counts:
              T::Array[
                XTwitterScraper::SearchTweet::UnknownCount::TaggedSymbol
              ],
            unknown_fields:
              T::Array[
                XTwitterScraper::SearchTweet::UnknownField::TaggedSymbol
              ],
            unmentioned_user_ids: T::Array[String],
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

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :cover_media

        sig { params(cover_media: T::Hash[Symbol, T.anything]).void }
        attr_writer :cover_media

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig { returns(T.nilable(String)) }
        attr_reader :cover_media_url

        sig { params(cover_media_url: String).void }
        attr_writer :cover_media_url

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :lifecycle_state

        sig { params(lifecycle_state: T::Hash[Symbol, T.anything]).void }
        attr_writer :lifecycle_state

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, T.anything]).void }
        attr_writer :metadata

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
            cover_media: T::Hash[Symbol, T.anything],
            id: String,
            cover_media_url: String,
            lifecycle_state: T::Hash[Symbol, T.anything],
            metadata: T::Hash[Symbol, T.anything],
            preview_text: String,
            title: String
          ).returns(T.attached_class)
        end
        def self.new(
          cover_media: nil,
          id: nil,
          cover_media_url: nil,
          lifecycle_state: nil,
          metadata: nil,
          preview_text: nil,
          title: nil
        )
        end

        sig do
          override.returns(
            {
              cover_media: T::Hash[Symbol, T.anything],
              id: String,
              cover_media_url: String,
              lifecycle_state: T::Hash[Symbol, T.anything],
              metadata: T::Hash[Symbol, T.anything],
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

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :platform

        sig { params(platform: T::Hash[Symbol, T.anything]).void }
        attr_writer :platform

        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # Unresolved card user references.
        sig do
          returns(
            T.nilable(
              T::Array[XTwitterScraper::SearchTweet::Card::UserReferenceError]
            )
          )
        end
        attr_reader :user_reference_errors

        sig do
          params(
            user_reference_errors:
              T::Array[
                XTwitterScraper::SearchTweet::Card::UserReferenceError::OrHash
              ]
          ).void
        end
        attr_writer :user_reference_errors

        sig { returns(T.nilable(T::Array[XTwitterScraper::UserProfile])) }
        attr_reader :user_references

        sig do
          params(
            user_references: T::Array[XTwitterScraper::UserProfile::OrHash]
          ).void
        end
        attr_writer :user_references

        # Public card metadata attached to a tweet.
        sig do
          params(
            id: String,
            binding_values: T::Hash[Symbol, T.anything],
            name: String,
            platform: T::Hash[Symbol, T.anything],
            url: String,
            user_reference_errors:
              T::Array[
                XTwitterScraper::SearchTweet::Card::UserReferenceError::OrHash
              ],
            user_references: T::Array[XTwitterScraper::UserProfile::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          binding_values: nil,
          name: nil,
          platform: nil,
          url: nil,
          # Unresolved card user references.
          user_reference_errors: nil,
          user_references: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              binding_values: T::Hash[Symbol, T.anything],
              name: String,
              platform: T::Hash[Symbol, T.anything],
              url: String,
              user_reference_errors:
                T::Array[
                  XTwitterScraper::SearchTweet::Card::UserReferenceError
                ],
              user_references: T::Array[XTwitterScraper::UserProfile]
            }
          )
        end
        def to_hash
        end

        class UserReferenceError < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::SearchTweet::Card::UserReferenceError,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :message

          sig { params(message: String).void }
          attr_writer :message

          sig { returns(T.nilable(String)) }
          attr_reader :reason

          sig { params(reason: String).void }
          attr_writer :reason

          sig do
            params(message: String, reason: String).returns(T.attached_class)
          end
          def self.new(message: nil, reason: nil)
          end

          sig { override.returns({ message: String, reason: String }) }
          def to_hash
          end
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
        attr_reader :footer_icon_type

        sig { params(footer_icon_type: String).void }
        attr_writer :footer_icon_type

        sig { returns(T.nilable(String)) }
        attr_reader :icon_type

        sig { params(icon_type: String).void }
        attr_writer :icon_type

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

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, T.anything]).void }
        attr_writer :metadata

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
            footer_icon_type: String,
            icon_type: String,
            id: String,
            destination_url: String,
            footer: String,
            metadata: T::Hash[Symbol, T.anything],
            short_title: String,
            subtitle: String,
            title: String,
            visual_style: String
          ).returns(T.attached_class)
        end
        def self.new(
          footer_icon_type: nil,
          icon_type: nil,
          id: nil,
          destination_url: nil,
          footer: nil,
          metadata: nil,
          short_title: nil,
          subtitle: nil,
          title: nil,
          visual_style: nil
        )
        end

        sig do
          override.returns(
            {
              footer_icon_type: String,
              icon_type: String,
              id: String,
              destination_url: String,
              footer: String,
              metadata: T::Hash[Symbol, T.anything],
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

        sig { returns(T.nilable(String)) }
        attr_reader :initial_tweet_id

        sig { params(initial_tweet_id: String).void }
        attr_writer :initial_tweet_id

        # Edit history metadata returned by X.
        sig do
          params(
            editable_until_msecs: String,
            edit_tweet_ids: T::Array[String],
            initial_tweet_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          editable_until_msecs: nil,
          edit_tweet_ids: nil,
          initial_tweet_id: nil
        )
        end

        sig do
          override.returns(
            {
              editable_until_msecs: String,
              edit_tweet_ids: T::Array[String],
              initial_tweet_id: String
            }
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

        # Inline media positions in the Note Tweet text.
        sig do
          returns(
            T.nilable(
              T::Array[XTwitterScraper::SearchTweet::NoteTweet::InlineMedia]
            )
          )
        end
        attr_reader :inline_media

        sig do
          params(
            inline_media:
              T::Array[
                XTwitterScraper::SearchTweet::NoteTweet::InlineMedia::OrHash
              ]
          ).void
        end
        attr_writer :inline_media

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_expandable

        sig { params(is_expandable: T::Boolean).void }
        attr_writer :is_expandable

        # The Note's own ID, apart from the post's.
        sig { returns(T.nilable(String)) }
        attr_reader :note_id

        sig { params(note_id: String).void }
        attr_writer :note_id

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
            inline_media:
              T::Array[
                XTwitterScraper::SearchTweet::NoteTweet::InlineMedia::OrHash
              ],
            is_expandable: T::Boolean,
            note_id: String,
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
          # Inline media positions in the Note Tweet text.
          inline_media: nil,
          is_expandable: nil,
          # The Note's own ID, apart from the post's.
          note_id: nil,
          richtext_tags: nil
        )
        end

        sig do
          override.returns(
            {
              text: String,
              id: String,
              entities: T::Hash[Symbol, T.anything],
              inline_media:
                T::Array[XTwitterScraper::SearchTweet::NoteTweet::InlineMedia],
              is_expandable: T::Boolean,
              note_id: String,
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

        class InlineMedia < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::SearchTweet::NoteTweet::InlineMedia,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Whole number from 0.
          sig { returns(Integer) }
          attr_accessor :index

          sig { returns(String) }
          attr_accessor :media_id

          sig do
            params(index: Integer, media_id: String).returns(T.attached_class)
          end
          def self.new(
            # Whole number from 0.
            index:,
            media_id:
          )
          end

          sig { override.returns({ index: Integer, media_id: String }) }
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

      class CashtagAttachment < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::CashtagAttachment,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The cashtag with its `$`.
        sig { returns(String) }
        attr_accessor :cashtag

        # Span of each candle.
        sig { returns(T.nilable(String)) }
        attr_reader :candle_size

        sig { params(candle_size: String).void }
        attr_writer :candle_size

        # Span the chart covers.
        sig { returns(T.nilable(String)) }
        attr_reader :timeframe

        sig { params(timeframe: String).void }
        attr_writer :timeframe

        # Time of the chart's first candle.
        sig { returns(T.nilable(Time)) }
        attr_reader :start_time

        sig { params(start_time: Time).void }
        attr_writer :start_time

        # Time of the chart's last price.
        sig { returns(T.nilable(Time)) }
        attr_reader :end_time

        sig { params(end_time: Time).void }
        attr_writer :end_time

        # X's size for the chart.
        sig { returns(T.nilable(Integer)) }
        attr_reader :size_variant

        sig { params(size_variant: Integer).void }
        attr_writer :size_variant

        sig do
          params(
            cashtag: String,
            candle_size: String,
            timeframe: String,
            start_time: Time,
            end_time: Time,
            size_variant: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # The cashtag with its `$`.
          cashtag:,
          # Span of each candle.
          candle_size: nil,
          # Span the chart covers.
          timeframe: nil,
          # Time of the chart's first candle.
          start_time: nil,
          # Time of the chart's last price.
          end_time: nil,
          # X's size for the chart.
          size_variant: nil
        )
        end

        sig do
          override.returns(
            {
              cashtag: String,
              candle_size: String,
              timeframe: String,
              start_time: Time,
              end_time: Time,
              size_variant: Integer
            }
          )
        end
        def to_hash
        end
      end

      class ConversationControl < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::ConversationControl,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Regions whose accounts may reply, as country codes. Sent with the
        # `country_of_origin` mode.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :allowed_country_codes

        sig { params(allowed_country_codes: T::Array[String]).void }
        attr_writer :allowed_country_codes

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :invite_via_mention

        sig { params(invite_via_mention: T::Boolean).void }
        attr_writer :invite_via_mention

        # Reply policy from X's newer field, such as `my_network`, `premium` or
        # `country_of_origin`. Omitted when X sends none.
        sig { returns(T.nilable(String)) }
        attr_reader :mode

        sig { params(mode: String).void }
        attr_writer :mode

        # The conversation owner's account ID.
        sig { returns(T.nilable(String)) }
        attr_reader :owner_id

        sig { params(owner_id: String).void }
        attr_writer :owner_id

        sig { returns(T.nilable(String)) }
        attr_reader :owner_username

        sig { params(owner_username: String).void }
        attr_writer :owner_username

        sig { returns(T.nilable(String)) }
        attr_reader :policy

        sig { params(policy: String).void }
        attr_writer :policy

        # Reply policy & conversation owner.
        sig do
          params(
            allowed_country_codes: T::Array[String],
            invite_via_mention: T::Boolean,
            mode: String,
            owner_id: String,
            owner_username: String,
            policy: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Regions whose accounts may reply, as country codes. Sent with the
          # `country_of_origin` mode.
          allowed_country_codes: nil,
          invite_via_mention: nil,
          # Reply policy from X's newer field, such as `my_network`, `premium` or
          # `country_of_origin`. Omitted when X sends none.
          mode: nil,
          # The conversation owner's account ID.
          owner_id: nil,
          owner_username: nil,
          policy: nil
        )
        end

        sig do
          override.returns(
            {
              allowed_country_codes: T::Array[String],
              invite_via_mention: T::Boolean,
              mode: String,
              owner_id: String,
              owner_username: String,
              policy: String
            }
          )
        end
        def to_hash
        end
      end

      class LimitedAction < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::LimitedAction,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :action

        sig { params(action: String).void }
        attr_writer :action

        sig do
          returns(
            T.nilable(XTwitterScraper::SearchTweet::LimitedAction::Prompt)
          )
        end
        attr_reader :prompt

        sig do
          params(
            prompt: XTwitterScraper::SearchTweet::LimitedAction::Prompt::OrHash
          ).void
        end
        attr_writer :prompt

        sig do
          params(
            action: String,
            prompt: XTwitterScraper::SearchTweet::LimitedAction::Prompt::OrHash
          ).returns(T.attached_class)
        end
        def self.new(action: nil, prompt: nil)
        end

        sig do
          override.returns(
            {
              action: String,
              prompt: XTwitterScraper::SearchTweet::LimitedAction::Prompt
            }
          )
        end
        def to_hash
        end

        class Prompt < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::SearchTweet::LimitedAction::Prompt,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :cta_type

          sig { params(cta_type: String).void }
          attr_writer :cta_type

          sig { returns(T.nilable(String)) }
          attr_reader :headline

          sig { params(headline: String).void }
          attr_writer :headline

          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :metadata

          sig { params(metadata: T::Hash[Symbol, T.anything]).void }
          attr_writer :metadata

          sig { returns(T.nilable(String)) }
          attr_reader :subtext

          sig { params(subtext: String).void }
          attr_writer :subtext

          sig do
            params(
              cta_type: String,
              headline: String,
              metadata: T::Hash[Symbol, T.anything],
              subtext: String
            ).returns(T.attached_class)
          end
          def self.new(
            cta_type: nil,
            headline: nil,
            metadata: nil,
            subtext: nil
          )
          end

          sig do
            override.returns(
              {
                cta_type: String,
                headline: String,
                metadata: T::Hash[Symbol, T.anything],
                subtext: String
              }
            )
          end
          def to_hash
          end
        end
      end

      class LiveEventContext < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::LiveEventContext,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Event name.
        sig { returns(T.nilable(String)) }
        attr_reader :title

        sig { params(title: String).void }
        attr_writer :title

        # The event's page on X.
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # The event's image.
        sig { returns(T.nilable(String)) }
        attr_reader :image_url

        sig { params(image_url: String).void }
        attr_writer :image_url

        # The live event the post belongs to, such as an election.
        sig do
          params(title: String, url: String, image_url: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Event name.
          title: nil,
          # The event's page on X.
          url: nil,
          # The event's image.
          image_url: nil
        )
        end

        sig do
          override.returns({ title: String, url: String, image_url: String })
        end
        def to_hash
        end
      end

      class QuotedTweetPermalink < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::QuotedTweetPermalink,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :display_url

        sig { params(display_url: String).void }
        attr_writer :display_url

        sig { returns(T.nilable(String)) }
        attr_reader :expanded_url

        sig { params(expanded_url: String).void }
        attr_writer :expanded_url

        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # The quoted post's link, kept when X withholds that post.
        sig do
          params(
            display_url: String,
            expanded_url: String,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(display_url: nil, expanded_url: nil, url: nil)
        end

        sig do
          override.returns(
            { display_url: String, expanded_url: String, url: String }
          )
        end
        def to_hash
        end
      end

      class QuotedTweetUnavailable < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::QuotedTweetUnavailable,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # X's reason, such as `Suspended` for a suspended author or `Protected` for an
        # author who protects their posts.
        sig { returns(String) }
        attr_accessor :reason

        # Why X shows no quoted post. Omitted when X names no reason.
        sig { params(reason: String).returns(T.attached_class) }
        def self.new(
          # X's reason, such as `Suspended` for a suspended author or `Protected` for an
          # author who protects their posts.
          reason:
        )
        end

        sig { override.returns({ reason: String }) }
        def to_hash
        end
      end

      class ReactionContext < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::ReactionContext,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The post this one reacts to, with the same fields. X often sends only its ID,
        # author & edit history. Then unknownFields lists text, and the flags X did not
        # send are left out.
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :reacted_to_post

        sig { params(reacted_to_post: T::Hash[Symbol, T.anything]).void }
        attr_writer :reacted_to_post

        # Referenced post ID.
        sig { returns(T.nilable(String)) }
        attr_reader :reacted_to_post_id

        sig { params(reacted_to_post_id: String).void }
        attr_writer :reacted_to_post_id

        sig { returns(T.nilable(XTwitterScraper::UserProfile)) }
        attr_reader :reacted_to_user

        sig do
          params(reacted_to_user: XTwitterScraper::UserProfile::OrHash).void
        end
        attr_writer :reacted_to_user

        # Public post & user this reaction references.
        sig do
          params(
            reacted_to_post: T::Hash[Symbol, T.anything],
            reacted_to_post_id: String,
            reacted_to_user: XTwitterScraper::UserProfile::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The post this one reacts to, with the same fields. X often sends only its ID,
          # author & edit history. Then unknownFields lists text, and the flags X did not
          # send are left out.
          reacted_to_post: nil,
          # Referenced post ID.
          reacted_to_post_id: nil,
          reacted_to_user: nil
        )
        end

        sig do
          override.returns(
            {
              reacted_to_post: T::Hash[Symbol, T.anything],
              reacted_to_post_id: String,
              reacted_to_user: XTwitterScraper::UserProfile
            }
          )
        end
        def to_hash
        end
      end

      class SoftIntervention < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::SoftIntervention,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The label's kind. `Fosnr` marks a post X keeps up but shows to fewer people.
        sig { returns(T.nilable(String)) }
        attr_reader :display_type

        sig { params(display_type: String).void }
        attr_writer :display_type

        # Whether X prompts people before they engage with the post.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :engagement_nudge

        sig { params(engagement_nudge: T::Boolean).void }
        attr_writer :engagement_nudge

        sig do
          returns(
            T.nilable(XTwitterScraper::SearchTweet::SoftIntervention::Text)
          )
        end
        attr_reader :text

        sig do
          params(
            text: XTwitterScraper::SearchTweet::SoftIntervention::Text::OrHash
          ).void
        end
        attr_writer :text

        # The page that explains the label.
        sig do
          returns(
            T.nilable(XTwitterScraper::SearchTweet::SoftIntervention::Url)
          )
        end
        attr_reader :url

        sig do
          params(
            url: XTwitterScraper::SearchTweet::SoftIntervention::Url::OrHash
          ).void
        end
        attr_writer :url

        # The label X shows under a post whose reach it limits. It links to the page that
        # explains it.
        sig do
          params(
            display_type: String,
            engagement_nudge: T::Boolean,
            text: XTwitterScraper::SearchTweet::SoftIntervention::Text::OrHash,
            url: XTwitterScraper::SearchTweet::SoftIntervention::Url::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The label's kind. `Fosnr` marks a post X keeps up but shows to fewer people.
          display_type: nil,
          # Whether X prompts people before they engage with the post.
          engagement_nudge: nil,
          text: nil,
          # The page that explains the label.
          url: nil
        )
        end

        sig do
          override.returns(
            {
              display_type: String,
              engagement_nudge: T::Boolean,
              text: XTwitterScraper::SearchTweet::SoftIntervention::Text,
              url: XTwitterScraper::SearchTweet::SoftIntervention::Url
            }
          )
        end
        def to_hash
        end

        class Text < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::SearchTweet::SoftIntervention::Text,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # The label's text.
          sig { returns(T.nilable(String)) }
          attr_reader :text

          sig { params(text: String).void }
          attr_writer :text

          # Whether the label reads right to left.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :rtl

          sig { params(rtl: T::Boolean).void }
          attr_writer :rtl

          # Links inside the label, by character range.
          sig do
            returns(
              T.nilable(
                T::Array[
                  XTwitterScraper::SearchTweet::SoftIntervention::Text::Entity
                ]
              )
            )
          end
          attr_reader :entities

          sig do
            params(
              entities:
                T::Array[
                  XTwitterScraper::SearchTweet::SoftIntervention::Text::Entity::OrHash
                ]
            ).void
          end
          attr_writer :entities

          sig do
            params(
              text: String,
              rtl: T::Boolean,
              entities:
                T::Array[
                  XTwitterScraper::SearchTweet::SoftIntervention::Text::Entity::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # The label's text.
            text: nil,
            # Whether the label reads right to left.
            rtl: nil,
            # Links inside the label, by character range.
            entities: nil
          )
          end

          sig do
            override.returns(
              {
                text: String,
                rtl: T::Boolean,
                entities:
                  T::Array[
                    XTwitterScraper::SearchTweet::SoftIntervention::Text::Entity
                  ]
              }
            )
          end
          def to_hash
          end

          class Entity < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::SearchTweet::SoftIntervention::Text::Entity,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # Whole number from 0.
            sig { returns(T.nilable(Integer)) }
            attr_reader :from_index

            sig { params(from_index: Integer).void }
            attr_writer :from_index

            # Whole number from 0.
            sig { returns(T.nilable(Integer)) }
            attr_reader :to_index

            sig { params(to_index: Integer).void }
            attr_writer :to_index

            sig do
              returns(
                T.nilable(
                  XTwitterScraper::SearchTweet::SoftIntervention::Text::Entity::Ref
                )
              )
            end
            attr_reader :ref

            sig do
              params(
                ref:
                  XTwitterScraper::SearchTweet::SoftIntervention::Text::Entity::Ref::OrHash
              ).void
            end
            attr_writer :ref

            sig do
              params(
                from_index: Integer,
                to_index: Integer,
                ref:
                  XTwitterScraper::SearchTweet::SoftIntervention::Text::Entity::Ref::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Whole number from 0.
              from_index: nil,
              # Whole number from 0.
              to_index: nil,
              ref: nil
            )
            end

            sig do
              override.returns(
                {
                  from_index: Integer,
                  to_index: Integer,
                  ref:
                    XTwitterScraper::SearchTweet::SoftIntervention::Text::Entity::Ref
                }
              )
            end
            def to_hash
            end

            class Ref < XTwitterScraper::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    XTwitterScraper::SearchTweet::SoftIntervention::Text::Entity::Ref,
                    XTwitterScraper::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(String)) }
              attr_reader :type

              sig { params(type: String).void }
              attr_writer :type

              sig { returns(T.nilable(String)) }
              attr_reader :url

              sig { params(url: String).void }
              attr_writer :url

              sig { returns(T.nilable(String)) }
              attr_reader :url_type

              sig { params(url_type: String).void }
              attr_writer :url_type

              sig { returns(T.nilable(String)) }
              attr_reader :text

              sig { params(text: String).void }
              attr_writer :text

              sig { returns(T.nilable(String)) }
              attr_reader :screen_name

              sig { params(screen_name: String).void }
              attr_writer :screen_name

              sig do
                params(
                  type: String,
                  url: String,
                  url_type: String,
                  text: String,
                  screen_name: String
                ).returns(T.attached_class)
              end
              def self.new(
                type: nil,
                url: nil,
                url_type: nil,
                text: nil,
                screen_name: nil
              )
              end

              sig do
                override.returns(
                  {
                    type: String,
                    url: String,
                    url_type: String,
                    text: String,
                    screen_name: String
                  }
                )
              end
              def to_hash
              end
            end
          end
        end

        class Url < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::SearchTweet::SoftIntervention::Url,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          sig { returns(T.nilable(String)) }
          attr_reader :url_type

          sig { params(url_type: String).void }
          attr_writer :url_type

          # The page that explains the label.
          sig do
            params(url: String, url_type: String).returns(T.attached_class)
          end
          def self.new(url: nil, url_type: nil)
          end

          sig { override.returns({ url: String, url_type: String }) }
          def to_hash
          end
        end
      end

      class SportsContext < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::SportsContext,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Game ID.
        sig { returns(T.nilable(String)) }
        attr_reader :game_id

        sig { params(game_id: String).void }
        attr_writer :game_id

        # League ID.
        sig { returns(T.nilable(String)) }
        attr_reader :league

        sig { params(league: String).void }
        attr_writer :league

        # Game title.
        sig { returns(T.nilable(String)) }
        attr_reader :title

        sig { params(title: String).void }
        attr_writer :title

        # Game link.
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # Reported game state.
        sig { returns(T.nilable(String)) }
        attr_reader :state

        sig { params(state: String).void }
        attr_writer :state

        # Game progress text.
        sig { returns(T.nilable(String)) }
        attr_reader :status_text

        sig { params(status_text: String).void }
        attr_writer :status_text

        # Scheduled Unix milliseconds, retaining the source type.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :scheduled_at_ms

        sig { params(scheduled_at_ms: T.anything).void }
        attr_writer :scheduled_at_ms

        # Teams & reported scores.
        sig do
          returns(
            T.nilable(
              T::Array[XTwitterScraper::SearchTweet::SportsContext::Competitor]
            )
          )
        end
        attr_reader :competitors

        sig do
          params(
            competitors:
              T::Array[
                XTwitterScraper::SearchTweet::SportsContext::Competitor::OrHash
              ]
          ).void
        end
        attr_writer :competitors

        # Game metadata attached to this post.
        sig do
          params(
            game_id: String,
            league: String,
            title: String,
            url: String,
            state: String,
            status_text: String,
            scheduled_at_ms: T.anything,
            competitors:
              T::Array[
                XTwitterScraper::SearchTweet::SportsContext::Competitor::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Game ID.
          game_id: nil,
          # League ID.
          league: nil,
          # Game title.
          title: nil,
          # Game link.
          url: nil,
          # Reported game state.
          state: nil,
          # Game progress text.
          status_text: nil,
          # Scheduled Unix milliseconds, retaining the source type.
          scheduled_at_ms: nil,
          # Teams & reported scores.
          competitors: nil
        )
        end

        sig do
          override.returns(
            {
              game_id: String,
              league: String,
              title: String,
              url: String,
              state: String,
              status_text: String,
              scheduled_at_ms: T.anything,
              competitors:
                T::Array[
                  XTwitterScraper::SearchTweet::SportsContext::Competitor
                ]
            }
          )
        end
        def to_hash
        end

        class Competitor < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::SearchTweet::SportsContext::Competitor,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Team ID.
          sig { returns(T.nilable(String)) }
          attr_reader :team_id

          sig { params(team_id: String).void }
          attr_writer :team_id

          # Team display color.
          sig { returns(T.nilable(String)) }
          attr_reader :color

          sig { params(color: String).void }
          attr_writer :color

          # Active competitor.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :is_active

          sig { params(is_active: T::Boolean).void }
          attr_writer :is_active

          # Winning competitor.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :is_winner

          sig { params(is_winner: T::Boolean).void }
          attr_writer :is_winner

          # Team abbreviation.
          sig { returns(T.nilable(String)) }
          attr_reader :abbreviation

          sig { params(abbreviation: String).void }
          attr_writer :abbreviation

          # Team name.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # Score display text.
          sig { returns(T.nilable(String)) }
          attr_reader :score

          sig { params(score: String).void }
          attr_writer :score

          # Logo for light backgrounds.
          sig { returns(T.nilable(String)) }
          attr_reader :logo_url

          sig { params(logo_url: String).void }
          attr_writer :logo_url

          # Logo for dark backgrounds.
          sig { returns(T.nilable(String)) }
          attr_reader :dark_logo_url

          sig { params(dark_logo_url: String).void }
          attr_writer :dark_logo_url

          sig do
            params(
              team_id: String,
              color: String,
              is_active: T::Boolean,
              is_winner: T::Boolean,
              abbreviation: String,
              name: String,
              score: String,
              logo_url: String,
              dark_logo_url: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Team ID.
            team_id: nil,
            # Team display color.
            color: nil,
            # Active competitor.
            is_active: nil,
            # Winning competitor.
            is_winner: nil,
            # Team abbreviation.
            abbreviation: nil,
            # Team name.
            name: nil,
            # Score display text.
            score: nil,
            # Logo for light backgrounds.
            logo_url: nil,
            # Logo for dark backgrounds.
            dark_logo_url: nil
          )
          end

          sig do
            override.returns(
              {
                team_id: String,
                color: String,
                is_active: T::Boolean,
                is_winner: T::Boolean,
                abbreviation: String,
                name: String,
                score: String,
                logo_url: String,
                dark_logo_url: String
              }
            )
          end
          def to_hash
          end
        end
      end

      class TextHighlight < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::SearchTweet::TextHighlight,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The first code point of the match.
        sig { returns(Integer) }
        attr_accessor :start_index

        # The first code point after the match.
        sig { returns(Integer) }
        attr_accessor :end_index

        sig do
          params(start_index: Integer, end_index: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # The first code point of the match.
          start_index:,
          # The first code point after the match.
          end_index:
        )
        end

        sig { override.returns({ start_index: Integer, end_index: Integer }) }
        def to_hash
        end
      end

      module UnknownCount
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::SearchTweet::UnknownCount)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RETWEET_COUNT =
          T.let(
            :retweetCount,
            XTwitterScraper::SearchTweet::UnknownCount::TaggedSymbol
          )
        REPLY_COUNT =
          T.let(
            :replyCount,
            XTwitterScraper::SearchTweet::UnknownCount::TaggedSymbol
          )
        LIKE_COUNT =
          T.let(
            :likeCount,
            XTwitterScraper::SearchTweet::UnknownCount::TaggedSymbol
          )
        QUOTE_COUNT =
          T.let(
            :quoteCount,
            XTwitterScraper::SearchTweet::UnknownCount::TaggedSymbol
          )
        VIEW_COUNT =
          T.let(
            :viewCount,
            XTwitterScraper::SearchTweet::UnknownCount::TaggedSymbol
          )
        BOOKMARK_COUNT =
          T.let(
            :bookmarkCount,
            XTwitterScraper::SearchTweet::UnknownCount::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::SearchTweet::UnknownCount::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module UnknownField
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::SearchTweet::UnknownField)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TEXT =
          T.let(:text, XTwitterScraper::SearchTweet::UnknownField::TaggedSymbol)

        sig do
          override.returns(
            T::Array[XTwitterScraper::SearchTweet::UnknownField::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
