# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class Hashflag < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::Hashflag,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Hashtag text without the hash sign. X also lists some plain phrases.
      sig { returns(String) }
      attr_accessor :hashtag

      # Image of the emoji.
      sig { returns(String) }
      attr_accessor :asset_url

      # When X starts showing the emoji, in UTC.
      sig { returns(Time) }
      attr_accessor :starts_at

      # When X stops showing the emoji, in UTC.
      sig { returns(Time) }
      attr_accessor :ends_at

      # Whether X marks the hashflag for its hashfetti effect.
      sig { returns(T::Boolean) }
      attr_accessor :is_hashfetti_enabled

      # Animations X plays for the hashtag, such as on a like. Often empty.
      sig { returns(T::Array[XTwitterScraper::Models::Hashflag::Animation]) }
      attr_reader :animations

      sig do
        params(
          animations:
            T::Array[XTwitterScraper::Models::Hashflag::Animation::OrHash]
        ).void
      end
      attr_writer :animations

      sig do
        params(
          hashtag: String,
          asset_url: String,
          starts_at: Time,
          ends_at: Time,
          is_hashfetti_enabled: T::Boolean,
          animations:
            T::Array[XTwitterScraper::Models::Hashflag::Animation::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Hashtag text without the hash sign. X also lists some plain phrases.
        hashtag:,
        # Image of the emoji.
        asset_url:,
        # When X starts showing the emoji, in UTC.
        starts_at:,
        # When X stops showing the emoji, in UTC.
        ends_at:,
        # Whether X marks the hashflag for its hashfetti effect.
        is_hashfetti_enabled:,
        # Animations X plays for the hashtag, such as on a like. Often empty.
        animations:
      )
      end

      sig do
        override.returns(
          {
            hashtag: String,
            asset_url: String,
            starts_at: Time,
            ends_at: Time,
            is_hashfetti_enabled: T::Boolean,
            animations: T::Array[XTwitterScraper::Models::Hashflag::Animation]
          }
        )
      end
      def to_hash
      end

      class Animation < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Hashflag::Animation,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # What plays the animation, such as Like.
        sig { returns(T.nilable(String)) }
        attr_accessor :context

        # Animation file.
        sig { returns(String) }
        attr_accessor :asset_url

        # X's order among the animations of a hashtag.
        sig { returns(T.nilable(Float)) }
        attr_accessor :priority

        sig do
          params(
            context: T.nilable(String),
            asset_url: String,
            priority: T.nilable(Float)
          ).returns(T.attached_class)
        end
        def self.new(
          # What plays the animation, such as Like.
          context:,
          # Animation file.
          asset_url:,
          # X's order among the animations of a hashtag.
          priority:
        )
        end

        sig do
          override.returns(
            {
              context: T.nilable(String),
              asset_url: String,
              priority: T.nilable(Float)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
