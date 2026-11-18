# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class PostMonitor < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::PostMonitor,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Customer-set label of the post monitor, when set.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # ID of the post you gave.
      sig { returns(String) }
      attr_accessor :post_id

      sig { returns(String) }
      attr_accessor :post_url

      # Permanent X user ID of the post's author.
      sig { returns(String) }
      attr_accessor :author_id

      sig { returns(String) }
      attr_accessor :author_username

      sig { returns(String) }
      attr_accessor :author_name

      # The author's profile picture. Omitted when X shows none.
      sig { returns(T.nilable(String)) }
      attr_reader :author_avatar_url

      sig { params(author_avatar_url: String).void }
      attr_writer :author_avatar_url

      # The author's verified badge on X. Omitted when the author has none.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::PostMonitor::AuthorVerified::TaggedSymbol
          )
        )
      end
      attr_reader :author_verified

      sig do
        params(
          author_verified:
            XTwitterScraper::Models::PostMonitor::AuthorVerified::OrSymbol
        ).void
      end
      attr_writer :author_verified

      # The organization badge X shows beside the author's name. Omitted when X shows
      # none.
      sig do
        returns(
          T.nilable(XTwitterScraper::Models::PostMonitor::AuthorAffiliate)
        )
      end
      attr_reader :author_affiliate

      sig do
        params(
          author_affiliate:
            XTwitterScraper::Models::PostMonitor::AuthorAffiliate::OrHash
        ).void
      end
      attr_writer :author_affiliate

      # Photos, videos & GIFs on the post, in X's order.
      sig { returns(T::Array[XTwitterScraper::Models::PostMonitor::Media]) }
      attr_reader :media

      sig do
        params(
          media: T::Array[XTwitterScraper::Models::PostMonitor::Media::OrHash]
        ).void
      end
      attr_writer :media

      # Text of the newest version Xquik read.
      sig { returns(String) }
      attr_accessor :text

      sig { returns(Time) }
      attr_accessor :posted_at

      # Post event types to send. Without it, a monitor sends new replies, new quotes,
      # like & retweet changes, edits & deletion.
      sig do
        returns(T::Array[XTwitterScraper::Models::PostEventType::TaggedSymbol])
      end
      attr_reader :event_types

      sig do
        params(
          event_types:
            T::Array[XTwitterScraper::Models::PostEventType::OrSymbol]
        ).void
      end
      attr_writer :event_types

      sig { returns(T::Boolean) }
      attr_accessor :is_active

      sig { returns(Time) }
      attr_accessor :created_at

      # Next hourly credit charge time for this post monitor.
      sig { returns(Time) }
      attr_accessor :next_billing_at

      # Counts Xquik read when tracking began. Each metric's gain counts from here.
      # views is null when X showed no view count.
      sig { returns(XTwitterScraper::Models::PostMonitor::Baseline) }
      attr_reader :baseline

      sig do
        params(
          baseline: XTwitterScraper::Models::PostMonitor::Baseline::OrHash
        ).void
      end
      attr_writer :baseline

      # Why Xquik paused this post monitor. insufficient_credits means the balance could
      # not pay an hour, so add credits & resume. The other 3 mean X stopped showing the
      # post. Absent when the monitor is active or you paused it yourself.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::PostMonitor::PausedReason::TaggedSymbol
          )
        )
      end
      attr_reader :paused_reason

      sig do
        params(
          paused_reason:
            XTwitterScraper::Models::PostMonitor::PausedReason::OrSymbol
        ).void
      end
      attr_writer :paused_reason

      # When Xquik paused this post monitor.
      sig { returns(T.nilable(Time)) }
      attr_reader :paused_at

      sig { params(paused_at: Time).void }
      attr_writer :paused_at

      # The 6 metrics of a post.
      sig { returns(XTwitterScraper::Models::PostMetrics) }
      attr_reader :metrics

      sig { params(metrics: XTwitterScraper::Models::PostMetrics::OrHash).void }
      attr_writer :metrics

      sig do
        params(
          id: String,
          post_id: String,
          post_url: String,
          author_id: String,
          author_username: String,
          author_name: String,
          media: T::Array[XTwitterScraper::Models::PostMonitor::Media::OrHash],
          text: String,
          posted_at: Time,
          event_types:
            T::Array[XTwitterScraper::Models::PostEventType::OrSymbol],
          is_active: T::Boolean,
          created_at: Time,
          next_billing_at: Time,
          baseline: XTwitterScraper::Models::PostMonitor::Baseline::OrHash,
          metrics: XTwitterScraper::Models::PostMetrics::OrHash,
          name: String,
          author_avatar_url: String,
          author_verified:
            XTwitterScraper::Models::PostMonitor::AuthorVerified::OrSymbol,
          author_affiliate:
            XTwitterScraper::Models::PostMonitor::AuthorAffiliate::OrHash,
          paused_reason:
            XTwitterScraper::Models::PostMonitor::PausedReason::OrSymbol,
          paused_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # ID of the post you gave.
        post_id:,
        post_url:,
        # Permanent X user ID of the post's author.
        author_id:,
        author_username:,
        author_name:,
        # Photos, videos & GIFs on the post, in X's order.
        media:,
        # Text of the newest version Xquik read.
        text:,
        posted_at:,
        # Post event types to send. Without it, a monitor sends new replies, new quotes,
        # like & retweet changes, edits & deletion.
        event_types:,
        is_active:,
        created_at:,
        # Next hourly credit charge time for this post monitor.
        next_billing_at:,
        # Counts Xquik read when tracking began. Each metric's gain counts from here.
        # views is null when X showed no view count.
        baseline:,
        # The 6 metrics of a post.
        metrics:,
        # Customer-set label of the post monitor, when set.
        name: nil,
        # The author's profile picture. Omitted when X shows none.
        author_avatar_url: nil,
        # The author's verified badge on X. Omitted when the author has none.
        author_verified: nil,
        # The organization badge X shows beside the author's name. Omitted when X shows
        # none.
        author_affiliate: nil,
        # Why Xquik paused this post monitor. insufficient_credits means the balance could
        # not pay an hour, so add credits & resume. The other 3 mean X stopped showing the
        # post. Absent when the monitor is active or you paused it yourself.
        paused_reason: nil,
        # When Xquik paused this post monitor.
        paused_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            post_id: String,
            post_url: String,
            author_id: String,
            author_username: String,
            author_name: String,
            author_avatar_url: String,
            author_verified:
              XTwitterScraper::Models::PostMonitor::AuthorVerified::TaggedSymbol,
            author_affiliate:
              XTwitterScraper::Models::PostMonitor::AuthorAffiliate,
            media: T::Array[XTwitterScraper::Models::PostMonitor::Media],
            text: String,
            posted_at: Time,
            event_types:
              T::Array[XTwitterScraper::Models::PostEventType::TaggedSymbol],
            is_active: T::Boolean,
            created_at: Time,
            next_billing_at: Time,
            baseline: XTwitterScraper::Models::PostMonitor::Baseline,
            paused_reason:
              XTwitterScraper::Models::PostMonitor::PausedReason::TaggedSymbol,
            paused_at: Time,
            metrics: XTwitterScraper::Models::PostMetrics
          }
        )
      end
      def to_hash
      end

      # The author's verified badge on X. Omitted when the author has none.
      module AuthorVerified
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::PostMonitor::AuthorVerified)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BLUE =
          T.let(
            :blue,
            XTwitterScraper::Models::PostMonitor::AuthorVerified::TaggedSymbol
          )
        BUSINESS =
          T.let(
            :business,
            XTwitterScraper::Models::PostMonitor::AuthorVerified::TaggedSymbol
          )
        GOVERNMENT =
          T.let(
            :government,
            XTwitterScraper::Models::PostMonitor::AuthorVerified::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::PostMonitor::AuthorVerified::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class AuthorAffiliate < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::PostMonitor::AuthorAffiliate,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The organization's badge image.
        sig { returns(String) }
        attr_accessor :badge_url

        # The organization's name, as X shows it.
        sig { returns(String) }
        attr_accessor :description

        # The organization's X profile, when X links one.
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        sig do
          params(badge_url: String, description: String, url: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # The organization's badge image.
          badge_url:,
          # The organization's name, as X shows it.
          description:,
          # The organization's X profile, when X links one.
          url: nil
        )
        end

        sig do
          override.returns(
            { badge_url: String, description: String, url: String }
          )
        end
        def to_hash
        end
      end

      class Media < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::PostMonitor::Media,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            XTwitterScraper::Models::PostMonitor::Media::Kind::TaggedSymbol
          )
        end
        attr_reader :kind

        sig do
          params(
            kind: XTwitterScraper::Models::PostMonitor::Media::Kind::OrSymbol
          ).void
        end
        attr_writer :kind

        # The image URL. For a video or GIF, its preview image.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            kind: XTwitterScraper::Models::PostMonitor::Media::Kind::OrSymbol,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          kind:,
          # The image URL. For a video or GIF, its preview image.
          url:
        )
        end

        sig do
          override.returns(
            {
              kind:
                XTwitterScraper::Models::PostMonitor::Media::Kind::TaggedSymbol,
              url: String
            }
          )
        end
        def to_hash
        end

        module Kind
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, XTwitterScraper::Models::PostMonitor::Media::Kind)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          GIF =
            T.let(
              :gif,
              XTwitterScraper::Models::PostMonitor::Media::Kind::TaggedSymbol
            )
          PHOTO =
            T.let(
              :photo,
              XTwitterScraper::Models::PostMonitor::Media::Kind::TaggedSymbol
            )
          VIDEO =
            T.let(
              :video,
              XTwitterScraper::Models::PostMonitor::Media::Kind::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::PostMonitor::Media::Kind::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Baseline < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::PostMonitor::Baseline,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # When Xquik read these counts from X.
        sig { returns(Time) }
        attr_accessor :at

        sig { returns(T.nilable(Integer)) }
        attr_accessor :views

        sig { returns(Integer) }
        attr_accessor :likes

        sig { returns(Integer) }
        attr_accessor :retweets

        sig { returns(Integer) }
        attr_accessor :replies

        sig { returns(Integer) }
        attr_accessor :quotes

        sig { returns(Integer) }
        attr_accessor :bookmarks

        sig do
          params(
            at: Time,
            views: T.nilable(Integer),
            likes: Integer,
            retweets: Integer,
            replies: Integer,
            quotes: Integer,
            bookmarks: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # When Xquik read these counts from X.
          at:,
          views:,
          likes:,
          retweets:,
          replies:,
          quotes:,
          bookmarks:
        )
        end

        sig do
          override.returns(
            {
              at: Time,
              views: T.nilable(Integer),
              likes: Integer,
              retweets: Integer,
              replies: Integer,
              quotes: Integer,
              bookmarks: Integer
            }
          )
        end
        def to_hash
        end
      end

      # Why Xquik paused this post monitor. insufficient_credits means the balance could
      # not pay an hour, so add credits & resume. The other 3 mean X stopped showing the
      # post. Absent when the monitor is active or you paused it yourself.
      module PausedReason
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::PostMonitor::PausedReason)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INSUFFICIENT_CREDITS =
          T.let(
            :insufficient_credits,
            XTwitterScraper::Models::PostMonitor::PausedReason::TaggedSymbol
          )
        X_POST_DELETED =
          T.let(
            :x_post_deleted,
            XTwitterScraper::Models::PostMonitor::PausedReason::TaggedSymbol
          )
        X_POST_PROTECTED =
          T.let(
            :x_post_protected,
            XTwitterScraper::Models::PostMonitor::PausedReason::TaggedSymbol
          )
        X_POST_UNAVAILABLE =
          T.let(
            :x_post_unavailable,
            XTwitterScraper::Models::PostMonitor::PausedReason::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::PostMonitor::PausedReason::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
