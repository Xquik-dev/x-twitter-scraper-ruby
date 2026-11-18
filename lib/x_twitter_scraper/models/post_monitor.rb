# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PostMonitor < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Customer-set label of the post monitor, when set.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute post_id
      #   ID of the post you gave.
      #
      #   @return [String]
      required :post_id, String, api_name: :postId

      # @!attribute post_url
      #
      #   @return [String]
      required :post_url, String, api_name: :postUrl

      # @!attribute author_id
      #   Permanent X user ID of the post's author.
      #
      #   @return [String]
      required :author_id, String, api_name: :authorId

      # @!attribute author_username
      #
      #   @return [String]
      required :author_username, String, api_name: :authorUsername

      # @!attribute author_name
      #
      #   @return [String]
      required :author_name, String, api_name: :authorName

      # @!attribute author_avatar_url
      #   The author's profile picture. Omitted when X shows none.
      #
      #   @return [String, nil]
      optional :author_avatar_url, String, api_name: :authorAvatarUrl

      # @!attribute author_verified
      #   The author's verified badge on X. Omitted when the author has none.
      #
      #   @return [Symbol, XTwitterScraper::Models::PostMonitor::AuthorVerified, nil]
      optional :author_verified, enum: -> { XTwitterScraper::Models::PostMonitor::AuthorVerified }, api_name: :authorVerified

      # @!attribute author_affiliate
      #   The organization badge X shows beside the author's name. Omitted when X shows
      #   none.
      #
      #   @return [XTwitterScraper::Models::PostMonitor::AuthorAffiliate, nil]
      optional :author_affiliate, -> { XTwitterScraper::Models::PostMonitor::AuthorAffiliate }, api_name: :authorAffiliate

      # @!attribute media
      #   Photos, videos & GIFs on the post, in X's order.
      #
      #   @return [Array<XTwitterScraper::Models::PostMonitor::Media>]
      required :media, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::PostMonitor::Media] }

      # @!attribute text
      #   Text of the newest version Xquik read.
      #
      #   @return [String]
      required :text, String

      # @!attribute posted_at
      #
      #   @return [Time]
      required :posted_at, Time, api_name: :postedAt

      # @!attribute event_types
      #   Post event types to send. Without it, a monitor sends new replies, new quotes,
      #   like & retweet changes, edits & deletion.
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::PostEventType>]
      required :event_types, -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::PostEventType] }, api_name: :eventTypes

      # @!attribute is_active
      #
      #   @return [Boolean]
      required :is_active, XTwitterScraper::Internal::Type::Boolean, api_name: :isActive

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute next_billing_at
      #   Next hourly credit charge time for this post monitor.
      #
      #   @return [Time]
      required :next_billing_at, Time, api_name: :nextBillingAt

      # @!attribute baseline
      #   Counts Xquik read when tracking began. Each metric's gain counts from here.
      #   views is null when X showed no view count.
      #
      #   @return [XTwitterScraper::Models::PostMonitor::Baseline]
      required :baseline, -> { XTwitterScraper::Models::PostMonitor::Baseline }

      # @!attribute paused_reason
      #   Why Xquik paused this post monitor. insufficient_credits means the balance could
      #   not pay an hour, so add credits & resume. The other 3 mean X stopped showing the
      #   post. Absent when the monitor is active or you paused it yourself.
      #
      #   @return [Symbol, XTwitterScraper::Models::PostMonitor::PausedReason, nil]
      optional :paused_reason, enum: -> { XTwitterScraper::Models::PostMonitor::PausedReason }, api_name: :pausedReason

      # @!attribute paused_at
      #   When Xquik paused this post monitor.
      #
      #   @return [Time, nil]
      optional :paused_at, Time, api_name: :pausedAt

      # @!attribute metrics
      #   The 6 metrics of a post.
      #
      #   @return [XTwitterScraper::Models::PostMetrics]
      required :metrics, -> { XTwitterScraper::Models::PostMetrics }

      # @!method initialize(id:, post_id:, post_url:, author_id:, author_username:, author_name:, media:, text:, posted_at:, event_types:, is_active:, created_at:, next_billing_at:, baseline:, metrics:, name: nil, author_avatar_url: nil, author_verified: nil, author_affiliate: nil, paused_reason: nil, paused_at: nil)
      #   Post monitor that tracks 1 X post's replies, quotes, edits & metrics.
      #
      #   @param id [String]
      #
      #   @param post_id [String] ID of the post you gave.
      #
      #   @param post_url [String]
      #
      #   @param author_id [String] Permanent X user ID of the post's author.
      #
      #   @param author_username [String]
      #
      #   @param author_name [String]
      #
      #   @param media [Array<XTwitterScraper::Models::PostMonitor::Media>] Photos, videos & GIFs on the post, in X's order.
      #
      #   @param text [String] Text of the newest version Xquik read.
      #
      #   @param posted_at [Time]
      #
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::PostEventType>] Post event types to send. Without it, a monitor sends new replies, new quotes, like & retweet changes, edits & deletion.
      #
      #   @param is_active [Boolean]
      #
      #   @param created_at [Time]
      #
      #   @param next_billing_at [Time] Next hourly credit charge time for this post monitor.
      #
      #   @param baseline [XTwitterScraper::Models::PostMonitor::Baseline] Counts Xquik read when tracking began. Each metric's gain counts from here. views is null when X showed no view count.
      #
      #   @param metrics [XTwitterScraper::Models::PostMetrics] The 6 metrics of a post.
      #
      #   @param name [String] Customer-set label of the post monitor, when set.
      #
      #   @param author_avatar_url [String] The author's profile picture. Omitted when X shows none.
      #
      #   @param author_verified [Symbol, XTwitterScraper::Models::PostMonitor::AuthorVerified] The author's verified badge on X. Omitted when the author has none.
      #
      #   @param author_affiliate [XTwitterScraper::Models::PostMonitor::AuthorAffiliate] The organization badge X shows beside the author's name. Omitted when X shows none.
      #
      #   @param paused_reason [Symbol, XTwitterScraper::Models::PostMonitor::PausedReason] Why Xquik paused this post monitor. insufficient_credits means the balance could not pay an hour, so add credits & resume. The other 3 mean X stopped showing the post. Absent when the monitor is active or you paused it yourself.
      #
      #   @param paused_at [Time] When Xquik paused this post monitor.

      # The author's verified badge on X. Omitted when the author has none.
      module AuthorVerified
        extend XTwitterScraper::Internal::Type::Enum

        BLUE = :blue
        BUSINESS = :business
        GOVERNMENT = :government

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class AuthorAffiliate < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute badge_url
        #   The organization's badge image.
        #
        #   @return [String]
        required :badge_url, String, api_name: :badgeUrl

        # @!attribute description
        #   The organization's name, as X shows it.
        #
        #   @return [String]
        required :description, String

        # @!attribute url
        #   The organization's X profile, when X links one.
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(badge_url:, description:, url: nil)
        #   The organization badge X shows beside the author's name. Omitted when X shows
        #   none.
        #
        #   @param badge_url [String] The organization's badge image.
        #
        #   @param description [String] The organization's name, as X shows it.
        #
        #   @param url [String] The organization's X profile, when X links one.
      end

      class Media < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute kind
        #
        #   @return [Symbol, XTwitterScraper::Models::PostMonitor::Media::Kind]
        required :kind, enum: -> { XTwitterScraper::Models::PostMonitor::Media::Kind }

        # @!attribute url
        #   The image URL. For a video or GIF, its preview image.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(kind:, url:)
        #   @param kind [Symbol, XTwitterScraper::Models::PostMonitor::Media::Kind]
        #
        #   @param url [String] The image URL. For a video or GIF, its preview image.

        module Kind
          extend XTwitterScraper::Internal::Type::Enum

          GIF = :gif
          PHOTO = :photo
          VIDEO = :video

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Baseline < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute at
        #   When Xquik read these counts from X.
        #
        #   @return [Time]
        required :at, Time

        # @!attribute views
        #
        #   @return [Integer, nil]
        required :views, Integer, nil?: true

        # @!attribute likes
        #
        #   @return [Integer]
        required :likes, Integer

        # @!attribute retweets
        #
        #   @return [Integer]
        required :retweets, Integer

        # @!attribute replies
        #
        #   @return [Integer]
        required :replies, Integer

        # @!attribute quotes
        #
        #   @return [Integer]
        required :quotes, Integer

        # @!attribute bookmarks
        #
        #   @return [Integer]
        required :bookmarks, Integer

        # @!method initialize(at:, views:, likes:, retweets:, replies:, quotes:, bookmarks:)
        #   Counts Xquik read when tracking began. Each metric's gain counts from here.
        #   views is null when X showed no view count.
        #
        #   @param at [Time] When Xquik read these counts from X.
        #
        #   @param views [Integer, nil]
        #
        #   @param likes [Integer]
        #
        #   @param retweets [Integer]
        #
        #   @param replies [Integer]
        #
        #   @param quotes [Integer]
        #
        #   @param bookmarks [Integer]
      end

      # Why Xquik paused this post monitor. insufficient_credits means the balance could
      # not pay an hour, so add credits & resume. The other 3 mean X stopped showing the
      # post. Absent when the monitor is active or you paused it yourself.
      module PausedReason
        extend XTwitterScraper::Internal::Type::Enum

        INSUFFICIENT_CREDITS = :insufficient_credits
        X_POST_DELETED = :x_post_deleted
        X_POST_PROTECTED = :x_post_protected
        X_POST_UNAVAILABLE = :x_post_unavailable

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
