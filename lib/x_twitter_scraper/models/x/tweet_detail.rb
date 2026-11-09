# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

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

        # @!attribute article
        #   Article metadata attached to a tweet.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail::Article, nil]
        optional :article, -> { XTwitterScraper::X::TweetDetail::Article }

        # @!attribute author
        #   Tweet author profile. The lookup route always includes follower count and
        #   verification state. Other profile fields appear when available.
        #
        #   @return [XTwitterScraper::Models::X::TweetAuthor, nil]
        optional :author, -> { XTwitterScraper::X::TweetAuthor }

        # @!attribute author_unavailable
        #
        #   @return [XTwitterScraper::Models::TweetAuthorUnavailable, nil]
        optional :author_unavailable,
                 -> { XTwitterScraper::TweetAuthorUnavailable },
                 api_name: :authorUnavailable

        # @!attribute card
        #   Public card metadata attached to a tweet.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail::Card, nil]
        optional :card, -> { XTwitterScraper::X::TweetDetail::Card }

        # @!attribute cashtag_attachments
        #   Price charts the author attached under the post, 1 per cashtag. Absent when the
        #   post has none. X may send a cashtag without a chart window.
        #
        #   @return [Array<XTwitterScraper::Models::X::TweetDetail::CashtagAttachment>, nil]
        optional :cashtag_attachments,
                 -> {
                   XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::TweetDetail::CashtagAttachment]
                 },
                 api_name: :cashtagAttachments

        # @!attribute community_id
        #   Community ID.
        #
        #   @return [String, nil]
        optional :community_id, String, api_name: :communityId

        # @!attribute community_name
        #   Community name. Present when X sends it with the post.
        #
        #   @return [String, nil]
        optional :community_name, String, api_name: :communityName

        # @!attribute community_note
        #   Community Note presentation metadata returned by X.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail::CommunityNote, nil]
        optional :community_note,
                 -> {
                   XTwitterScraper::X::TweetDetail::CommunityNote
                 },
                 api_name: :communityNote

        # @!attribute content_disclosure
        #   Content disclosure metadata shown by X when a tweet is labeled as paid
        #   partnership content or AI-generated media.
        #
        #   @return [XTwitterScraper::Models::ContentDisclosure, nil]
        optional :content_disclosure, -> { XTwitterScraper::ContentDisclosure }, api_name: :contentDisclosure

        # @!attribute conversation_control
        #   Reply policy & conversation owner.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail::ConversationControl, nil]
        optional :conversation_control,
                 -> { XTwitterScraper::X::TweetDetail::ConversationControl },
                 api_name: :conversationControl

        # @!attribute conversation_id
        #   ID of the root tweet in the conversation thread
        #
        #   @return [String, nil]
        optional :conversation_id, String, api_name: :conversationId

        # @!attribute coordinates
        #   Author-published point, with longitude before latitude.
        #
        #   @return [XTwitterScraper::Models::TweetPoint, nil]
        optional :coordinates, -> { XTwitterScraper::TweetPoint }

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

        # @!attribute edit
        #   Edit history metadata returned by X.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail::Edit, nil]
        optional :edit, -> { XTwitterScraper::X::TweetDetail::Edit }

        # @!attribute entities
        #   Parsed entities from the tweet text (URLs, mentions, hashtags, media)
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :entities, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

        # @!attribute exclusive_content
        #
        #   @return [XTwitterScraper::Models::TweetExclusiveContent, nil]
        optional :exclusive_content,
                 -> { XTwitterScraper::TweetExclusiveContent },
                 api_name: :exclusiveContent

        # @!attribute geo
        #   Author-published point, with latitude before longitude.
        #
        #   @return [XTwitterScraper::Models::TweetPoint, nil]
        optional :geo, -> { XTwitterScraper::TweetPoint }

        # @!attribute grok_share_attachment
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :grok_share_attachment,
                 XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
                 api_name: :grokShareAttachment

        # @!attribute grok_translated_post
        #   Grok's translation of the post, as X shows it.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :grok_translated_post,
                 XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
                 api_name: :grokTranslatedPost

        # @!attribute has_community_notes
        #   Whether X holds Community Notes on the post, shown or not.
        #
        #   @return [Boolean, nil]
        optional :has_community_notes, XTwitterScraper::Internal::Type::Boolean, api_name: :hasCommunityNotes

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

        # @!attribute interstitial
        #
        #   @return [XTwitterScraper::Models::TweetInterstitial, nil]
        optional :interstitial, -> { XTwitterScraper::TweetInterstitial }

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

        # @!attribute is_pinned
        #
        #   @return [Boolean, nil]
        optional :is_pinned, XTwitterScraper::Internal::Type::Boolean, api_name: :isPinned

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

        # @!attribute is_retweet
        #
        #   @return [Boolean, nil]
        optional :is_retweet, XTwitterScraper::Internal::Type::Boolean, api_name: :isRetweet

        # @!attribute is_translatable
        #
        #   @return [Boolean, nil]
        optional :is_translatable, XTwitterScraper::Internal::Type::Boolean, api_name: :isTranslatable

        # @!attribute jetfuel_attachment
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :jetfuel_attachment,
                 XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
                 api_name: :jetfuelAttachment

        # @!attribute lang
        #   Tweet language code
        #
        #   @return [String, nil]
        optional :lang, String

        # @!attribute limited_actions
        #   Public restrictions & prompts.
        #
        #   @return [Array<XTwitterScraper::Models::X::TweetDetail::LimitedAction>, nil]
        optional :limited_actions,
                 -> {
                   XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::TweetDetail::LimitedAction]
                 },
                 api_name: :limitedActions

        # @!attribute live_event_context
        #   The live event the post belongs to, such as an election.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail::LiveEventContext, nil]
        optional :live_event_context,
                 -> { XTwitterScraper::X::TweetDetail::LiveEventContext },
                 api_name: :liveEventContext

        # @!attribute media
        #   Attached media items, omitted when the tweet has no media
        #
        #   @return [Array<XTwitterScraper::Models::TweetMedia>, nil]
        optional :media, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetMedia] }

        # @!attribute note_tweet
        #   Complete Note Tweet content and rich-text metadata.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail::NoteTweet, nil]
        optional :note_tweet, -> { XTwitterScraper::X::TweetDetail::NoteTweet }, api_name: :noteTweet

        # @!attribute parent_tweet
        #
        #   @return [XTwitterScraper::Models::EmbeddedTweet, nil]
        optional :parent_tweet, -> { XTwitterScraper::EmbeddedTweet }, api_name: :parentTweet

        # @!attribute place
        #   Public place metadata attached to a tweet.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail::Place, nil]
        optional :place, -> { XTwitterScraper::X::TweetDetail::Place }

        # @!attribute possibly_sensitive
        #
        #   @return [Boolean, nil]
        optional :possibly_sensitive, XTwitterScraper::Internal::Type::Boolean, api_name: :possiblySensitive

        # @!attribute post_cta
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :post_cta,
                 XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
                 api_name: :postCta

        # @!attribute previous_counts
        #   Engagement counts retained from a prior tweet edit.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail::PreviousCounts, nil]
        optional :previous_counts,
                 -> { XTwitterScraper::X::TweetDetail::PreviousCounts },
                 api_name: :previousCounts

        # @!attribute quoted_tweet
        #   Quoted or retweeted tweet context. Every object includes id, text, and
        #   engagement metrics. A zero metric can mean X did not report the count. Author,
        #   media, and conversation fields appear when available.
        #
        #   @return [XTwitterScraper::Models::EmbeddedTweet, nil]
        optional :quoted_tweet, -> { XTwitterScraper::EmbeddedTweet }

        # @!attribute quoted_tweet_id
        #
        #   @return [String, nil]
        optional :quoted_tweet_id, String, api_name: :quotedTweetId

        # @!attribute quoted_tweet_permalink
        #   The quoted post's link, kept when X withholds that post.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail::QuotedTweetPermalink, nil]
        optional :quoted_tweet_permalink,
                 -> { XTwitterScraper::X::TweetDetail::QuotedTweetPermalink },
                 api_name: :quotedTweetPermalink

        # @!attribute quoted_tweet_unavailable
        #   Why X shows no quoted post. Omitted when X names no reason.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail::QuotedTweetUnavailable, nil]
        optional :quoted_tweet_unavailable,
                 -> { XTwitterScraper::X::TweetDetail::QuotedTweetUnavailable },
                 api_name: :quotedTweetUnavailable

        # @!attribute reaction_context
        #   Public post & user this reaction references.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail::ReactionContext, nil]
        optional :reaction_context,
                 -> { XTwitterScraper::X::TweetDetail::ReactionContext },
                 api_name: :reactionContext

        # @!attribute retweeted_at
        #   Repost event time in UTC. Null when unavailable. Omitted for other posts.
        #
        #   @return [Time, nil]
        optional :retweeted_at, Time, api_name: :retweetedAt, nil?: true

        # @!attribute retweeted_tweet
        #   Quoted or retweeted tweet context. Every object includes id, text, and
        #   engagement metrics. A zero metric can mean X did not report the count. Author,
        #   media, and conversation fields appear when available.
        #
        #   @return [XTwitterScraper::Models::EmbeddedTweet, nil]
        optional :retweeted_tweet, -> { XTwitterScraper::EmbeddedTweet }

        # @!attribute scopes
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :scopes, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

        # @!attribute soft_intervention
        #   The label X shows under a post whose reach it limits. It links to the page that
        #   explains it.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail::SoftIntervention, nil]
        optional :soft_intervention,
                 -> { XTwitterScraper::X::TweetDetail::SoftIntervention },
                 api_name: :softIntervention

        # @!attribute source
        #   Client application used to post this tweet
        #
        #   @return [String, nil]
        optional :source, String

        # @!attribute sports_context
        #   Game metadata attached to this post.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail::SportsContext, nil]
        optional :sports_context,
                 -> { XTwitterScraper::X::TweetDetail::SportsContext },
                 api_name: :sportsContext

        # @!attribute subscriber_badge
        #
        #   @return [XTwitterScraper::Models::TweetSubscriberBadge, nil]
        optional :subscriber_badge, -> { XTwitterScraper::TweetSubscriberBadge }, api_name: :subscriberBadge

        # @!attribute text_highlights
        #   Where `text` matches the search, on each row a search read. Offsets count code
        #   points of `text`, as `displayTextRange` does. Empty when the post holds no
        #   marked match. Highlights cover a post's first 280 characters.
        #
        #   @return [Array<XTwitterScraper::Models::X::TweetDetail::TextHighlight>, nil]
        optional :text_highlights,
                 -> {
                   XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::TweetDetail::TextHighlight]
                 },
                 api_name: :textHighlights

        # @!attribute tombstone
        #
        #   @return [XTwitterScraper::Models::TweetTombstone, nil]
        optional :tombstone, -> { XTwitterScraper::TweetTombstone }

        # @!attribute type
        #   Tweet result type
        #
        #   @return [String, nil]
        optional :type, String

        # @!attribute unavailable_author_id
        #   The author's ID when X withholds the author's profile.
        #
        #   @return [String, nil]
        optional :unavailable_author_id, String, api_name: :unavailableAuthorId

        # @!attribute unknown_counts
        #   The counts X did not send for this post. Each one reads 0, so treat it as
        #   unknown rather than none. Names follow the response's key style, so
        #   `xquik-api-contract: 2026-04-29` lists bookmark_count. Posts from before X
        #   counted views, & new posts X has not counted views for yet, list viewCount. Left
        #   out when X sent every count. Counts X didn't send are listed in `unknownCounts`,
        #   never shown as 0.
        #
        #   @return [Array<Symbol, XTwitterScraper::Models::X::TweetDetail::UnknownCount>, nil]
        optional :unknown_counts,
                 -> {
                   XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::X::TweetDetail::UnknownCount]
                 },
                 api_name: :unknownCounts

        # @!attribute unknown_fields
        #   The fields X did not send for this post. text reads empty, so treat it as
        #   unknown rather than empty. Left out when X sent the text.
        #
        #   @return [Array<Symbol, XTwitterScraper::Models::X::TweetDetail::UnknownField>, nil]
        optional :unknown_fields,
                 -> {
                   XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::X::TweetDetail::UnknownField]
                 },
                 api_name: :unknownFields

        # @!attribute unmentioned_user_ids
        #   User IDs that left this conversation.
        #
        #   @return [Array<String>, nil]
        optional :unmentioned_user_ids,
                 XTwitterScraper::Internal::Type::ArrayOf[String],
                 api_name: :unmentionedUserIds

        # @!attribute url
        #   Tweet permalink URL
        #
        #   @return [String, nil]
        optional :url, String

        # @!attribute view_state
        #
        #   @return [String, nil]
        optional :view_state, String, api_name: :viewState

        # @!method initialize(id:, bookmark_count:, like_count:, quote_count:, reply_count:, retweet_count:, text:, view_count:, article: nil, author: nil, author_unavailable: nil, card: nil, cashtag_attachments: nil, community_id: nil, community_name: nil, community_note: nil, content_disclosure: nil, conversation_control: nil, conversation_id: nil, coordinates: nil, created_at: nil, display_text_range: nil, edit: nil, entities: nil, exclusive_content: nil, geo: nil, grok_share_attachment: nil, grok_translated_post: nil, has_community_notes: nil, in_reply_to_id: nil, in_reply_to_user_id: nil, in_reply_to_username: nil, interstitial: nil, is_limited_reply: nil, is_note_tweet: nil, is_pinned: nil, is_quote_status: nil, is_reply: nil, is_retweet: nil, is_translatable: nil, jetfuel_attachment: nil, lang: nil, limited_actions: nil, live_event_context: nil, media: nil, note_tweet: nil, parent_tweet: nil, place: nil, possibly_sensitive: nil, post_cta: nil, previous_counts: nil, quoted_tweet: nil, quoted_tweet_id: nil, quoted_tweet_permalink: nil, quoted_tweet_unavailable: nil, reaction_context: nil, retweeted_at: nil, retweeted_tweet: nil, scopes: nil, soft_intervention: nil, source: nil, sports_context: nil, subscriber_badge: nil, text_highlights: nil, tombstone: nil, type: nil, unavailable_author_id: nil, unknown_counts: nil, unknown_fields: nil, unmentioned_user_ids: nil, url: nil, view_state: nil)
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
        #   @param article [XTwitterScraper::Models::X::TweetDetail::Article] Article metadata attached to a tweet.
        #
        #   @param author [XTwitterScraper::Models::X::TweetAuthor] Tweet author profile. The lookup route always includes follower count and verifi
        #
        #   @param author_unavailable [XTwitterScraper::Models::TweetAuthorUnavailable]
        #
        #   @param card [XTwitterScraper::Models::X::TweetDetail::Card] Public card metadata attached to a tweet.
        #
        #   @param cashtag_attachments [Array<XTwitterScraper::Models::X::TweetDetail::CashtagAttachment>] Price charts the author attached under the post, 1 per cashtag. Absent when the
        #
        #   @param community_id [String] Community ID.
        #
        #   @param community_name [String] Community name. Present when X sends it with the post.
        #
        #   @param community_note [XTwitterScraper::Models::X::TweetDetail::CommunityNote] Community Note presentation metadata returned by X.
        #
        #   @param content_disclosure [XTwitterScraper::Models::ContentDisclosure] Content disclosure metadata shown by X when a tweet is labeled as paid partnersh
        #
        #   @param conversation_control [XTwitterScraper::Models::X::TweetDetail::ConversationControl] Reply policy & conversation owner.
        #
        #   @param conversation_id [String] ID of the root tweet in the conversation thread
        #
        #   @param coordinates [XTwitterScraper::Models::TweetPoint] Author-published point, with longitude before latitude.
        #
        #   @param created_at [String]
        #
        #   @param display_text_range [Array<Integer>] Start and end offsets for rendered tweet text
        #
        #   @param edit [XTwitterScraper::Models::X::TweetDetail::Edit] Edit history metadata returned by X.
        #
        #   @param entities [Hash{Symbol=>Object}] Parsed entities from the tweet text (URLs, mentions, hashtags, media)
        #
        #   @param exclusive_content [XTwitterScraper::Models::TweetExclusiveContent]
        #
        #   @param geo [XTwitterScraper::Models::TweetPoint] Author-published point, with latitude before longitude.
        #
        #   @param grok_share_attachment [Hash{Symbol=>Object}]
        #
        #   @param grok_translated_post [Hash{Symbol=>Object}] Grok's translation of the post, as X shows it.
        #
        #   @param has_community_notes [Boolean] Whether X holds Community Notes on the post, shown or not.
        #
        #   @param in_reply_to_id [String] Tweet ID being replied to
        #
        #   @param in_reply_to_user_id [String] User ID being replied to
        #
        #   @param in_reply_to_username [String] Username being replied to
        #
        #   @param interstitial [XTwitterScraper::Models::TweetInterstitial]
        #
        #   @param is_limited_reply [Boolean] Whether replies are limited for this tweet
        #
        #   @param is_note_tweet [Boolean] Whether this is a Note Tweet (long-form post, up to 25,000 characters)
        #
        #   @param is_pinned [Boolean]
        #
        #   @param is_quote_status [Boolean] Whether this tweet quotes another tweet
        #
        #   @param is_reply [Boolean] Whether this tweet is a reply to another tweet
        #
        #   @param is_retweet [Boolean]
        #
        #   @param is_translatable [Boolean]
        #
        #   @param jetfuel_attachment [Hash{Symbol=>Object}]
        #
        #   @param lang [String] Tweet language code
        #
        #   @param limited_actions [Array<XTwitterScraper::Models::X::TweetDetail::LimitedAction>] Public restrictions & prompts.
        #
        #   @param live_event_context [XTwitterScraper::Models::X::TweetDetail::LiveEventContext] The live event the post belongs to, such as an election.
        #
        #   @param media [Array<XTwitterScraper::Models::TweetMedia>] Attached media items, omitted when the tweet has no media
        #
        #   @param note_tweet [XTwitterScraper::Models::X::TweetDetail::NoteTweet] Complete Note Tweet content and rich-text metadata.
        #
        #   @param parent_tweet [XTwitterScraper::Models::EmbeddedTweet]
        #
        #   @param place [XTwitterScraper::Models::X::TweetDetail::Place] Public place metadata attached to a tweet.
        #
        #   @param possibly_sensitive [Boolean]
        #
        #   @param post_cta [Hash{Symbol=>Object}]
        #
        #   @param previous_counts [XTwitterScraper::Models::X::TweetDetail::PreviousCounts] Engagement counts retained from a prior tweet edit.
        #
        #   @param quoted_tweet [XTwitterScraper::Models::EmbeddedTweet] Quoted or retweeted tweet context. Every object includes id, text, and engagemen
        #
        #   @param quoted_tweet_id [String]
        #
        #   @param quoted_tweet_permalink [XTwitterScraper::Models::X::TweetDetail::QuotedTweetPermalink] The quoted post's link, kept when X withholds that post.
        #
        #   @param quoted_tweet_unavailable [XTwitterScraper::Models::X::TweetDetail::QuotedTweetUnavailable] Why X shows no quoted post. Omitted when X names no reason.
        #
        #   @param reaction_context [XTwitterScraper::Models::X::TweetDetail::ReactionContext] Public post & user this reaction references.
        #
        #   @param retweeted_at [Time, nil] Repost event time in UTC. Null when unavailable. Omitted for other posts.
        #
        #   @param retweeted_tweet [XTwitterScraper::Models::EmbeddedTweet] Quoted or retweeted tweet context. Every object includes id, text, and engagemen
        #
        #   @param scopes [Hash{Symbol=>Object}]
        #
        #   @param soft_intervention [XTwitterScraper::Models::X::TweetDetail::SoftIntervention] The label X shows under a post whose reach it limits. It links to the page that
        #
        #   @param source [String] Client application used to post this tweet
        #
        #   @param sports_context [XTwitterScraper::Models::X::TweetDetail::SportsContext] Game metadata attached to this post.
        #
        #   @param subscriber_badge [XTwitterScraper::Models::TweetSubscriberBadge]
        #
        #   @param text_highlights [Array<XTwitterScraper::Models::X::TweetDetail::TextHighlight>] Where `text` matches the search, on each row a search read. Offsets count code p
        #
        #   @param tombstone [XTwitterScraper::Models::TweetTombstone]
        #
        #   @param type [String] Tweet result type
        #
        #   @param unavailable_author_id [String] The author's ID when X withholds the author's profile.
        #
        #   @param unknown_counts [Array<Symbol, XTwitterScraper::Models::X::TweetDetail::UnknownCount>] The counts X did not send for this post. Each one reads 0, so treat it as unknow
        #
        #   @param unknown_fields [Array<Symbol, XTwitterScraper::Models::X::TweetDetail::UnknownField>] The fields X did not send for this post. text reads empty, so treat it as unknow
        #
        #   @param unmentioned_user_ids [Array<String>] User IDs that left this conversation.
        #
        #   @param url [String] Tweet permalink URL
        #
        #   @param view_state [String]

        # @see XTwitterScraper::Models::X::TweetDetail#article
        class Article < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute cover_media
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :cover_media,
                   XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
                   api_name: :coverMedia

          # @!attribute id
          #
          #   @return [String, nil]
          optional :id, String

          # @!attribute cover_media_url
          #
          #   @return [String, nil]
          optional :cover_media_url, String, api_name: :coverMediaUrl

          # @!attribute lifecycle_state
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :lifecycle_state,
                   XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
                   api_name: :lifecycleState

          # @!attribute metadata
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :metadata,
                   XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

          # @!attribute preview_text
          #
          #   @return [String, nil]
          optional :preview_text, String, api_name: :previewText

          # @!attribute title
          #
          #   @return [String, nil]
          optional :title, String

          # @!method initialize(cover_media: nil, id: nil, cover_media_url: nil, lifecycle_state: nil, metadata: nil, preview_text: nil, title: nil)
          #   Article metadata attached to a tweet.
          #
          #   @param cover_media [Hash{Symbol=>Object}]
          #   @param id [String]
          #   @param cover_media_url [String]
          #   @param lifecycle_state [Hash{Symbol=>Object}]
          #   @param metadata [Hash{Symbol=>Object}]
          #   @param preview_text [String]
          #   @param title [String]
        end

        # @see XTwitterScraper::Models::X::TweetDetail#card
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

          # @!attribute platform
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :platform,
                   XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

          # @!attribute url
          #
          #   @return [String, nil]
          optional :url, String

          # @!attribute user_reference_errors
          #   Unresolved card user references.
          #
          #   @return [Array<XTwitterScraper::Models::X::TweetDetail::Card::UserReferenceError>, nil]
          optional :user_reference_errors,
                   -> {
                     XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::TweetDetail::Card::UserReferenceError]
                   },
                   api_name: :userReferenceErrors

          # @!attribute user_references
          #
          #   @return [Array<XTwitterScraper::Models::UserProfile>, nil]
          optional :user_references,
                   -> {
                     XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::UserProfile]
                   },
                   api_name: :userReferences

          # @!method initialize(id: nil, binding_values: nil, name: nil, platform: nil, url: nil, user_reference_errors: nil, user_references: nil)
          #   Public card metadata attached to a tweet.
          #
          #   @param id [String]
          #   @param binding_values [Hash{Symbol=>Object}]
          #   @param name [String]
          #   @param platform [Hash{Symbol=>Object}]
          #   @param url [String]
          #   @param user_reference_errors [Array<XTwitterScraper::Models::X::TweetDetail::Card::UserReferenceError>] Unresolved card user references.
          #   @param user_references [Array<XTwitterScraper::Models::UserProfile>]

          # @see XTwitterScraper::Models::X::TweetDetail::Card#user_reference_errors
          class UserReferenceError < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute message
            #
            #   @return [String, nil]
            optional :message, String

            # @!attribute reason
            #
            #   @return [String, nil]
            optional :reason, String

            # @!method initialize(message: nil, reason: nil)
            #   @param message [String]
            #   @param reason [String]
          end
        end

        # @see XTwitterScraper::Models::X::TweetDetail#community_note
        class CommunityNote < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute footer_icon_type
          #
          #   @return [String, nil]
          optional :footer_icon_type, String, api_name: :footerIconType

          # @!attribute icon_type
          #
          #   @return [String, nil]
          optional :icon_type, String, api_name: :iconType

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

          # @!attribute metadata
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :metadata,
                   XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

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

          # @!method initialize(footer_icon_type: nil, icon_type: nil, id: nil, destination_url: nil, footer: nil, metadata: nil, short_title: nil, subtitle: nil, title: nil, visual_style: nil)
          #   Community Note presentation metadata returned by X.
          #
          #   @param footer_icon_type [String]
          #   @param icon_type [String]
          #   @param id [String]
          #   @param destination_url [String]
          #   @param footer [String]
          #   @param metadata [Hash{Symbol=>Object}]
          #   @param short_title [String]
          #   @param subtitle [String]
          #   @param title [String]
          #   @param visual_style [String]
        end

        # @see XTwitterScraper::Models::X::TweetDetail#edit
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

        # @see XTwitterScraper::Models::X::TweetDetail#note_tweet
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
          #   @return [Array<XTwitterScraper::Models::X::TweetDetail::NoteTweet::RichtextTag>, nil]
          optional :richtext_tags,
                   -> {
                     XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::TweetDetail::NoteTweet::RichtextTag]
                   },
                   api_name: :richtextTags

          # @!method initialize(text:, id: nil, entities: nil, is_expandable: nil, richtext_tags: nil)
          #   Complete Note Tweet content and rich-text metadata.
          #
          #   @param text [String]
          #   @param id [String]
          #   @param entities [Hash{Symbol=>Object}]
          #   @param is_expandable [Boolean]
          #   @param richtext_tags [Array<XTwitterScraper::Models::X::TweetDetail::NoteTweet::RichtextTag>]

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

        # @see XTwitterScraper::Models::X::TweetDetail#place
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

        # @see XTwitterScraper::Models::X::TweetDetail#previous_counts
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

        # @see XTwitterScraper::Models::X::TweetDetail#cashtag_attachments
        class CashtagAttachment < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute cashtag
          #   The cashtag with its `$`.
          #
          #   @return [String]
          required :cashtag, String

          # @!attribute candle_size
          #   Span of each candle.
          #
          #   @return [String, nil]
          optional :candle_size, String, api_name: :candleSize

          # @!attribute timeframe
          #   Span the chart covers.
          #
          #   @return [String, nil]
          optional :timeframe, String

          # @!attribute start_time
          #   Time of the chart's first candle.
          #
          #   @return [Time, nil]
          optional :start_time, Time, api_name: :startTime

          # @!attribute end_time
          #   Time of the chart's last price.
          #
          #   @return [Time, nil]
          optional :end_time, Time, api_name: :endTime

          # @!attribute size_variant
          #   X's size for the chart.
          #
          #   @return [Integer, nil]
          optional :size_variant, Integer, api_name: :sizeVariant

          # @!method initialize(cashtag:, candle_size: nil, timeframe: nil, start_time: nil, end_time: nil, size_variant: nil)
          #   @param cashtag [String] The cashtag with its `$`.
          #
          #   @param candle_size [String] Span of each candle.
          #
          #   @param timeframe [String] Span the chart covers.
          #
          #   @param start_time [Time] Time of the chart's first candle.
          #
          #   @param end_time [Time] Time of the chart's last price.
          #
          #   @param size_variant [Integer] X's size for the chart.
        end

        # @see XTwitterScraper::Models::X::TweetDetail#conversation_control
        class ConversationControl < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute allowed_country_codes
          #   Regions whose accounts may reply, as country codes. Sent with the
          #   `country_of_origin` mode.
          #
          #   @return [Array<String>, nil]
          optional :allowed_country_codes,
                   XTwitterScraper::Internal::Type::ArrayOf[String],
                   api_name: :allowedCountryCodes

          # @!attribute invite_via_mention
          #
          #   @return [Boolean, nil]
          optional :invite_via_mention, XTwitterScraper::Internal::Type::Boolean, api_name: :inviteViaMention

          # @!attribute mode
          #   Reply policy from X's newer field, such as `my_network`, `premium` or
          #   `country_of_origin`. Omitted when X sends none.
          #
          #   @return [String, nil]
          optional :mode, String

          # @!attribute owner_id
          #   The conversation owner's account ID.
          #
          #   @return [String, nil]
          optional :owner_id, String, api_name: :ownerId

          # @!attribute owner_username
          #
          #   @return [String, nil]
          optional :owner_username, String, api_name: :ownerUsername

          # @!attribute policy
          #
          #   @return [String, nil]
          optional :policy, String

          # @!method initialize(allowed_country_codes: nil, invite_via_mention: nil, mode: nil, owner_id: nil, owner_username: nil, policy: nil)
          #   Reply policy & conversation owner.
          #
          #   @param allowed_country_codes [Array<String>] Regions whose accounts may reply, as country codes. Sent with the `country_of_or
          #
          #   @param invite_via_mention [Boolean]
          #
          #   @param mode [String] Reply policy from X's newer field, such as `my_network`, `premium` or `country_o
          #
          #   @param owner_id [String] The conversation owner's account ID.
          #
          #   @param owner_username [String]
          #
          #   @param policy [String]
        end

        # @see XTwitterScraper::Models::X::TweetDetail#limited_actions
        class LimitedAction < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute action
          #
          #   @return [String, nil]
          optional :action, String

          # @!attribute prompt
          #
          #   @return [XTwitterScraper::Models::X::TweetDetail::LimitedAction::Prompt, nil]
          optional :prompt, -> { XTwitterScraper::X::TweetDetail::LimitedAction::Prompt }

          # @!method initialize(action: nil, prompt: nil)
          #   @param action [String]
          #   @param prompt [XTwitterScraper::Models::X::TweetDetail::LimitedAction::Prompt]

          # @see XTwitterScraper::Models::X::TweetDetail::LimitedAction#prompt
          class Prompt < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute cta_type
            #
            #   @return [String, nil]
            optional :cta_type, String, api_name: :ctaType

            # @!attribute headline
            #
            #   @return [String, nil]
            optional :headline, String

            # @!attribute metadata
            #
            #   @return [Hash{Symbol=>Object}, nil]
            optional :metadata,
                     XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

            # @!attribute subtext
            #
            #   @return [String, nil]
            optional :subtext, String

            # @!method initialize(cta_type: nil, headline: nil, metadata: nil, subtext: nil)
            #   @param cta_type [String]
            #   @param headline [String]
            #   @param metadata [Hash{Symbol=>Object}]
            #   @param subtext [String]
          end
        end

        # @see XTwitterScraper::Models::X::TweetDetail#live_event_context
        class LiveEventContext < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute title
          #   Event name.
          #
          #   @return [String, nil]
          optional :title, String

          # @!attribute url
          #   The event's page on X.
          #
          #   @return [String, nil]
          optional :url, String

          # @!attribute image_url
          #   The event's image.
          #
          #   @return [String, nil]
          optional :image_url, String, api_name: :imageUrl

          # @!method initialize(title: nil, url: nil, image_url: nil)
          #   The live event the post belongs to, such as an election.
          #
          #   @param title [String] Event name.
          #
          #   @param url [String] The event's page on X.
          #
          #   @param image_url [String] The event's image.
        end

        # @see XTwitterScraper::Models::X::TweetDetail#quoted_tweet_permalink
        class QuotedTweetPermalink < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute display_url
          #
          #   @return [String, nil]
          optional :display_url, String, api_name: :displayUrl

          # @!attribute expanded_url
          #
          #   @return [String, nil]
          optional :expanded_url, String, api_name: :expandedUrl

          # @!attribute url
          #
          #   @return [String, nil]
          optional :url, String

          # @!method initialize(display_url: nil, expanded_url: nil, url: nil)
          #   The quoted post's link, kept when X withholds that post.
          #
          #   @param display_url [String]
          #   @param expanded_url [String]
          #   @param url [String]
        end

        # @see XTwitterScraper::Models::X::TweetDetail#quoted_tweet_unavailable
        class QuotedTweetUnavailable < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute reason
          #   X's reason, such as `Suspended` for a suspended author or `Protected` for an
          #   author who protects their posts.
          #
          #   @return [String]
          required :reason, String

          # @!method initialize(reason:)
          #   Why X shows no quoted post. Omitted when X names no reason.
          #
          #   @param reason [String] X's reason, such as `Suspended` for a suspended author or `Protected` for an aut
        end

        # @see XTwitterScraper::Models::X::TweetDetail#reaction_context
        class ReactionContext < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute reacted_to_post
          #   The post this one reacts to, with the same fields. X often sends only its ID,
          #   author & edit history. Then unknownFields lists text, and the flags X did not
          #   send are left out.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :reacted_to_post,
                   XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
                   api_name: :reactedToPost

          # @!attribute reacted_to_post_id
          #   Referenced post ID.
          #
          #   @return [String, nil]
          optional :reacted_to_post_id, String, api_name: :reactedToPostId

          # @!attribute reacted_to_user
          #
          #   @return [XTwitterScraper::Models::UserProfile, nil]
          optional :reacted_to_user, -> { XTwitterScraper::UserProfile }, api_name: :reactedToUser

          # @!method initialize(reacted_to_post: nil, reacted_to_post_id: nil, reacted_to_user: nil)
          #   Public post & user this reaction references.
          #
          #   @param reacted_to_post [Hash{Symbol=>Object}] The post this one reacts to, with the same fields. X often sends only its ID, au
          #
          #   @param reacted_to_post_id [String] Referenced post ID.
          #
          #   @param reacted_to_user [XTwitterScraper::Models::UserProfile]
        end

        # @see XTwitterScraper::Models::X::TweetDetail#soft_intervention
        class SoftIntervention < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute display_type
          #   The label's kind. `Fosnr` marks a post X keeps up but shows to fewer people.
          #
          #   @return [String, nil]
          optional :display_type, String, api_name: :displayType

          # @!attribute engagement_nudge
          #   Whether X prompts people before they engage with the post.
          #
          #   @return [Boolean, nil]
          optional :engagement_nudge, XTwitterScraper::Internal::Type::Boolean, api_name: :engagementNudge

          # @!attribute text
          #
          #   @return [XTwitterScraper::Models::X::TweetDetail::SoftIntervention::Text, nil]
          optional :text, -> { XTwitterScraper::X::TweetDetail::SoftIntervention::Text }

          # @!attribute url
          #   The page that explains the label.
          #
          #   @return [XTwitterScraper::Models::X::TweetDetail::SoftIntervention::Url, nil]
          optional :url, -> { XTwitterScraper::X::TweetDetail::SoftIntervention::Url }

          # @!method initialize(display_type: nil, engagement_nudge: nil, text: nil, url: nil)
          #   The label X shows under a post whose reach it limits. It links to the page that
          #   explains it.
          #
          #   @param display_type [String] The label's kind. `Fosnr` marks a post X keeps up but shows to fewer people.
          #
          #   @param engagement_nudge [Boolean] Whether X prompts people before they engage with the post.
          #
          #   @param text [XTwitterScraper::Models::X::TweetDetail::SoftIntervention::Text]
          #
          #   @param url [XTwitterScraper::Models::X::TweetDetail::SoftIntervention::Url] The page that explains the label.

          # @see XTwitterScraper::Models::X::TweetDetail::SoftIntervention#text
          class Text < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute text
            #   The label's text.
            #
            #   @return [String, nil]
            optional :text, String

            # @!attribute rtl
            #   Whether the label reads right to left.
            #
            #   @return [Boolean, nil]
            optional :rtl, XTwitterScraper::Internal::Type::Boolean

            # @!attribute entities
            #   Links inside the label, by character range.
            #
            #   @return [Array<XTwitterScraper::Models::X::TweetDetail::SoftIntervention::Text::Entity>, nil]
            optional :entities,
                     -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::TweetDetail::SoftIntervention::Text::Entity] }

            # @!method initialize(text: nil, rtl: nil, entities: nil)
            #   @param text [String] The label's text.
            #
            #   @param rtl [Boolean] Whether the label reads right to left.
            #
            #   @param entities [Array<XTwitterScraper::Models::X::TweetDetail::SoftIntervention::Text::Entity>] Links inside the label, by character range.

            # @see XTwitterScraper::Models::X::TweetDetail::SoftIntervention::Text#entities
            class Entity < XTwitterScraper::Internal::Type::BaseModel
              # @!attribute from_index
              #   Whole number from 0.
              #
              #   @return [Integer, nil]
              optional :from_index, Integer, api_name: :fromIndex

              # @!attribute to_index
              #   Whole number from 0.
              #
              #   @return [Integer, nil]
              optional :to_index, Integer, api_name: :toIndex

              # @!attribute ref
              #
              #   @return [XTwitterScraper::Models::X::TweetDetail::SoftIntervention::Text::Entity::Ref, nil]
              optional :ref, -> { XTwitterScraper::X::TweetDetail::SoftIntervention::Text::Entity::Ref }

              # @!method initialize(from_index: nil, to_index: nil, ref: nil)
              #   @param from_index [Integer] Whole number from 0.
              #
              #   @param to_index [Integer] Whole number from 0.
              #
              #   @param ref [XTwitterScraper::Models::X::TweetDetail::SoftIntervention::Text::Entity::Ref]

              # @see XTwitterScraper::Models::X::TweetDetail::SoftIntervention::Text::Entity#ref
              class Ref < XTwitterScraper::Internal::Type::BaseModel
                # @!attribute type
                #
                #   @return [String, nil]
                optional :type, String

                # @!attribute url
                #
                #   @return [String, nil]
                optional :url, String

                # @!attribute url_type
                #
                #   @return [String, nil]
                optional :url_type, String, api_name: :urlType

                # @!attribute text
                #
                #   @return [String, nil]
                optional :text, String

                # @!attribute screen_name
                #
                #   @return [String, nil]
                optional :screen_name, String, api_name: :screenName

                # @!method initialize(type: nil, url: nil, url_type: nil, text: nil, screen_name: nil)
                #   @param type [String]
                #   @param url [String]
                #   @param url_type [String]
                #   @param text [String]
                #   @param screen_name [String]
              end
            end
          end

          # @see XTwitterScraper::Models::X::TweetDetail::SoftIntervention#url
          class Url < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute url
            #
            #   @return [String, nil]
            optional :url, String

            # @!attribute url_type
            #
            #   @return [String, nil]
            optional :url_type, String, api_name: :urlType

            # @!method initialize(url: nil, url_type: nil)
            #   The page that explains the label.
            #
            #   @param url [String]
            #   @param url_type [String]
          end
        end

        # @see XTwitterScraper::Models::X::TweetDetail#sports_context
        class SportsContext < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute game_id
          #   Game ID.
          #
          #   @return [String, nil]
          optional :game_id, String, api_name: :gameId

          # @!attribute league
          #   League ID.
          #
          #   @return [String, nil]
          optional :league, String

          # @!attribute title
          #   Game title.
          #
          #   @return [String, nil]
          optional :title, String

          # @!attribute url
          #   Game link.
          #
          #   @return [String, nil]
          optional :url, String

          # @!attribute state
          #   Reported game state.
          #
          #   @return [String, nil]
          optional :state, String

          # @!attribute status_text
          #   Game progress text.
          #
          #   @return [String, nil]
          optional :status_text, String, api_name: :statusText

          # @!attribute scheduled_at_ms
          #   Scheduled Unix milliseconds, retaining the source type.
          #
          #   @return [Object, nil]
          optional :scheduled_at_ms, XTwitterScraper::Internal::Type::Unknown, api_name: :scheduledAtMs

          # @!attribute competitors
          #   Teams & reported scores.
          #
          #   @return [Array<XTwitterScraper::Models::X::TweetDetail::SportsContext::Competitor>, nil]
          optional :competitors,
                   -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::TweetDetail::SportsContext::Competitor] }

          # @!method initialize(game_id: nil, league: nil, title: nil, url: nil, state: nil, status_text: nil, scheduled_at_ms: nil, competitors: nil)
          #   Game metadata attached to this post.
          #
          #   @param game_id [String] Game ID.
          #
          #   @param league [String] League ID.
          #
          #   @param title [String] Game title.
          #
          #   @param url [String] Game link.
          #
          #   @param state [String] Reported game state.
          #
          #   @param status_text [String] Game progress text.
          #
          #   @param scheduled_at_ms [Object] Scheduled Unix milliseconds, retaining the source type.
          #
          #   @param competitors [Array<XTwitterScraper::Models::X::TweetDetail::SportsContext::Competitor>] Teams & reported scores.

          # @see XTwitterScraper::Models::X::TweetDetail::SportsContext#competitors
          class Competitor < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute team_id
            #   Team ID.
            #
            #   @return [String, nil]
            optional :team_id, String, api_name: :teamId

            # @!attribute color
            #   Team display color.
            #
            #   @return [String, nil]
            optional :color, String

            # @!attribute is_active
            #   Active competitor.
            #
            #   @return [Boolean, nil]
            optional :is_active, XTwitterScraper::Internal::Type::Boolean, api_name: :isActive

            # @!attribute is_winner
            #   Winning competitor.
            #
            #   @return [Boolean, nil]
            optional :is_winner, XTwitterScraper::Internal::Type::Boolean, api_name: :isWinner

            # @!attribute abbreviation
            #   Team abbreviation.
            #
            #   @return [String, nil]
            optional :abbreviation, String

            # @!attribute name
            #   Team name.
            #
            #   @return [String, nil]
            optional :name, String

            # @!attribute score
            #   Score display text.
            #
            #   @return [String, nil]
            optional :score, String

            # @!attribute logo_url
            #   Logo for light backgrounds.
            #
            #   @return [String, nil]
            optional :logo_url, String, api_name: :logoUrl

            # @!attribute dark_logo_url
            #   Logo for dark backgrounds.
            #
            #   @return [String, nil]
            optional :dark_logo_url, String, api_name: :darkLogoUrl

            # @!method initialize(team_id: nil, color: nil, is_active: nil, is_winner: nil, abbreviation: nil, name: nil, score: nil, logo_url: nil, dark_logo_url: nil)
            #   @param team_id [String] Team ID.
            #
            #   @param color [String] Team display color.
            #
            #   @param is_active [Boolean] Active competitor.
            #
            #   @param is_winner [Boolean] Winning competitor.
            #
            #   @param abbreviation [String] Team abbreviation.
            #
            #   @param name [String] Team name.
            #
            #   @param score [String] Score display text.
            #
            #   @param logo_url [String] Logo for light backgrounds.
            #
            #   @param dark_logo_url [String] Logo for dark backgrounds.
          end
        end

        # @see XTwitterScraper::Models::X::TweetDetail#text_highlights
        class TextHighlight < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute start_index
          #   The first code point of the match.
          #
          #   @return [Integer]
          required :start_index, Integer, api_name: :startIndex

          # @!attribute end_index
          #   The first code point after the match.
          #
          #   @return [Integer]
          required :end_index, Integer, api_name: :endIndex

          # @!method initialize(start_index:, end_index:)
          #   @param start_index [Integer] The first code point of the match.
          #
          #   @param end_index [Integer] The first code point after the match.
        end

        # @see XTwitterScraper::Models::X::TweetDetail#unknown_counts
        module UnknownCount
          extend XTwitterScraper::Internal::Type::Enum

          RETWEET_COUNT = :retweetCount
          REPLY_COUNT = :replyCount
          LIKE_COUNT = :likeCount
          QUOTE_COUNT = :quoteCount
          VIEW_COUNT = :viewCount
          BOOKMARK_COUNT = :bookmarkCount

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see XTwitterScraper::Models::X::TweetDetail#unknown_fields
        module UnknownField
          extend XTwitterScraper::Internal::Type::Enum

          TEXT = :text

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
