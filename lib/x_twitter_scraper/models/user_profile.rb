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

      # @!attribute account_based_in
      #   Null when X shows no label.
      #
      #   @return [XTwitterScraper::Models::AccountBasedIn, nil]
      optional :account_based_in,
                                  -> { XTwitterScraper::AccountBasedIn },
                                  api_name: :accountBasedIn,
                                  nil?: true

      # @!attribute account_based_in_accurate
      #   False when X notes accountBasedIn may be inaccurate.
      #
      #   @return [Boolean, nil]
      optional :account_based_in_accurate,
                                           XTwitterScraper::Internal::Type::Boolean,
                                           api_name: :accountBasedInAccurate

      # @!attribute account_based_in_unavailable
      #   True when X withheld accountBasedIn from this read. Retry later.
      #
      #   @return [Boolean, nil]
      optional :account_based_in_unavailable,
                                              XTwitterScraper::Internal::Type::Boolean,
                                              api_name: :accountBasedInUnavailable

      # @!attribute advertiser_account_service_levels
      #   X Ads services the account uses, such as `analytics`, `media_studio` or `smb`.
      #   Empty for an account without ads.
      #
      #   @return [Array<String>, nil]
      optional :advertiser_account_service_levels,
                                                   XTwitterScraper::Internal::Type::ArrayOf[String],
                                                   api_name: :advertiserAccountServiceLevels

      # @!attribute advertiser_account_type
      #   The account's X Ads type. `none` for an account without ads, or
      #   `promotable_user` for one that may run them.
      #
      #   @return [String, nil]
      optional :advertiser_account_type, String, api_name: :advertiserAccountType

      # @!attribute affiliate_username
      #   Handle of the organization X shows the account is affiliated with, from its
      #   About page.
      #
      #   @return [String, nil]
      optional :affiliate_username, String, api_name: :affiliateUsername

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

      # @!attribute birthdate
      #   The parts of the birthday the account made public.
      #
      #   @return [XTwitterScraper::Models::UserProfile::Birthdate, nil]
      optional :birthdate, -> { XTwitterScraper::UserProfile::Birthdate }

      # @!attribute business_account_affiliates_count
      #
      #   @return [Integer, nil]
      optional :business_account_affiliates_count, Integer, api_name: :businessAccountAffiliatesCount

      # @!attribute business_profile_state
      #   Whether X treats the profile as a business profile. `none` or `enabled`.
      #
      #   @return [String, nil]
      optional :business_profile_state, String, api_name: :businessProfileState

      # @!attribute community_role
      #   Community role when returned by community member reads
      #
      #   @return [String, nil]
      optional :community_role, String, api_name: :communityRole

      # @!attribute connected_via
      #   How the account first connected to X.
      #
      #   @return [String, nil]
      optional :connected_via, String, api_name: :connectedVia

      # @!attribute connected_via_accurate
      #   False when X notes that country may be inaccurate.
      #
      #   @return [Boolean, nil]
      optional :connected_via_accurate,
                                        XTwitterScraper::Internal::Type::Boolean,
                                        api_name: :connectedViaAccurate

      # @!attribute contact_info
      #
      #   @return [XTwitterScraper::Models::ProfileContactInfo, nil]
      optional :contact_info, -> { XTwitterScraper::ProfileContactInfo }, api_name: :contactInfo

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

      # @!attribute default_profile
      #   Whether the profile keeps X's default theme.
      #
      #   @return [Boolean, nil]
      optional :default_profile, XTwitterScraper::Internal::Type::Boolean, api_name: :defaultProfile

      # @!attribute default_profile_image
      #   Whether the profile keeps X's default avatar.
      #
      #   @return [Boolean, nil]
      optional :default_profile_image,
                                       XTwitterScraper::Internal::Type::Boolean,
                                       api_name: :defaultProfileImage

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute email
      #   First email the account publishes on its profile, lowercased. Omitted when it
      #   publishes none.
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute fast_followers_count
      #   Followers X counts as fast followers.
      #
      #   @return [Integer, nil]
      optional :fast_followers_count, Integer, api_name: :fastFollowersCount

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

      # @!attribute geo_enabled
      #   Whether the profile may add a location to posts.
      #
      #   @return [Boolean, nil]
      optional :geo_enabled, XTwitterScraper::Internal::Type::Boolean, api_name: :geoEnabled

      # @!attribute grok_translated_bio
      #   Public profile bio translation returned by X
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :grok_translated_bio,
                                     XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
                                     api_name: :grokTranslatedBio

      # @!attribute has_custom_timelines
      #
      #   @return [Boolean, nil]
      optional :has_custom_timelines, XTwitterScraper::Internal::Type::Boolean, api_name: :hasCustomTimelines

      # @!attribute has_extended_profile
      #   Whether the profile filled X's extended fields, such as a birth date. True or
      #   false.
      #
      #   @return [Boolean, nil]
      optional :has_extended_profile, XTwitterScraper::Internal::Type::Boolean, api_name: :hasExtendedProfile

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

      # @!attribute is_translation_enabled
      #   Whether the account turned on X's translation of its posts. True or false.
      #
      #   @return [Boolean, nil]
      optional :is_translation_enabled,
                                        XTwitterScraper::Internal::Type::Boolean,
                                        api_name: :isTranslationEnabled

      # @!attribute is_translator
      #
      #   @return [Boolean, nil]
      optional :is_translator, XTwitterScraper::Internal::Type::Boolean, api_name: :isTranslator

      # @!attribute is_verified
      #   Whether X marks the profile as verified
      #
      #   @return [Boolean, nil]
      optional :is_verified, XTwitterScraper::Internal::Type::Boolean, api_name: :isVerified

      # @!attribute listed_count
      #   Public lists that include the profile.
      #
      #   @return [Integer, nil]
      optional :listed_count, Integer, api_name: :listedCount

      # @!attribute location
      #
      #   @return [String, nil]
      optional :location, String

      # @!attribute media_count
      #
      #   @return [Integer, nil]
      optional :media_count, Integer, api_name: :mediaCount

      # @!attribute normal_followers_count
      #   Followers minus fast followers.
      #
      #   @return [Integer, nil]
      optional :normal_followers_count, Integer, api_name: :normalFollowersCount

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

      # @!attribute professional
      #   Professional metadata with category display settings
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :professional,
                              XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

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

      # @!attribute profile_picture_original
      #   The same profile picture at full size, as the account uploaded it. Download this
      #   one for the image.
      #
      #   @return [String, nil]
      optional :profile_picture_original, String, api_name: :profilePictureOriginal

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

      # @!attribute redirects_to_username
      #   Handle x.com sends this profile's visitors to, such as the new handle of a
      #   renamed account whose old handle now holds a placeholder. Missing when x.com
      #   shows the profile itself.
      #
      #   @return [String, nil]
      optional :redirects_to_username, String, api_name: :redirectsToUsername

      # @!attribute retweeted_at
      #   UTC repost time with includeRetweetTimestamp. Null when Xquik found no repost
      #   time. Otherwise omitted.
      #
      #   @return [Time, nil]
      optional :retweeted_at, Time, api_name: :retweetedAt, nil?: true

      # @!attribute statuses_count
      #
      #   @return [Integer, nil]
      optional :statuses_count, Integer, api_name: :statusesCount

      # @!attribute subscribers_count
      #   Accounts subscribed to the profile's paid Subscriptions. 0 when it has none.
      #
      #   @return [Integer, nil]
      optional :subscribers_count, Integer, api_name: :subscribersCount

      # @!attribute super_follow_eligible
      #
      #   @return [Boolean, nil]
      optional :super_follow_eligible,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :superFollowEligible

      # @!attribute super_follows_user_profile_active
      #   Whether X marks the subscription profile as active.
      #
      #   @return [Boolean, nil]
      optional :super_follows_user_profile_active,
                                                   XTwitterScraper::Internal::Type::Boolean,
                                                   api_name: :superFollowsUserProfileActive

      # @!attribute tip_jar
      #
      #   @return [XTwitterScraper::Models::UserTipJar, nil]
      optional :tip_jar, -> { XTwitterScraper::UserTipJar }, api_name: :tipJar

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

      # @!attribute username_changes
      #   How often the account changed its username.
      #
      #   @return [XTwitterScraper::Models::UserProfile::UsernameChanges, nil]
      optional :username_changes,
                                  -> { XTwitterScraper::UserProfile::UsernameChanges },
                                  api_name: :usernameChanges

      # @!attribute verification_reason
      #   X's text on why the profile is verified, with its links.
      #
      #   @return [XTwitterScraper::Models::UserProfile::VerificationReason, nil]
      optional :verification_reason,
                                     -> { XTwitterScraper::UserProfile::VerificationReason },
                                     api_name: :verificationReason

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

      # @!attribute withheld_scope
      #   Whether X withholds a post or user
      #
      #   @return [String, nil]
      optional :withheld_scope, String, api_name: :withheldScope

      # @!method initialize(id:, name:, username:, account_based_in: nil, account_based_in_accurate: nil, account_based_in_unavailable: nil, advertiser_account_service_levels: nil, advertiser_account_type: nil, affiliate_username: nil, affiliates_highlighted_label: nil, automated_by: nil, birthdate: nil, business_account_affiliates_count: nil, business_profile_state: nil, community_role: nil, connected_via: nil, connected_via_accurate: nil, contact_info: nil, cover_picture: nil, created_at: nil, creator_subscriptions_count: nil, default_profile: nil, default_profile_image: nil, description: nil, email: nil, fast_followers_count: nil, favourites_count: nil, followers: nil, following: nil, geo_enabled: nil, grok_translated_bio: nil, has_custom_timelines: nil, has_extended_profile: nil, has_graduated_access: nil, has_hidden_subscriptions_on_profile: nil, highlights_info: nil, identity_verification: nil, is_automated: nil, is_blue_verified: nil, is_profile_translatable: nil, is_translation_enabled: nil, is_translator: nil, is_verified: nil, listed_count: nil, location: nil, media_count: nil, normal_followers_count: nil, parody_commentary_fan_label: nil, pinned_tweet_ids: nil, possibly_sensitive: nil, professional: nil, profile_bio: nil, profile_banner_url: nil, profile_description_language: nil, profile_image_shape: nil, profile_interstitial_type: nil, profile_picture: nil, profile_picture_original: nil, profile_sort_enabled: nil, profile_translator_type: nil, protected: nil, redirects_to_username: nil, retweeted_at: nil, statuses_count: nil, subscribers_count: nil, super_follow_eligible: nil, super_follows_user_profile_active: nil, tip_jar: nil, unavailable: nil, unavailable_reason: nil, url: nil, username_changes: nil, verification_reason: nil, verified: nil, verified_type: nil, withheld_in_countries: nil, withheld_scope: nil)
      #   X user profile with bio, follower counts, and verification status.
      #
      #   @param id [String]
      #
      #   @param name [String]
      #
      #   @param username [String]
      #
      #   @param account_based_in [XTwitterScraper::Models::AccountBasedIn, nil] Null when X shows no label.
      #
      #   @param account_based_in_accurate [Boolean] False when X notes accountBasedIn may be inaccurate.
      #
      #   @param account_based_in_unavailable [Boolean] True when X withheld accountBasedIn from this read. Retry later.
      #
      #   @param advertiser_account_service_levels [Array<String>] X Ads services the account uses, such as `analytics`, `media_studio` or `smb`. E
      #
      #   @param advertiser_account_type [String] The account's X Ads type. `none` for an account without ads, or `promotable_user
      #
      #   @param affiliate_username [String] Handle of the organization X shows the account is affiliated with, from its Abou
      #
      #   @param affiliates_highlighted_label [XTwitterScraper::Models::UserProfile::AffiliatesHighlightedLabel] Organization affiliation label shown on an X profile.
      #
      #   @param automated_by [String]
      #
      #   @param birthdate [XTwitterScraper::Models::UserProfile::Birthdate] The parts of the birthday the account made public.
      #
      #   @param business_account_affiliates_count [Integer]
      #
      #   @param business_profile_state [String] Whether X treats the profile as a business profile. `none` or `enabled`.
      #
      #   @param community_role [String] Community role when returned by community member reads
      #
      #   @param connected_via [String] How the account first connected to X.
      #
      #   @param connected_via_accurate [Boolean] False when X notes that country may be inaccurate.
      #
      #   @param contact_info [XTwitterScraper::Models::ProfileContactInfo]
      #
      #   @param cover_picture [String]
      #
      #   @param created_at [String]
      #
      #   @param creator_subscriptions_count [Integer]
      #
      #   @param default_profile [Boolean] Whether the profile keeps X's default theme.
      #
      #   @param default_profile_image [Boolean] Whether the profile keeps X's default avatar.
      #
      #   @param description [String]
      #
      #   @param email [String] First email the account publishes on its profile, lowercased. Omitted when it pu
      #
      #   @param fast_followers_count [Integer] Followers X counts as fast followers.
      #
      #   @param favourites_count [Integer]
      #
      #   @param followers [Integer]
      #
      #   @param following [Integer]
      #
      #   @param geo_enabled [Boolean] Whether the profile may add a location to posts.
      #
      #   @param grok_translated_bio [Hash{Symbol=>Object}] Public profile bio translation returned by X
      #
      #   @param has_custom_timelines [Boolean]
      #
      #   @param has_extended_profile [Boolean] Whether the profile filled X's extended fields, such as a birth date. True or fa
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
      #   @param is_translation_enabled [Boolean] Whether the account turned on X's translation of its posts. True or false.
      #
      #   @param is_translator [Boolean]
      #
      #   @param is_verified [Boolean] Whether X marks the profile as verified
      #
      #   @param listed_count [Integer] Public lists that include the profile.
      #
      #   @param location [String]
      #
      #   @param media_count [Integer]
      #
      #   @param normal_followers_count [Integer] Followers minus fast followers.
      #
      #   @param parody_commentary_fan_label [String]
      #
      #   @param pinned_tweet_ids [Array<String>]
      #
      #   @param possibly_sensitive [Boolean]
      #
      #   @param professional [Hash{Symbol=>Object}] Professional metadata with category display settings
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
      #   @param profile_picture_original [String] The same profile picture at full size, as the account uploaded it. Download this
      #
      #   @param profile_sort_enabled [Boolean]
      #
      #   @param profile_translator_type [String]
      #
      #   @param protected [Boolean] Whether the profile protects its posts
      #
      #   @param redirects_to_username [String] Handle x.com sends this profile's visitors to, such as the new handle of a renam
      #
      #   @param retweeted_at [Time, nil] UTC repost time with includeRetweetTimestamp. Null when Xquik found no repost ti
      #
      #   @param statuses_count [Integer]
      #
      #   @param subscribers_count [Integer] Accounts subscribed to the profile's paid Subscriptions. 0 when it has none.
      #
      #   @param super_follow_eligible [Boolean]
      #
      #   @param super_follows_user_profile_active [Boolean] Whether X marks the subscription profile as active.
      #
      #   @param tip_jar [XTwitterScraper::Models::UserTipJar]
      #
      #   @param unavailable [Boolean]
      #
      #   @param unavailable_reason [String]
      #
      #   @param url [String]
      #
      #   @param username_changes [XTwitterScraper::Models::UserProfile::UsernameChanges] How often the account changed its username.
      #
      #   @param verification_reason [XTwitterScraper::Models::UserProfile::VerificationReason] X's text on why the profile is verified, with its links.
      #
      #   @param verified [Boolean]
      #
      #   @param verified_type [String]
      #
      #   @param withheld_in_countries [Array<String>]
      #
      #   @param withheld_scope [String] Whether X withholds a post or user

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

      # @see XTwitterScraper::Models::UserProfile#birthdate
      class Birthdate < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute day
        #
        #   @return [Integer, nil]
        optional :day, Integer

        # @!attribute month
        #
        #   @return [Integer, nil]
        optional :month, Integer

        # @!attribute year
        #
        #   @return [Integer, nil]
        optional :year, Integer

        # @!method initialize(day: nil, month: nil, year: nil)
        #   The parts of the birthday the account made public.
        #
        #   @param day [Integer]
        #   @param month [Integer]
        #   @param year [Integer]
      end

      # @see XTwitterScraper::Models::UserProfile#username_changes
      class UsernameChanges < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute count
        #   Whole number from 0.
        #
        #   @return [Integer]
        required :count, Integer

        # @!attribute last_changed_at
        #   Time of the latest change, omitted when there is none.
        #
        #   @return [Time, nil]
        optional :last_changed_at, Time, api_name: :lastChangedAt

        # @!method initialize(count:, last_changed_at: nil)
        #   How often the account changed its username.
        #
        #   @param count [Integer] Whole number from 0.
        #
        #   @param last_changed_at [Time] Time of the latest change, omitted when there is none.
      end

      # @see XTwitterScraper::Models::UserProfile#verification_reason
      class VerificationReason < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute text
        #
        #   @return [String, nil]
        optional :text, String

        # @!attribute entities
        #   Links inside the text, by character range.
        #
        #   @return [Array<XTwitterScraper::Models::UserProfile::VerificationReason::Entity>, nil]
        optional :entities,
                            -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::UserProfile::VerificationReason::Entity] }

        # @!method initialize(text: nil, entities: nil)
        #   X's text on why the profile is verified, with its links.
        #
        #   @param text [String]
        #
        #   @param entities [Array<XTwitterScraper::Models::UserProfile::VerificationReason::Entity>] Links inside the text, by character range.

        # @see XTwitterScraper::Models::UserProfile::VerificationReason#entities
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

          # @!attribute url
          #
          #   @return [String, nil]
          optional :url, String

          # @!attribute url_type
          #
          #   @return [String, nil]
          optional :url_type, String, api_name: :urlType

          # @!method initialize(from_index: nil, to_index: nil, url: nil, url_type: nil)
          #   @param from_index [Integer] Whole number from 0.
          #
          #   @param to_index [Integer] Whole number from 0.
          #
          #   @param url [String]
          #
          #   @param url_type [String]
        end
      end
    end
  end
end
