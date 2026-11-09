# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class UserProfile < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::UserProfile,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :name

      sig { returns(String) }
      attr_accessor :username

      # Null when X shows no label.
      sig { returns(T.nilable(XTwitterScraper::AccountBasedIn)) }
      attr_accessor :account_based_in

      # False when X notes accountBasedIn may be inaccurate.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :account_based_in_accurate

      sig { params(account_based_in_accurate: T::Boolean).void }
      attr_writer :account_based_in_accurate

      # True when X withheld accountBasedIn from this read. Retry later.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :account_based_in_unavailable

      sig { params(account_based_in_unavailable: T::Boolean).void }
      attr_writer :account_based_in_unavailable

      # X Ads services the account uses, such as `analytics`, `media_studio` or `smb`.
      # Empty for an account without ads.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :advertiser_account_service_levels

      sig { params(advertiser_account_service_levels: T::Array[String]).void }
      attr_writer :advertiser_account_service_levels

      # The account's X Ads type. `none` for an account without ads, or
      # `promotable_user` for one that may run them.
      sig { returns(T.nilable(String)) }
      attr_reader :advertiser_account_type

      sig { params(advertiser_account_type: String).void }
      attr_writer :advertiser_account_type

      # Handle of the organization X shows the account is affiliated with, from its
      # About page.
      sig { returns(T.nilable(String)) }
      attr_reader :affiliate_username

      sig { params(affiliate_username: String).void }
      attr_writer :affiliate_username

      # Organization affiliation label shown on an X profile.
      sig do
        returns(
          T.nilable(XTwitterScraper::UserProfile::AffiliatesHighlightedLabel)
        )
      end
      attr_reader :affiliates_highlighted_label

      sig do
        params(
          affiliates_highlighted_label:
            XTwitterScraper::UserProfile::AffiliatesHighlightedLabel::OrHash
        ).void
      end
      attr_writer :affiliates_highlighted_label

      sig { returns(T.nilable(String)) }
      attr_reader :automated_by

      sig { params(automated_by: String).void }
      attr_writer :automated_by

      # The parts of the birthday the account made public.
      sig { returns(T.nilable(XTwitterScraper::UserProfile::Birthdate)) }
      attr_reader :birthdate

      sig { params(birthdate: XTwitterScraper::UserProfile::Birthdate::OrHash).void }
      attr_writer :birthdate

      sig { returns(T.nilable(Integer)) }
      attr_reader :business_account_affiliates_count

      sig { params(business_account_affiliates_count: Integer).void }
      attr_writer :business_account_affiliates_count

      # Whether X treats the profile as a business profile. `none` or `enabled`.
      sig { returns(T.nilable(String)) }
      attr_reader :business_profile_state

      sig { params(business_profile_state: String).void }
      attr_writer :business_profile_state

      # Community role when returned by community member reads
      sig { returns(T.nilable(String)) }
      attr_reader :community_role

      sig { params(community_role: String).void }
      attr_writer :community_role

      # How the account first connected to X.
      sig { returns(T.nilable(String)) }
      attr_reader :connected_via

      sig { params(connected_via: String).void }
      attr_writer :connected_via

      # False when X notes that country may be inaccurate.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :connected_via_accurate

      sig { params(connected_via_accurate: T::Boolean).void }
      attr_writer :connected_via_accurate

      sig { returns(T.nilable(XTwitterScraper::ProfileContactInfo)) }
      attr_reader :contact_info

      sig { params(contact_info: XTwitterScraper::ProfileContactInfo::OrHash).void }
      attr_writer :contact_info

      sig { returns(T.nilable(String)) }
      attr_reader :cover_picture

      sig { params(cover_picture: String).void }
      attr_writer :cover_picture

      sig { returns(T.nilable(String)) }
      attr_reader :created_at

      sig { params(created_at: String).void }
      attr_writer :created_at

      sig { returns(T.nilable(Integer)) }
      attr_reader :creator_subscriptions_count

      sig { params(creator_subscriptions_count: Integer).void }
      attr_writer :creator_subscriptions_count

      # Whether the profile keeps X's default theme.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :default_profile

      sig { params(default_profile: T::Boolean).void }
      attr_writer :default_profile

      # Whether the profile keeps X's default avatar.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :default_profile_image

      sig { params(default_profile_image: T::Boolean).void }
      attr_writer :default_profile_image

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # First email the account publishes on its profile, lowercased. Omitted when it
      # publishes none.
      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      # Followers X counts as fast followers.
      sig { returns(T.nilable(Integer)) }
      attr_reader :fast_followers_count

      sig { params(fast_followers_count: Integer).void }
      attr_writer :fast_followers_count

      sig { returns(T.nilable(Integer)) }
      attr_reader :favourites_count

      sig { params(favourites_count: Integer).void }
      attr_writer :favourites_count

      sig { returns(T.nilable(Integer)) }
      attr_reader :followers

      sig { params(followers: Integer).void }
      attr_writer :followers

      sig { returns(T.nilable(Integer)) }
      attr_reader :following

      sig { params(following: Integer).void }
      attr_writer :following

      # Whether the profile may add a location to posts.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :geo_enabled

      sig { params(geo_enabled: T::Boolean).void }
      attr_writer :geo_enabled

      # Public profile bio translation returned by X
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :grok_translated_bio

      sig { params(grok_translated_bio: T::Hash[Symbol, T.anything]).void }
      attr_writer :grok_translated_bio

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_custom_timelines

      sig { params(has_custom_timelines: T::Boolean).void }
      attr_writer :has_custom_timelines

      # Whether the profile filled X's extended fields, such as a birth date. True or
      # false.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_extended_profile

      sig { params(has_extended_profile: T::Boolean).void }
      attr_writer :has_extended_profile

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_graduated_access

      sig { params(has_graduated_access: T::Boolean).void }
      attr_writer :has_graduated_access

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_hidden_subscriptions_on_profile

      sig { params(has_hidden_subscriptions_on_profile: T::Boolean).void }
      attr_writer :has_hidden_subscriptions_on_profile

      # Profile highlight availability and count metadata.
      sig { returns(T.nilable(XTwitterScraper::UserProfile::HighlightsInfo)) }
      attr_reader :highlights_info

      sig do
        params(
          highlights_info: XTwitterScraper::UserProfile::HighlightsInfo::OrHash
        ).void
      end
      attr_writer :highlights_info

      # Identity verification metadata displayed by X.
      sig do
        returns(T.nilable(XTwitterScraper::UserProfile::IdentityVerification))
      end
      attr_reader :identity_verification

      sig do
        params(
          identity_verification:
            XTwitterScraper::UserProfile::IdentityVerification::OrHash
        ).void
      end
      attr_writer :identity_verification

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_automated

      sig { params(is_automated: T::Boolean).void }
      attr_writer :is_automated

      # Whether X shows a blue verification badge
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_blue_verified

      sig { params(is_blue_verified: T::Boolean).void }
      attr_writer :is_blue_verified

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_profile_translatable

      sig { params(is_profile_translatable: T::Boolean).void }
      attr_writer :is_profile_translatable

      # Whether the account turned on X's translation of its posts. True or false.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_translation_enabled

      sig { params(is_translation_enabled: T::Boolean).void }
      attr_writer :is_translation_enabled

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_translator

      sig { params(is_translator: T::Boolean).void }
      attr_writer :is_translator

      # Whether X marks the profile as verified
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_verified

      sig { params(is_verified: T::Boolean).void }
      attr_writer :is_verified

      # Public lists that include the profile.
      sig { returns(T.nilable(Integer)) }
      attr_reader :listed_count

      sig { params(listed_count: Integer).void }
      attr_writer :listed_count

      sig { returns(T.nilable(String)) }
      attr_reader :location

      sig { params(location: String).void }
      attr_writer :location

      sig { returns(T.nilable(Integer)) }
      attr_reader :media_count

      sig { params(media_count: Integer).void }
      attr_writer :media_count

      # Followers minus fast followers.
      sig { returns(T.nilable(Integer)) }
      attr_reader :normal_followers_count

      sig { params(normal_followers_count: Integer).void }
      attr_writer :normal_followers_count

      sig { returns(T.nilable(String)) }
      attr_reader :parody_commentary_fan_label

      sig { params(parody_commentary_fan_label: String).void }
      attr_writer :parody_commentary_fan_label

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :pinned_tweet_ids

      sig { params(pinned_tweet_ids: T::Array[String]).void }
      attr_writer :pinned_tweet_ids

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :possibly_sensitive

      sig { params(possibly_sensitive: T::Boolean).void }
      attr_writer :possibly_sensitive

      # Professional metadata with category display settings
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :professional

      sig { params(professional: T::Hash[Symbol, T.anything]).void }
      attr_writer :professional

      # Structured profile bio with entity annotations
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :profile_bio

      sig { params(profile_bio: T::Hash[Symbol, T.anything]).void }
      attr_writer :profile_bio

      # Original X profile banner field when available
      sig { returns(T.nilable(String)) }
      attr_reader :profile_banner_url

      sig { params(profile_banner_url: String).void }
      attr_writer :profile_banner_url

      sig { returns(T.nilable(String)) }
      attr_reader :profile_description_language

      sig { params(profile_description_language: String).void }
      attr_writer :profile_description_language

      sig { returns(T.nilable(String)) }
      attr_reader :profile_image_shape

      sig { params(profile_image_shape: String).void }
      attr_writer :profile_image_shape

      sig { returns(T.nilable(String)) }
      attr_reader :profile_interstitial_type

      sig { params(profile_interstitial_type: String).void }
      attr_writer :profile_interstitial_type

      sig { returns(T.nilable(String)) }
      attr_reader :profile_picture

      sig { params(profile_picture: String).void }
      attr_writer :profile_picture

      # The same profile picture at full size, as the account uploaded it. Download this
      # one for the image.
      sig { returns(T.nilable(String)) }
      attr_reader :profile_picture_original

      sig { params(profile_picture_original: String).void }
      attr_writer :profile_picture_original

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :profile_sort_enabled

      sig { params(profile_sort_enabled: T::Boolean).void }
      attr_writer :profile_sort_enabled

      sig { returns(T.nilable(String)) }
      attr_reader :profile_translator_type

      sig { params(profile_translator_type: String).void }
      attr_writer :profile_translator_type

      # Whether the profile protects its posts
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :protected

      sig { params(protected: T::Boolean).void }
      attr_writer :protected

      # Handle x.com sends this profile's visitors to, such as the new handle of a
      # renamed account whose old handle now holds a placeholder. Missing when x.com
      # shows the profile itself.
      sig { returns(T.nilable(String)) }
      attr_reader :redirects_to_username

      sig { params(redirects_to_username: String).void }
      attr_writer :redirects_to_username

      # UTC repost time with includeRetweetTimestamp. Null when Xquik found no repost
      # time. Otherwise omitted.
      sig { returns(T.nilable(Time)) }
      attr_accessor :retweeted_at

      sig { returns(T.nilable(Integer)) }
      attr_reader :statuses_count

      sig { params(statuses_count: Integer).void }
      attr_writer :statuses_count

      # Accounts subscribed to the profile's paid Subscriptions. 0 when it has none.
      sig { returns(T.nilable(Integer)) }
      attr_reader :subscribers_count

      sig { params(subscribers_count: Integer).void }
      attr_writer :subscribers_count

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :super_follow_eligible

      sig { params(super_follow_eligible: T::Boolean).void }
      attr_writer :super_follow_eligible

      # Whether X marks the subscription profile as active.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :super_follows_user_profile_active

      sig { params(super_follows_user_profile_active: T::Boolean).void }
      attr_writer :super_follows_user_profile_active

      sig { returns(T.nilable(XTwitterScraper::UserTipJar)) }
      attr_reader :tip_jar

      sig { params(tip_jar: XTwitterScraper::UserTipJar::OrHash).void }
      attr_writer :tip_jar

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :unavailable

      sig { params(unavailable: T::Boolean).void }
      attr_writer :unavailable

      sig { returns(T.nilable(String)) }
      attr_reader :unavailable_reason

      sig { params(unavailable_reason: String).void }
      attr_writer :unavailable_reason

      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      # How often the account changed its username.
      sig { returns(T.nilable(XTwitterScraper::UserProfile::UsernameChanges)) }
      attr_reader :username_changes

      sig { params(username_changes: XTwitterScraper::UserProfile::UsernameChanges::OrHash).void }
      attr_writer :username_changes

      # X's text on why the profile is verified, with its links.
      sig { returns(T.nilable(XTwitterScraper::UserProfile::VerificationReason)) }
      attr_reader :verification_reason

      sig { params(verification_reason: XTwitterScraper::UserProfile::VerificationReason::OrHash).void }
      attr_writer :verification_reason

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :verified

      sig { params(verified: T::Boolean).void }
      attr_writer :verified

      sig { returns(T.nilable(String)) }
      attr_reader :verified_type

      sig { params(verified_type: String).void }
      attr_writer :verified_type

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :withheld_in_countries

      sig { params(withheld_in_countries: T::Array[String]).void }
      attr_writer :withheld_in_countries

      # Whether X withholds a post or user
      sig { returns(T.nilable(String)) }
      attr_reader :withheld_scope

      sig { params(withheld_scope: String).void }
      attr_writer :withheld_scope

      # X user profile with bio, follower counts, and verification status.
      sig do
        params(
          id: String,
          name: String,
          username: String,
          account_based_in: T.nilable(XTwitterScraper::AccountBasedIn::OrHash), account_based_in_accurate: T::Boolean, account_based_in_unavailable: T::Boolean, advertiser_account_service_levels: T::Array[String], advertiser_account_type: String, affiliate_username: String, affiliates_highlighted_label:
            XTwitterScraper::UserProfile::AffiliatesHighlightedLabel::OrHash,
          automated_by: String,
          birthdate: XTwitterScraper::UserProfile::Birthdate::OrHash, business_account_affiliates_count: Integer,
          business_profile_state: String, community_role: String,
          connected_via: String, connected_via_accurate: T::Boolean, contact_info: XTwitterScraper::ProfileContactInfo::OrHash, cover_picture: String,
          created_at: String,
          creator_subscriptions_count: Integer,
          default_profile: T::Boolean, default_profile_image: T::Boolean, description: String,
          email: String, fast_followers_count: Integer, favourites_count: Integer,
          followers: Integer,
          following: Integer,
          geo_enabled: T::Boolean, grok_translated_bio: T::Hash[Symbol, T.anything], has_custom_timelines: T::Boolean,
          has_extended_profile: T::Boolean, has_graduated_access: T::Boolean,
          has_hidden_subscriptions_on_profile: T::Boolean,
          highlights_info: XTwitterScraper::UserProfile::HighlightsInfo::OrHash,
          identity_verification:
            XTwitterScraper::UserProfile::IdentityVerification::OrHash,
          is_automated: T::Boolean,
          is_blue_verified: T::Boolean,
          is_profile_translatable: T::Boolean,
          is_translation_enabled: T::Boolean, is_translator: T::Boolean,
          is_verified: T::Boolean,
          listed_count: Integer, location: String,
          media_count: Integer,
          normal_followers_count: Integer, parody_commentary_fan_label: String,
          pinned_tweet_ids: T::Array[String],
          possibly_sensitive: T::Boolean,
          professional: T::Hash[Symbol, T.anything], profile_bio: T::Hash[Symbol, T.anything],
          profile_banner_url: String,
          profile_description_language: String,
          profile_image_shape: String,
          profile_interstitial_type: String,
          profile_picture: String,
          profile_picture_original: String, profile_sort_enabled: T::Boolean,
          profile_translator_type: String,
          protected: T::Boolean,
          redirects_to_username: String, retweeted_at: T.nilable(Time), statuses_count: Integer,
          subscribers_count: Integer, super_follow_eligible: T::Boolean,
          super_follows_user_profile_active: T::Boolean, tip_jar: XTwitterScraper::UserTipJar::OrHash, unavailable: T::Boolean,
          unavailable_reason: String,
          url: String,
          username_changes: XTwitterScraper::UserProfile::UsernameChanges::OrHash, verification_reason: XTwitterScraper::UserProfile::VerificationReason::OrHash, verified: T::Boolean,
          verified_type: String,
          withheld_in_countries: T::Array[String], withheld_scope: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        name:,
        username:,
# Null when X shows no label.
account_based_in: nil,
# False when X notes accountBasedIn may be inaccurate.
account_based_in_accurate: nil,
# True when X withheld accountBasedIn from this read. Retry later.
account_based_in_unavailable: nil,
# X Ads services the account uses, such as `analytics`, `media_studio` or `smb`.
# Empty for an account without ads.
advertiser_account_service_levels: nil,
# The account's X Ads type. `none` for an account without ads, or
# `promotable_user` for one that may run them.
advertiser_account_type: nil,
# Handle of the organization X shows the account is affiliated with, from its
# About page.
affiliate_username: nil,
        # Organization affiliation label shown on an X profile.
        affiliates_highlighted_label: nil,
        automated_by: nil,
# The parts of the birthday the account made public.
birthdate: nil,
        business_account_affiliates_count: nil,
# Whether X treats the profile as a business profile. `none` or `enabled`.
business_profile_state: nil,
        # Community role when returned by community member reads
        community_role: nil,
# How the account first connected to X.
connected_via: nil,
# False when X notes that country may be inaccurate.
connected_via_accurate: nil,
contact_info: nil,
        cover_picture: nil,
        created_at: nil,
        creator_subscriptions_count: nil,
# Whether the profile keeps X's default theme.
default_profile: nil,
# Whether the profile keeps X's default avatar.
default_profile_image: nil,
        description: nil,
# First email the account publishes on its profile, lowercased. Omitted when it
# publishes none.
email: nil,
# Followers X counts as fast followers.
fast_followers_count: nil,
        favourites_count: nil,
        followers: nil,
        following: nil,
# Whether the profile may add a location to posts.
geo_enabled: nil,
# Public profile bio translation returned by X
grok_translated_bio: nil,
        has_custom_timelines: nil,
# Whether the profile filled X's extended fields, such as a birth date. True or
# false.
has_extended_profile: nil,
        has_graduated_access: nil,
        has_hidden_subscriptions_on_profile: nil,
        # Profile highlight availability and count metadata.
        highlights_info: nil,
        # Identity verification metadata displayed by X.
        identity_verification: nil,
        is_automated: nil,
        # Whether X shows a blue verification badge
        is_blue_verified: nil,
        is_profile_translatable: nil,
# Whether the account turned on X's translation of its posts. True or false.
is_translation_enabled: nil,
        is_translator: nil,
        # Whether X marks the profile as verified
        is_verified: nil,
# Public lists that include the profile.
listed_count: nil,
        location: nil,
        media_count: nil,
# Followers minus fast followers.
normal_followers_count: nil,
        parody_commentary_fan_label: nil,
        pinned_tweet_ids: nil,
        possibly_sensitive: nil,
# Professional metadata with category display settings
professional: nil,
        # Structured profile bio with entity annotations
        profile_bio: nil,
        # Original X profile banner field when available
        profile_banner_url: nil,
        profile_description_language: nil,
        profile_image_shape: nil,
        profile_interstitial_type: nil,
        profile_picture: nil,
# The same profile picture at full size, as the account uploaded it. Download this
# one for the image.
profile_picture_original: nil,
        profile_sort_enabled: nil,
        profile_translator_type: nil,
        # Whether the profile protects its posts
        protected: nil,
# Handle x.com sends this profile's visitors to, such as the new handle of a
# renamed account whose old handle now holds a placeholder. Missing when x.com
# shows the profile itself.
redirects_to_username: nil,
# UTC repost time with includeRetweetTimestamp. Null when Xquik found no repost
# time. Otherwise omitted.
retweeted_at: nil,
        statuses_count: nil,
# Accounts subscribed to the profile's paid Subscriptions. 0 when it has none.
subscribers_count: nil,
        super_follow_eligible: nil,
# Whether X marks the subscription profile as active.
super_follows_user_profile_active: nil,
tip_jar: nil,
        unavailable: nil,
        unavailable_reason: nil,
        url: nil,
# How often the account changed its username.
username_changes: nil,
# X's text on why the profile is verified, with its links.
verification_reason: nil,
        verified: nil,
        verified_type: nil,
        withheld_in_countries: nil,
# Whether X withholds a post or user
withheld_scope: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            username: String,
            account_based_in: T.nilable(XTwitterScraper::AccountBasedIn), account_based_in_accurate: T::Boolean, account_based_in_unavailable: T::Boolean, advertiser_account_service_levels: T::Array[String], advertiser_account_type: String, affiliate_username: String, affiliates_highlighted_label:
              XTwitterScraper::UserProfile::AffiliatesHighlightedLabel,
            automated_by: String,
            birthdate: XTwitterScraper::UserProfile::Birthdate, business_account_affiliates_count: Integer,
            business_profile_state: String, community_role: String,
            connected_via: String, connected_via_accurate: T::Boolean, contact_info: XTwitterScraper::ProfileContactInfo, cover_picture: String,
            created_at: String,
            creator_subscriptions_count: Integer,
            default_profile: T::Boolean, default_profile_image: T::Boolean, description: String,
            email: String, fast_followers_count: Integer, favourites_count: Integer,
            followers: Integer,
            following: Integer,
            geo_enabled: T::Boolean, grok_translated_bio: T::Hash[Symbol, T.anything], has_custom_timelines: T::Boolean,
            has_extended_profile: T::Boolean, has_graduated_access: T::Boolean,
            has_hidden_subscriptions_on_profile: T::Boolean,
            highlights_info: XTwitterScraper::UserProfile::HighlightsInfo,
            identity_verification:
              XTwitterScraper::UserProfile::IdentityVerification,
            is_automated: T::Boolean,
            is_blue_verified: T::Boolean,
            is_profile_translatable: T::Boolean,
            is_translation_enabled: T::Boolean, is_translator: T::Boolean,
            is_verified: T::Boolean,
            listed_count: Integer, location: String,
            media_count: Integer,
            normal_followers_count: Integer, parody_commentary_fan_label: String,
            pinned_tweet_ids: T::Array[String],
            possibly_sensitive: T::Boolean,
            professional: T::Hash[Symbol, T.anything], profile_bio: T::Hash[Symbol, T.anything],
            profile_banner_url: String,
            profile_description_language: String,
            profile_image_shape: String,
            profile_interstitial_type: String,
            profile_picture: String,
            profile_picture_original: String, profile_sort_enabled: T::Boolean,
            profile_translator_type: String,
            protected: T::Boolean,
            redirects_to_username: String, retweeted_at: T.nilable(Time), statuses_count: Integer,
            subscribers_count: Integer, super_follow_eligible: T::Boolean,
            super_follows_user_profile_active: T::Boolean, tip_jar: XTwitterScraper::UserTipJar, unavailable: T::Boolean,
            unavailable_reason: String,
            url: String,
            username_changes: XTwitterScraper::UserProfile::UsernameChanges, verification_reason: XTwitterScraper::UserProfile::VerificationReason, verified: T::Boolean,
            verified_type: String,
            withheld_in_countries: T::Array[String], withheld_scope: String
          }
        )
      end
      def to_hash
      end

      class AffiliatesHighlightedLabel < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::UserProfile::AffiliatesHighlightedLabel,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :badge_url

        sig { params(badge_url: String).void }
        attr_writer :badge_url

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        sig { returns(T.nilable(String)) }
        attr_reader :url_type

        sig { params(url_type: String).void }
        attr_writer :url_type

        sig { returns(T.nilable(String)) }
        attr_reader :user_label_display_type

        sig { params(user_label_display_type: String).void }
        attr_writer :user_label_display_type

        sig { returns(T.nilable(String)) }
        attr_reader :user_label_type

        sig { params(user_label_type: String).void }
        attr_writer :user_label_type

        # Organization affiliation label shown on an X profile.
        sig do
          params(
            badge_url: String,
            description: String,
            url: String,
            url_type: String,
            user_label_display_type: String,
            user_label_type: String
          ).returns(T.attached_class)
        end
        def self.new(
          badge_url: nil,
          description: nil,
          url: nil,
          url_type: nil,
          user_label_display_type: nil,
          user_label_type: nil
        )
        end

        sig do
          override.returns(
            {
              badge_url: String,
              description: String,
              url: String,
              url_type: String,
              user_label_display_type: String,
              user_label_type: String
            }
          )
        end
        def to_hash
        end
      end

      class HighlightsInfo < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::UserProfile::HighlightsInfo,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :can_highlight_tweets

        sig { params(can_highlight_tweets: T::Boolean).void }
        attr_writer :can_highlight_tweets

        sig { returns(T.nilable(String)) }
        attr_reader :highlighted_tweets

        sig { params(highlighted_tweets: String).void }
        attr_writer :highlighted_tweets

        # Profile highlight availability and count metadata.
        sig do
          params(
            can_highlight_tweets: T::Boolean,
            highlighted_tweets: String
          ).returns(T.attached_class)
        end
        def self.new(can_highlight_tweets: nil, highlighted_tweets: nil)
        end

        sig do
          override.returns(
            { can_highlight_tweets: T::Boolean, highlighted_tweets: String }
          )
        end
        def to_hash
        end
      end

      class IdentityVerification < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::UserProfile::IdentityVerification,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_identity_verified

        sig { params(is_identity_verified: T::Boolean).void }
        attr_writer :is_identity_verified

        sig { returns(T.nilable(String)) }
        attr_reader :verified_since_msec

        sig { params(verified_since_msec: String).void }
        attr_writer :verified_since_msec

        # Identity verification metadata displayed by X.
        sig do
          params(
            description: String,
            is_identity_verified: T::Boolean,
            verified_since_msec: String
          ).returns(T.attached_class)
        end
        def self.new(
          description: nil,
          is_identity_verified: nil,
          verified_since_msec: nil
        )
        end

        sig do
          override.returns(
            {
              description: String,
              is_identity_verified: T::Boolean,
              verified_since_msec: String
            }
          )
        end
        def to_hash
        end
      end

      class Birthdate < XTwitterScraper::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(XTwitterScraper::UserProfile::Birthdate, XTwitterScraper::Internal::AnyHash) }

        sig { returns(T.nilable(Integer)) }
        attr_reader :day

        sig { params(day: Integer).void }
        attr_writer :day

        sig { returns(T.nilable(Integer)) }
        attr_reader :month

        sig { params(month: Integer).void }
        attr_writer :month

        sig { returns(T.nilable(Integer)) }
        attr_reader :year

        sig { params(year: Integer).void }
        attr_writer :year

        # The parts of the birthday the account made public.
        sig { params(day: Integer, month: Integer, year: Integer).returns(T.attached_class) }
        def self.new(
          day: nil,
          month: nil,
          year: nil
        )
        end

        sig { override.returns({ day: Integer, month: Integer, year: Integer }) }
        def to_hash
        end
      end

      class UsernameChanges < XTwitterScraper::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(XTwitterScraper::UserProfile::UsernameChanges, XTwitterScraper::Internal::AnyHash) }

        # Whole number from 0.
        sig { returns(Integer) }
        attr_accessor :count

        # Time of the latest change, omitted when there is none.
        sig { returns(T.nilable(Time)) }
        attr_reader :last_changed_at

        sig { params(last_changed_at: Time).void }
        attr_writer :last_changed_at

        # How often the account changed its username.
        sig { params(count: Integer, last_changed_at: Time).returns(T.attached_class) }
        def self.new(
          # Whole number from 0.
          count:,
          # Time of the latest change, omitted when there is none.
          last_changed_at: nil
        )
        end

        sig { override.returns({ count: Integer, last_changed_at: Time }) }
        def to_hash
        end
      end

      class VerificationReason < XTwitterScraper::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(XTwitterScraper::UserProfile::VerificationReason, XTwitterScraper::Internal::AnyHash) }

        sig { returns(T.nilable(String)) }
        attr_reader :text

        sig { params(text: String).void }
        attr_writer :text

        # Links inside the text, by character range.
        sig { returns(T.nilable(T::Array[XTwitterScraper::UserProfile::VerificationReason::Entity])) }
        attr_reader :entities

        sig { params(entities: T::Array[XTwitterScraper::UserProfile::VerificationReason::Entity::OrHash]).void }
        attr_writer :entities

        # X's text on why the profile is verified, with its links.
        sig { params(text: String, entities: T::Array[XTwitterScraper::UserProfile::VerificationReason::Entity::OrHash]).returns(T.attached_class) }
        def self.new(
          text: nil,
          # Links inside the text, by character range.
          entities: nil
        )
        end

        sig { override.returns({ text: String, entities: T::Array[XTwitterScraper::UserProfile::VerificationReason::Entity] }) }
        def to_hash
        end

        class Entity < XTwitterScraper::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(XTwitterScraper::UserProfile::VerificationReason::Entity, XTwitterScraper::Internal::AnyHash) }

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

          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          sig { returns(T.nilable(String)) }
          attr_reader :url_type

          sig { params(url_type: String).void }
          attr_writer :url_type

          sig { params(from_index: Integer, to_index: Integer, url: String, url_type: String).returns(T.attached_class) }
          def self.new(
            # Whole number from 0.
            from_index: nil,
            # Whole number from 0.
            to_index: nil,
            url: nil,
            url_type: nil
          )
          end

          sig { override.returns({ from_index: Integer, to_index: Integer, url: String, url_type: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
