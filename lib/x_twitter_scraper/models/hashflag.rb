# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class Hashflag < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute hashtag
      #   Hashtag text without the hash sign. X also lists some plain phrases.
      #
      #   @return [String]
      required :hashtag, String

      # @!attribute asset_url
      #   Image of the emoji.
      #
      #   @return [String]
      required :asset_url, String, api_name: :assetUrl

      # @!attribute starts_at
      #   When X starts showing the emoji, in UTC.
      #
      #   @return [Time]
      required :starts_at, Time, api_name: :startsAt

      # @!attribute ends_at
      #   When X stops showing the emoji, in UTC.
      #
      #   @return [Time]
      required :ends_at, Time, api_name: :endsAt

      # @!attribute is_hashfetti_enabled
      #   Whether X marks the hashflag for its hashfetti effect.
      #
      #   @return [Boolean]
      required :is_hashfetti_enabled, XTwitterScraper::Internal::Type::Boolean, api_name: :isHashfettiEnabled

      # @!attribute animations
      #   Animations X plays for the hashtag, such as on a like. Often empty.
      #
      #   @return [Array<XTwitterScraper::Models::Hashflag::Animation>]
      required :animations, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Hashflag::Animation] }

      # @!method initialize(hashtag:, asset_url:, starts_at:, ends_at:, is_hashfetti_enabled:, animations:)
      #   A custom emoji X shows after a hashtag for a set time.
      #
      #   @param hashtag [String] Hashtag text without the hash sign. X also lists some plain phrases.
      #
      #   @param asset_url [String] Image of the emoji.
      #
      #   @param starts_at [Time] When X starts showing the emoji, in UTC.
      #
      #   @param ends_at [Time] When X stops showing the emoji, in UTC.
      #
      #   @param is_hashfetti_enabled [Boolean] Whether X marks the hashflag for its hashfetti effect.
      #
      #   @param animations [Array<XTwitterScraper::Models::Hashflag::Animation>] Animations X plays for the hashtag, such as on a like. Often empty.

      class Animation < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute context
        #   What plays the animation, such as Like.
        #
        #   @return [String, nil]
        required :context, String, nil?: true

        # @!attribute asset_url
        #   Animation file.
        #
        #   @return [String]
        required :asset_url, String, api_name: :assetUrl

        # @!attribute priority
        #   X's order among the animations of a hashtag.
        #
        #   @return [Float, nil]
        required :priority, Float, nil?: true

        # @!method initialize(context:, asset_url:, priority:)
        #   @param context [String, nil] What plays the animation, such as Like.
        #
        #   @param asset_url [String] Animation file.
        #
        #   @param priority [Float, nil] X's order among the animations of a hashtag.
      end
    end
  end
end
