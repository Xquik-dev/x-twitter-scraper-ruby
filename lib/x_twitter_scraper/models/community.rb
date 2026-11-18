# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class Community < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   Unique community identifier
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Display name of the community
      #
      #   @return [String]
      required :name, String

      # @!attribute description
      #   About text for the community
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute member_count
      #   Total member count
      #
      #   @return [Integer]
      required :member_count, Integer

      # @!attribute moderator_count
      #   Total moderator count
      #
      #   @return [Integer, nil]
      optional :moderator_count, Integer

      # @!attribute is_nsfw
      #   Whether the community is marked sensitive
      #
      #   @return [Boolean]
      required :is_nsfw, XTwitterScraper::Internal::Type::Boolean

      # @!attribute primary_topic
      #   Primary topic. Its id is absent when X lists the community in a keyword or topic
      #   result.
      #
      #   @return [XTwitterScraper::Models::Community::PrimaryTopic, nil]
      optional :primary_topic, -> { XTwitterScraper::Models::Community::PrimaryTopic }

      # @!attribute created_at
      #   Community creation timestamp
      #
      #   @return [String, nil]
      optional :created_at, String

      # @!attribute join_policy
      #   Join policy (open or restricted)
      #
      #   @return [String, nil]
      optional :join_policy, String

      # @!attribute invites_policy
      #   Invitation policy
      #
      #   @return [String, nil]
      optional :invites_policy, String

      # @!attribute question
      #   What the community asks a user who joins
      #
      #   @return [String, nil]
      optional :question, String

      # @!attribute rules
      #   Community rules
      #
      #   @return [Array<XTwitterScraper::Models::Community::Rule>, nil]
      optional :rules, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Community::Rule] }

      # @!attribute search_tags
      #   Tags X finds the community by
      #
      #   @return [Array<String>, nil]
      optional :search_tags, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :searchTags

      # @!attribute creator
      #   The creator's public profile, or the ID, username and badge alone when X sends
      #   no profile
      #
      #   @return [XTwitterScraper::Models::Community::Creator, nil]
      optional :creator, -> { XTwitterScraper::Models::Community::Creator }

      # @!attribute admin
      #   Public X profile.
      #
      #   @return [XTwitterScraper::Models::UserProfile, nil]
      optional :admin, -> { XTwitterScraper::Models::UserProfile }

      # @!attribute members_facepile
      #   The members X previews beside the member count. A keyword or topic result gives
      #   each member's ID & picture only.
      #
      #   @return [Array<XTwitterScraper::Models::UserProfile, XTwitterScraper::Models::CommunityMemberPreview>, nil]
      optional :members_facepile, -> { XTwitterScraper::Internal::Type::ArrayOf[union: XTwitterScraper::Models::Community::MembersFacepile] }, api_name: :membersFacepile

      # @!attribute banner_url
      #   Community banner image URL
      #
      #   @return [String, nil]
      optional :banner_url, String

      # @!attribute banner
      #   The banner X shows for a community, with its size & colors.
      #
      #   @return [XTwitterScraper::Models::CommunityBanner, nil]
      optional :banner, -> { XTwitterScraper::Models::CommunityBanner }

      # @!method initialize(id:, name:, member_count:, is_nsfw:, description: nil, moderator_count: nil, primary_topic: nil, created_at: nil, join_policy: nil, invites_policy: nil, question: nil, rules: nil, search_tags: nil, creator: nil, admin: nil, members_facepile: nil, banner_url: nil, banner: nil)
      #   Public X Community, as every Community read returns it.
      #
      #   @param id [String] Unique community identifier
      #
      #   @param name [String] Display name of the community
      #
      #   @param member_count [Integer] Total member count
      #
      #   @param is_nsfw [Boolean] Whether the community is marked sensitive
      #
      #   @param description [String] About text for the community
      #
      #   @param moderator_count [Integer] Total moderator count
      #
      #   @param primary_topic [XTwitterScraper::Models::Community::PrimaryTopic] Primary topic. Its id is absent when X lists the community in a keyword or topic result.
      #
      #   @param created_at [String] Community creation timestamp
      #
      #   @param join_policy [String] Join policy (open or restricted)
      #
      #   @param invites_policy [String] Invitation policy
      #
      #   @param question [String] What the community asks a user who joins
      #
      #   @param rules [Array<XTwitterScraper::Models::Community::Rule>] Community rules
      #
      #   @param search_tags [Array<String>] Tags X finds the community by
      #
      #   @param creator [XTwitterScraper::Models::Community::Creator] The creator's public profile, or the ID, username and badge alone when X sends no profile
      #
      #   @param admin [XTwitterScraper::Models::UserProfile] Public X profile.
      #
      #   @param members_facepile [Array<XTwitterScraper::Models::UserProfile, XTwitterScraper::Models::CommunityMemberPreview>] The members X previews beside the member count. A keyword or topic result gives each member's ID & picture only.
      #
      #   @param banner_url [String] Community banner image URL
      #
      #   @param banner [XTwitterScraper::Models::CommunityBanner] The banner X shows for a community, with its size & colors.

      class PrimaryTopic < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #   Topic ID that /x/communities/popular takes
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute name
        #   Topic name X shows on the community
        #
        #   @return [String]
        required :name, String

        # @!method initialize(name:, id: nil)
        #   Primary topic. Its id is absent when X lists the community in a keyword or topic
        #   result.
        #
        #   @param name [String] Topic name X shows on the community
        #
        #   @param id [String] Topic ID that /x/communities/popular takes
      end

      class Rule < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #   Rule ID
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute name
        #   Rule title
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute description
        #   What the rule asks of members
        #
        #   @return [String, nil]
        optional :description, String

        # @!method initialize(id: nil, name: nil, description: nil)
        #   @param id [String] Rule ID
        #
        #   @param name [String] Rule title
        #
        #   @param description [String] What the rule asks of members
      end

      class Creator < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute username
        #
        #   @return [String]
        required :username, String

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute followers
        #   Omitted when X sends no count, as for the account that first posted reused
        #   media.
        #
        #   @return [Integer, nil]
        optional :followers, Integer

        # @!attribute following
        #
        #   @return [Integer, nil]
        optional :following, Integer

        # @!attribute verified
        #
        #   @return [Boolean]
        required :verified, XTwitterScraper::Internal::Type::Boolean

        # @!attribute is_blue_verified
        #   Whether X shows a blue verification badge
        #
        #   @return [Boolean, nil]
        optional :is_blue_verified, XTwitterScraper::Internal::Type::Boolean, api_name: :isBlueVerified

        # @!attribute is_verified
        #   Whether X marks the profile as verified
        #
        #   @return [Boolean, nil]
        optional :is_verified, XTwitterScraper::Internal::Type::Boolean, api_name: :isVerified

        # @!attribute profile_picture
        #   Profile picture at 48 px, as X sends it.
        #
        #   @return [String, nil]
        optional :profile_picture, String, api_name: :profilePicture

        # @!attribute profile_picture_original
        #   The same profile picture at full size, as the account uploaded it. Download this
        #   one for the image.
        #
        #   @return [String, nil]
        optional :profile_picture_original, String, api_name: :profilePictureOriginal

        # @!attribute cover_picture
        #
        #   @return [String, nil]
        optional :cover_picture, String, api_name: :coverPicture

        # @!attribute profile_banner_url
        #   Original X profile banner field when available
        #
        #   @return [String, nil]
        optional :profile_banner_url, String, api_name: :profileBannerUrl

        # @!attribute location
        #   Account owner's public profile location text
        #
        #   @return [String, nil]
        optional :location, String

        # @!attribute account_based_in
        #   Null when X shows no label.
        #
        #   @return [XTwitterScraper::Models::AccountBasedIn, nil]
        optional :account_based_in, -> { XTwitterScraper::Models::AccountBasedIn }, api_name: :accountBasedIn, nil?: true

        # @!attribute account_based_in_unavailable
        #   True when X withheld accountBasedIn from this read. Retry later.
        #
        #   @return [Boolean, nil]
        optional :account_based_in_unavailable,
                 XTwitterScraper::Internal::Type::Boolean,
                 api_name: :accountBasedInUnavailable

        # @!attribute account_based_in_accurate
        #   False when X notes accountBasedIn may be inaccurate.
        #
        #   @return [Boolean, nil]
        optional :account_based_in_accurate,
                 XTwitterScraper::Internal::Type::Boolean,
                 api_name: :accountBasedInAccurate

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

        # @!attribute affiliate_username
        #   Handle of the organization X shows the account is affiliated with, from its
        #   About page.
        #
        #   @return [String, nil]
        optional :affiliate_username, String, api_name: :affiliateUsername

        # @!attribute email
        #   First email the account publishes on its profile, lowercased. Omitted when it
        #   publishes none.
        #
        #   @return [String, nil]
        optional :email, String

        # @!attribute contact_info
        #   Emails, phone numbers & links the account publishes on its own profile. Omitted
        #   when it publishes none.
        #
        #   @return [XTwitterScraper::Models::ProfileContactInfo, nil]
        optional :contact_info, -> { XTwitterScraper::Models::ProfileContactInfo }, api_name: :contactInfo

        # @!attribute username_changes
        #   How often the account changed its username.
        #
        #   @return [XTwitterScraper::Models::Community::Creator::UsernameChanges, nil]
        optional :username_changes, -> { XTwitterScraper::Models::Community::Creator::UsernameChanges }, api_name: :usernameChanges

        # @!attribute birthdate
        #   The parts of the birthday the account made public.
        #
        #   @return [XTwitterScraper::Models::Community::Creator::Birthdate, nil]
        optional :birthdate, -> { XTwitterScraper::Models::Community::Creator::Birthdate }

        # @!attribute retweeted_at
        #   UTC repost time with includeRetweetTimestamp. Null when Xquik found no repost
        #   time. Otherwise omitted.
        #
        #   @return [Time, nil]
        optional :retweeted_at, Time, api_name: :retweetedAt, nil?: true

        # @!attribute created_at
        #   Account creation time.
        #
        #   @return [String, nil]
        optional :created_at, String, api_name: :createdAt

        # @!attribute statuses_count
        #
        #   @return [Integer, nil]
        optional :statuses_count, Integer, api_name: :statusesCount

        # @!attribute media_count
        #
        #   @return [Integer, nil]
        optional :media_count, Integer, api_name: :mediaCount

        # @!attribute protected
        #   Whether the profile protects its posts
        #
        #   @return [Boolean, nil]
        optional :protected, XTwitterScraper::Internal::Type::Boolean

        # @!attribute url
        #
        #   @return [String, nil]
        optional :url, String

        # @!attribute favourites_count
        #
        #   @return [Integer, nil]
        optional :favourites_count, Integer, api_name: :favouritesCount

        # @!attribute has_custom_timelines
        #
        #   @return [Boolean, nil]
        optional :has_custom_timelines,
                 XTwitterScraper::Internal::Type::Boolean,
                 api_name: :hasCustomTimelines

        # @!attribute is_translator
        #
        #   @return [Boolean, nil]
        optional :is_translator, XTwitterScraper::Internal::Type::Boolean, api_name: :isTranslator

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

        # @!attribute possibly_sensitive
        #
        #   @return [Boolean, nil]
        optional :possibly_sensitive, XTwitterScraper::Internal::Type::Boolean, api_name: :possiblySensitive

        # @!attribute professional
        #   Professional metadata with category display settings
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :professional, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

        # @!attribute grok_translated_bio
        #   Public profile bio translation returned by X
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :grok_translated_bio,
                 XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
                 api_name: :grokTranslatedBio

        # @!attribute pinned_tweet_ids
        #
        #   @return [Array<String>, nil]
        optional :pinned_tweet_ids,
                 XTwitterScraper::Internal::Type::ArrayOf[String],
                 api_name: :pinnedTweetIds

        # @!attribute is_automated
        #
        #   @return [Boolean, nil]
        optional :is_automated, XTwitterScraper::Internal::Type::Boolean, api_name: :isAutomated

        # @!attribute automated_by
        #
        #   @return [String, nil]
        optional :automated_by, String, api_name: :automatedBy

        # @!attribute unavailable
        #
        #   @return [Boolean, nil]
        optional :unavailable, XTwitterScraper::Internal::Type::Boolean

        # @!attribute unavailable_reason
        #
        #   @return [String, nil]
        optional :unavailable_reason, String, api_name: :unavailableReason

        # @!attribute verified_type
        #
        #   @return [String, nil]
        optional :verified_type, String, api_name: :verifiedType

        # @!attribute affiliates_highlighted_label
        #   Organization affiliation label shown on an X profile.
        #
        #   @return [XTwitterScraper::Models::UserAffiliateLabel, nil]
        optional :affiliates_highlighted_label, -> { XTwitterScraper::Models::UserAffiliateLabel }, api_name: :affiliatesHighlightedLabel

        # @!attribute business_account_affiliates_count
        #   Whole number from 0.
        #
        #   @return [Integer, nil]
        optional :business_account_affiliates_count, Integer, api_name: :businessAccountAffiliatesCount

        # @!attribute creator_subscriptions_count
        #   Whole number from 0.
        #
        #   @return [Integer, nil]
        optional :creator_subscriptions_count, Integer, api_name: :creatorSubscriptionsCount

        # @!attribute has_graduated_access
        #
        #   @return [Boolean, nil]
        optional :has_graduated_access,
                 XTwitterScraper::Internal::Type::Boolean,
                 api_name: :hasGraduatedAccess

        # @!attribute has_hidden_subscriptions_on_profile
        #
        #   @return [Boolean, nil]
        optional :has_hidden_subscriptions_on_profile,
                 XTwitterScraper::Internal::Type::Boolean,
                 api_name: :hasHiddenSubscriptionsOnProfile

        # @!attribute highlights_info
        #   Profile highlight availability and count metadata.
        #
        #   @return [XTwitterScraper::Models::UserHighlightsInfo, nil]
        optional :highlights_info, -> { XTwitterScraper::Models::UserHighlightsInfo }, api_name: :highlightsInfo

        # @!attribute identity_verification
        #   Identity verification X shows on the profile & its About page.
        #
        #   @return [XTwitterScraper::Models::UserIdentityVerification, nil]
        optional :identity_verification, -> { XTwitterScraper::Models::UserIdentityVerification }, api_name: :identityVerification

        # @!attribute is_profile_translatable
        #
        #   @return [Boolean, nil]
        optional :is_profile_translatable,
                 XTwitterScraper::Internal::Type::Boolean,
                 api_name: :isProfileTranslatable

        # @!attribute parody_commentary_fan_label
        #
        #   @return [String, nil]
        optional :parody_commentary_fan_label, String, api_name: :parodyCommentaryFanLabel

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

        # @!attribute profile_sort_enabled
        #
        #   @return [Boolean, nil]
        optional :profile_sort_enabled,
                 XTwitterScraper::Internal::Type::Boolean,
                 api_name: :profileSortEnabled

        # @!attribute profile_translator_type
        #
        #   @return [String, nil]
        optional :profile_translator_type, String, api_name: :profileTranslatorType

        # @!attribute redirects_to_username
        #   Handle x.com sends this profile's visitors to, such as the new handle of a
        #   renamed account whose old handle now holds a placeholder. Missing when x.com
        #   shows the profile itself.
        #
        #   @return [String, nil]
        optional :redirects_to_username, String, api_name: :redirectsToUsername

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
        #   Public payment and creator-support handles shown on X.
        #
        #   @return [XTwitterScraper::Models::UserTipJar, nil]
        optional :tip_jar, -> { XTwitterScraper::Models::UserTipJar }, api_name: :tipJar

        # @!attribute listed_count
        #   Public lists that include the profile.
        #
        #   @return [Integer, nil]
        optional :listed_count, Integer, api_name: :listedCount

        # @!attribute fast_followers_count
        #   Followers X counts as fast followers.
        #
        #   @return [Integer, nil]
        optional :fast_followers_count, Integer, api_name: :fastFollowersCount

        # @!attribute normal_followers_count
        #   Followers minus fast followers.
        #
        #   @return [Integer, nil]
        optional :normal_followers_count, Integer, api_name: :normalFollowersCount

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

        # @!attribute has_extended_profile
        #   Whether the profile filled X's extended fields, such as a birth date. True or
        #   false.
        #
        #   @return [Boolean, nil]
        optional :has_extended_profile,
                 XTwitterScraper::Internal::Type::Boolean,
                 api_name: :hasExtendedProfile

        # @!attribute is_translation_enabled
        #   Whether the account turned on X's translation of its posts. True or false.
        #
        #   @return [Boolean, nil]
        optional :is_translation_enabled,
                 XTwitterScraper::Internal::Type::Boolean,
                 api_name: :isTranslationEnabled

        # @!attribute geo_enabled
        #   Whether the profile may add a location to posts.
        #
        #   @return [Boolean, nil]
        optional :geo_enabled, XTwitterScraper::Internal::Type::Boolean, api_name: :geoEnabled

        # @!attribute advertiser_account_type
        #   The account's X Ads type. `none` for an account without ads, or
        #   `promotable_user` for one that may run them.
        #
        #   @return [String, nil]
        optional :advertiser_account_type, String, api_name: :advertiserAccountType

        # @!attribute advertiser_account_service_levels
        #   X Ads services the account uses, such as `analytics`, `media_studio` or `smb`.
        #   Empty for an account without ads.
        #
        #   @return [Array<String>, nil]
        optional :advertiser_account_service_levels,
                 XTwitterScraper::Internal::Type::ArrayOf[String],
                 api_name: :advertiserAccountServiceLevels

        # @!attribute business_profile_state
        #   Whether X treats the profile as a business profile. `none` or `enabled`.
        #
        #   @return [String, nil]
        optional :business_profile_state, String, api_name: :businessProfileState

        # @!attribute subscribers_count
        #   Accounts subscribed to the profile's paid Subscriptions. 0 when it has none.
        #
        #   @return [Integer, nil]
        optional :subscribers_count, Integer, api_name: :subscribersCount

        # @!attribute verification_reason
        #   X's text on why the profile is verified, with its links.
        #
        #   @return [XTwitterScraper::Models::Community::Creator::VerificationReason, nil]
        optional :verification_reason, -> { XTwitterScraper::Models::Community::Creator::VerificationReason }, api_name: :verificationReason

        # @!attribute community_role
        #   Community role when returned by community member reads
        #
        #   @return [String, nil]
        optional :community_role, String, api_name: :communityRole

        # @!attribute profile_bio
        #   Structured profile bio with entity annotations
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :profile_bio, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

        # @!method initialize(id:, username:, verified:, name: nil, description: nil, followers: nil, following: nil, is_blue_verified: nil, is_verified: nil, profile_picture: nil, profile_picture_original: nil, cover_picture: nil, profile_banner_url: nil, location: nil, account_based_in: nil, account_based_in_unavailable: nil, account_based_in_accurate: nil, connected_via: nil, connected_via_accurate: nil, affiliate_username: nil, email: nil, contact_info: nil, username_changes: nil, birthdate: nil, retweeted_at: nil, created_at: nil, statuses_count: nil, media_count: nil, protected: nil, url: nil, favourites_count: nil, has_custom_timelines: nil, is_translator: nil, withheld_in_countries: nil, withheld_scope: nil, possibly_sensitive: nil, professional: nil, grok_translated_bio: nil, pinned_tweet_ids: nil, is_automated: nil, automated_by: nil, unavailable: nil, unavailable_reason: nil, verified_type: nil, affiliates_highlighted_label: nil, business_account_affiliates_count: nil, creator_subscriptions_count: nil, has_graduated_access: nil, has_hidden_subscriptions_on_profile: nil, highlights_info: nil, identity_verification: nil, is_profile_translatable: nil, parody_commentary_fan_label: nil, profile_description_language: nil, profile_image_shape: nil, profile_interstitial_type: nil, profile_sort_enabled: nil, profile_translator_type: nil, redirects_to_username: nil, super_follow_eligible: nil, super_follows_user_profile_active: nil, tip_jar: nil, listed_count: nil, fast_followers_count: nil, normal_followers_count: nil, default_profile: nil, default_profile_image: nil, has_extended_profile: nil, is_translation_enabled: nil, geo_enabled: nil, advertiser_account_type: nil, advertiser_account_service_levels: nil, business_profile_state: nil, subscribers_count: nil, verification_reason: nil, community_role: nil, profile_bio: nil)
        #   The creator's public profile, or the ID, username and badge alone when X sends
        #   no profile
        #
        #   @param id [String]
        #
        #   @param username [String]
        #
        #   @param verified [Boolean]
        #
        #   @param name [String]
        #
        #   @param description [String]
        #
        #   @param followers [Integer] Omitted when X sends no count, as for the account that first posted reused media.
        #
        #   @param following [Integer]
        #
        #   @param is_blue_verified [Boolean] Whether X shows a blue verification badge
        #
        #   @param is_verified [Boolean] Whether X marks the profile as verified
        #
        #   @param profile_picture [String] Profile picture at 48 px, as X sends it.
        #
        #   @param profile_picture_original [String] The same profile picture at full size, as the account uploaded it. Download this one for the image.
        #
        #   @param cover_picture [String]
        #
        #   @param profile_banner_url [String] Original X profile banner field when available
        #
        #   @param location [String] Account owner's public profile location text
        #
        #   @param account_based_in [XTwitterScraper::Models::AccountBasedIn, nil] Null when X shows no label.
        #
        #   @param account_based_in_unavailable [Boolean] True when X withheld accountBasedIn from this read. Retry later.
        #
        #   @param account_based_in_accurate [Boolean] False when X notes accountBasedIn may be inaccurate.
        #
        #   @param connected_via [String] How the account first connected to X.
        #
        #   @param connected_via_accurate [Boolean] False when X notes that country may be inaccurate.
        #
        #   @param affiliate_username [String] Handle of the organization X shows the account is affiliated with, from its About page.
        #
        #   @param email [String] First email the account publishes on its profile, lowercased. Omitted when it publishes none.
        #
        #   @param contact_info [XTwitterScraper::Models::ProfileContactInfo] Emails, phone numbers & links the account publishes on its own profile. Omitted when it publishes none.
        #
        #   @param username_changes [XTwitterScraper::Models::Community::Creator::UsernameChanges] How often the account changed its username.
        #
        #   @param birthdate [XTwitterScraper::Models::Community::Creator::Birthdate] The parts of the birthday the account made public.
        #
        #   @param retweeted_at [Time, nil] UTC repost time with includeRetweetTimestamp. Null when Xquik found no repost time. Otherwise omitted.
        #
        #   @param created_at [String] Account creation time.
        #
        #   @param statuses_count [Integer]
        #
        #   @param media_count [Integer]
        #
        #   @param protected [Boolean] Whether the profile protects its posts
        #
        #   @param url [String]
        #
        #   @param favourites_count [Integer]
        #
        #   @param has_custom_timelines [Boolean]
        #
        #   @param is_translator [Boolean]
        #
        #   @param withheld_in_countries [Array<String>]
        #
        #   @param withheld_scope [String] Whether X withholds a post or user
        #
        #   @param possibly_sensitive [Boolean]
        #
        #   @param professional [Hash{Symbol=>Object}] Professional metadata with category display settings
        #
        #   @param grok_translated_bio [Hash{Symbol=>Object}] Public profile bio translation returned by X
        #
        #   @param pinned_tweet_ids [Array<String>]
        #
        #   @param is_automated [Boolean]
        #
        #   @param automated_by [String]
        #
        #   @param unavailable [Boolean]
        #
        #   @param unavailable_reason [String]
        #
        #   @param verified_type [String]
        #
        #   @param affiliates_highlighted_label [XTwitterScraper::Models::UserAffiliateLabel] Organization affiliation label shown on an X profile.
        #
        #   @param business_account_affiliates_count [Integer] Whole number from 0.
        #
        #   @param creator_subscriptions_count [Integer] Whole number from 0.
        #
        #   @param has_graduated_access [Boolean]
        #
        #   @param has_hidden_subscriptions_on_profile [Boolean]
        #
        #   @param highlights_info [XTwitterScraper::Models::UserHighlightsInfo] Profile highlight availability and count metadata.
        #
        #   @param identity_verification [XTwitterScraper::Models::UserIdentityVerification] Identity verification X shows on the profile & its About page.
        #
        #   @param is_profile_translatable [Boolean]
        #
        #   @param parody_commentary_fan_label [String]
        #
        #   @param profile_description_language [String]
        #
        #   @param profile_image_shape [String]
        #
        #   @param profile_interstitial_type [String]
        #
        #   @param profile_sort_enabled [Boolean]
        #
        #   @param profile_translator_type [String]
        #
        #   @param redirects_to_username [String] Handle x.com sends this profile's visitors to, such as the new handle of a renamed account whose old handle now holds a placeholder. Missing when x.com shows the profile itself.
        #
        #   @param super_follow_eligible [Boolean]
        #
        #   @param super_follows_user_profile_active [Boolean] Whether X marks the subscription profile as active.
        #
        #   @param tip_jar [XTwitterScraper::Models::UserTipJar] Public payment and creator-support handles shown on X.
        #
        #   @param listed_count [Integer] Public lists that include the profile.
        #
        #   @param fast_followers_count [Integer] Followers X counts as fast followers.
        #
        #   @param normal_followers_count [Integer] Followers minus fast followers.
        #
        #   @param default_profile [Boolean] Whether the profile keeps X's default theme.
        #
        #   @param default_profile_image [Boolean] Whether the profile keeps X's default avatar.
        #
        #   @param has_extended_profile [Boolean] Whether the profile filled X's extended fields, such as a birth date. True or false.
        #
        #   @param is_translation_enabled [Boolean] Whether the account turned on X's translation of its posts. True or false.
        #
        #   @param geo_enabled [Boolean] Whether the profile may add a location to posts.
        #
        #   @param advertiser_account_type [String] The account's X Ads type. `none` for an account without ads, or `promotable_user` for one that may run them.
        #
        #   @param advertiser_account_service_levels [Array<String>] X Ads services the account uses, such as `analytics`, `media_studio` or `smb`. Empty for an account without ads.
        #
        #   @param business_profile_state [String] Whether X treats the profile as a business profile. `none` or `enabled`.
        #
        #   @param subscribers_count [Integer] Accounts subscribed to the profile's paid Subscriptions. 0 when it has none.
        #
        #   @param verification_reason [XTwitterScraper::Models::Community::Creator::VerificationReason] X's text on why the profile is verified, with its links.
        #
        #   @param community_role [String] Community role when returned by community member reads
        #
        #   @param profile_bio [Hash{Symbol=>Object}] Structured profile bio with entity annotations

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
          #
          #   @param month [Integer]
          #
          #   @param year [Integer]
        end

        class VerificationReason < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute text
          #
          #   @return [String, nil]
          optional :text, String

          # @!attribute entities
          #   Links inside the text, by character range.
          #
          #   @return [Array<XTwitterScraper::Models::Community::Creator::VerificationReason::Entity>, nil]
          optional :entities, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Community::Creator::VerificationReason::Entity] }

          # @!method initialize(text: nil, entities: nil)
          #   X's text on why the profile is verified, with its links.
          #
          #   @param text [String]
          #
          #   @param entities [Array<XTwitterScraper::Models::Community::Creator::VerificationReason::Entity>] Links inside the text, by character range.

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

      module MembersFacepile
        extend XTwitterScraper::Internal::Type::Union

        variant -> { XTwitterScraper::Models::UserProfile }

        variant -> { XTwitterScraper::Models::CommunityMemberPreview }

        # @!method self.variants
        #   @return [Array(XTwitterScraper::Models::UserProfile, XTwitterScraper::Models::CommunityMemberPreview)]
      end
    end
  end
end
