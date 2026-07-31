# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class UserProfile < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute username
      #
      #   @return [String]
      required :username, String

      # @!attribute affiliates_highlighted_label
      #   Organization affiliation label shown on an X profile.
      #
      #   @return [XTwitterScraper::Models::UserProfile::AffiliatesHighlightedLabel, nil]
      optional :affiliates_highlighted_label,
               -> { XTwitterScraper::UserProfile::AffiliatesHighlightedLabel },
               api_name: :affiliatesHighlightedLabel

      # @!attribute automated_by
      #
      #   @return [String, nil]
      optional :automated_by, String, api_name: :automatedBy

      # @!attribute business_account_affiliates_count
      #
      #   @return [Integer, nil]
      optional :business_account_affiliates_count, Integer, api_name: :businessAccountAffiliatesCount

      # @!attribute community_role
      #   Community role when returned by community member reads
      #
      #   @return [String, nil]
      optional :community_role, String, api_name: :communityRole

      # @!attribute cover_picture
      #
      #   @return [String, nil]
      optional :cover_picture, String, api_name: :coverPicture

      # @!attribute created_at
      #
      #   @return [String, nil]
      optional :created_at, String, api_name: :createdAt

      # @!attribute creator_subscriptions_count
      #
      #   @return [Integer, nil]
      optional :creator_subscriptions_count, Integer, api_name: :creatorSubscriptionsCount

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute favourites_count
      #
      #   @return [Integer, nil]
      optional :favourites_count, Integer, api_name: :favouritesCount

      # @!attribute followers
      #
      #   @return [Integer, nil]
      optional :followers, Integer

      # @!attribute following
      #
      #   @return [Integer, nil]
      optional :following, Integer

      # @!attribute has_custom_timelines
      #
      #   @return [Boolean, nil]
      optional :has_custom_timelines, XTwitterScraper::Internal::Type::Boolean, api_name: :hasCustomTimelines

      # @!attribute has_graduated_access
      #
      #   @return [Boolean, nil]
      optional :has_graduated_access, XTwitterScraper::Internal::Type::Boolean, api_name: :hasGraduatedAccess

      # @!attribute has_hidden_subscriptions_on_profile
      #
      #   @return [Boolean, nil]
      optional :has_hidden_subscriptions_on_profile,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :hasHiddenSubscriptionsOnProfile

      # @!attribute highlights_info
      #   Profile highlight availability and count metadata.
      #
      #   @return [XTwitterScraper::Models::UserProfile::HighlightsInfo, nil]
      optional :highlights_info,
               -> {
                 XTwitterScraper::UserProfile::HighlightsInfo
               },
               api_name: :highlightsInfo

      # @!attribute identity_verification
      #   Identity verification metadata displayed by X.
      #
      #   @return [XTwitterScraper::Models::UserProfile::IdentityVerification, nil]
      optional :identity_verification,
               -> { XTwitterScraper::UserProfile::IdentityVerification },
               api_name: :identityVerification

      # @!attribute is_automated
      #
      #   @return [Boolean, nil]
      optional :is_automated, XTwitterScraper::Internal::Type::Boolean, api_name: :isAutomated

      # @!attribute is_blue_verified
      #   Whether X shows a blue verification badge
      #
      #   @return [Boolean, nil]
      optional :is_blue_verified, XTwitterScraper::Internal::Type::Boolean, api_name: :isBlueVerified

      # @!attribute is_profile_translatable
      #
      #   @return [Boolean, nil]
      optional :is_profile_translatable,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :isProfileTranslatable

      # @!attribute is_translator
      #
      #   @return [Boolean, nil]
      optional :is_translator, XTwitterScraper::Internal::Type::Boolean, api_name: :isTranslator

      # @!attribute is_verified
      #   Whether X marks the profile as verified
      #
      #   @return [Boolean, nil]
      optional :is_verified, XTwitterScraper::Internal::Type::Boolean, api_name: :isVerified

      # @!attribute location
      #
      #   @return [String, nil]
      optional :location, String

      # @!attribute media_count
      #
      #   @return [Integer, nil]
      optional :media_count, Integer, api_name: :mediaCount

      # @!attribute parody_commentary_fan_label
      #
      #   @return [String, nil]
      optional :parody_commentary_fan_label, String, api_name: :parodyCommentaryFanLabel

      # @!attribute pinned_tweet_ids
      #
      #   @return [Array<String>, nil]
      optional :pinned_tweet_ids, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :pinnedTweetIds

      # @!attribute possibly_sensitive
      #
      #   @return [Boolean, nil]
      optional :possibly_sensitive, XTwitterScraper::Internal::Type::Boolean, api_name: :possiblySensitive

      # @!attribute profile_bio
      #   Structured profile bio with entity annotations
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :profile_bio, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

      # @!attribute profile_banner_url
      #   Original X profile banner field when available
      #
      #   @return [String, nil]
      optional :profile_banner_url, String, api_name: :profileBannerUrl

      # @!attribute profile_description_language
      #
      #   @return [String, nil]
      optional :profile_description_language, String, api_name: :profileDescriptionLanguage

      # @!attribute profile_image_shape
      #
      #   @return [String, nil]
      optional :profile_image_shape, String, api_name: :profileImageShape

      # @!attribute profile_interstitial_type
      #
      #   @return [String, nil]
      optional :profile_interstitial_type, String, api_name: :profileInterstitialType

      # @!attribute profile_picture
      #
      #   @return [String, nil]
      optional :profile_picture, String, api_name: :profilePicture

      # @!attribute profile_sort_enabled
      #
      #   @return [Boolean, nil]
      optional :profile_sort_enabled, XTwitterScraper::Internal::Type::Boolean, api_name: :profileSortEnabled

      # @!attribute profile_translator_type
      #
      #   @return [String, nil]
      optional :profile_translator_type, String, api_name: :profileTranslatorType

      # @!attribute protected
      #   Whether the profile protects its posts
      #
      #   @return [Boolean, nil]
      optional :protected, XTwitterScraper::Internal::Type::Boolean

      # @!attribute statuses_count
      #
      #   @return [Integer, nil]
      optional :statuses_count, Integer, api_name: :statusesCount

      # @!attribute super_follow_eligible
      #
      #   @return [Boolean, nil]
      optional :super_follow_eligible,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :superFollowEligible

      # @!attribute unavailable
      #
      #   @return [Boolean, nil]
      optional :unavailable, XTwitterScraper::Internal::Type::Boolean

      # @!attribute unavailable_reason
      #
      #   @return [String, nil]
      optional :unavailable_reason, String, api_name: :unavailableReason

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String

      # @!attribute verified
      #
      #   @return [Boolean, nil]
      optional :verified, XTwitterScraper::Internal::Type::Boolean

      # @!attribute verified_type
      #
      #   @return [String, nil]
      optional :verified_type, String, api_name: :verifiedType

      # @!attribute withheld_in_countries
      #
      #   @return [Array<String>, nil]
      optional :withheld_in_countries,
               XTwitterScraper::Internal::Type::ArrayOf[String],
               api_name: :withheldInCountries

      # @!method initialize(id:, name:, username:, affiliates_highlighted_label: nil, automated_by: nil, business_account_affiliates_count: nil, community_role: nil, cover_picture: nil, created_at: nil, creator_subscriptions_count: nil, description: nil, favourites_count: nil, followers: nil, following: nil, has_custom_timelines: nil, has_graduated_access: nil, has_hidden_subscriptions_on_profile: nil, highlights_info: nil, identity_verification: nil, is_automated: nil, is_blue_verified: nil, is_profile_translatable: nil, is_translator: nil, is_verified: nil, location: nil, media_count: nil, parody_commentary_fan_label: nil, pinned_tweet_ids: nil, possibly_sensitive: nil, profile_bio: nil, profile_banner_url: nil, profile_description_language: nil, profile_image_shape: nil, profile_interstitial_type: nil, profile_picture: nil, profile_sort_enabled: nil, profile_translator_type: nil, protected: nil, statuses_count: nil, super_follow_eligible: nil, unavailable: nil, unavailable_reason: nil, url: nil, verified: nil, verified_type: nil, withheld_in_countries: nil)
      #   X user profile with bio, follower counts, and verification status.
      #
      #   @param id [String]
      #
      #   @param name [String]
      #
      #   @param username [String]
      #
      #   @param affiliates_highlighted_label [XTwitterScraper::Models::UserProfile::AffiliatesHighlightedLabel] Organization affiliation label shown on an X profile.
      #
      #   @param automated_by [String]
      #
      #   @param business_account_affiliates_count [Integer]
      #
      #   @param community_role [String] Community role when returned by community member reads
      #
      #   @param cover_picture [String]
      #
      #   @param created_at [String]
      #
      #   @param creator_subscriptions_count [Integer]
      #
      #   @param description [String]
      #
      #   @param favourites_count [Integer]
      #
      #   @param followers [Integer]
      #
      #   @param following [Integer]
      #
      #   @param has_custom_timelines [Boolean]
      #
      #   @param has_graduated_access [Boolean]
      #
      #   @param has_hidden_subscriptions_on_profile [Boolean]
      #
      #   @param highlights_info [XTwitterScraper::Models::UserProfile::HighlightsInfo] Profile highlight availability and count metadata.
      #
      #   @param identity_verification [XTwitterScraper::Models::UserProfile::IdentityVerification] Identity verification metadata displayed by X.
      #
      #   @param is_automated [Boolean]
      #
      #   @param is_blue_verified [Boolean] Whether X shows a blue verification badge
      #
      #   @param is_profile_translatable [Boolean]
      #
      #   @param is_translator [Boolean]
      #
      #   @param is_verified [Boolean] Whether X marks the profile as verified
      #
      #   @param location [String]
      #
      #   @param media_count [Integer]
      #
      #   @param parody_commentary_fan_label [String]
      #
      #   @param pinned_tweet_ids [Array<String>]
      #
      #   @param possibly_sensitive [Boolean]
      #
      #   @param profile_bio [Hash{Symbol=>Object}] Structured profile bio with entity annotations
      #
      #   @param profile_banner_url [String] Original X profile banner field when available
      #
      #   @param profile_description_language [String]
      #
      #   @param profile_image_shape [String]
      #
      #   @param profile_interstitial_type [String]
      #
      #   @param profile_picture [String]
      #
      #   @param profile_sort_enabled [Boolean]
      #
      #   @param profile_translator_type [String]
      #
      #   @param protected [Boolean] Whether the profile protects its posts
      #
      #   @param statuses_count [Integer]
      #
      #   @param super_follow_eligible [Boolean]
      #
      #   @param unavailable [Boolean]
      #
      #   @param unavailable_reason [String]
      #
      #   @param url [String]
      #
      #   @param verified [Boolean]
      #
      #   @param verified_type [String]
      #
      #   @param withheld_in_countries [Array<String>]

      # @see XTwitterScraper::Models::UserProfile#affiliates_highlighted_label
      class AffiliatesHighlightedLabel < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute badge_url
        #
        #   @return [String, nil]
        optional :badge_url, String, api_name: :badgeUrl

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute url
        #
        #   @return [String, nil]
        optional :url, String

        # @!attribute url_type
        #
        #   @return [String, nil]
        optional :url_type, String, api_name: :urlType

        # @!attribute user_label_display_type
        #
        #   @return [String, nil]
        optional :user_label_display_type, String, api_name: :userLabelDisplayType

        # @!attribute user_label_type
        #
        #   @return [String, nil]
        optional :user_label_type, String, api_name: :userLabelType

        # @!method initialize(badge_url: nil, description: nil, url: nil, url_type: nil, user_label_display_type: nil, user_label_type: nil)
        #   Organization affiliation label shown on an X profile.
        #
        #   @param badge_url [String]
        #   @param description [String]
        #   @param url [String]
        #   @param url_type [String]
        #   @param user_label_display_type [String]
        #   @param user_label_type [String]
      end

      # @see XTwitterScraper::Models::UserProfile#highlights_info
      class HighlightsInfo < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute can_highlight_tweets
        #
        #   @return [Boolean, nil]
        optional :can_highlight_tweets,
                 XTwitterScraper::Internal::Type::Boolean,
                 api_name: :canHighlightTweets

        # @!attribute highlighted_tweets
        #
        #   @return [String, nil]
        optional :highlighted_tweets, String, api_name: :highlightedTweets

        # @!method initialize(can_highlight_tweets: nil, highlighted_tweets: nil)
        #   Profile highlight availability and count metadata.
        #
        #   @param can_highlight_tweets [Boolean]
        #   @param highlighted_tweets [String]
      end

      # @see XTwitterScraper::Models::UserProfile#identity_verification
      class IdentityVerification < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute is_identity_verified
        #
        #   @return [Boolean, nil]
        optional :is_identity_verified,
                 XTwitterScraper::Internal::Type::Boolean,
                 api_name: :isIdentityVerified

        # @!attribute verified_since_msec
        #
        #   @return [String, nil]
        optional :verified_since_msec, String, api_name: :verifiedSinceMsec

        # @!method initialize(description: nil, is_identity_verified: nil, verified_since_msec: nil)
        #   Identity verification metadata displayed by X.
        #
        #   @param description [String]
        #   @param is_identity_verified [Boolean]
        #   @param verified_since_msec [String]
      end
    end
  end
end
