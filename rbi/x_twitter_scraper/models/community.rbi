# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class Community < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::Community,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Unique community identifier
      sig { returns(String) }
      attr_accessor :id

      # Display name of the community
      sig { returns(String) }
      attr_accessor :name

      # About text for the community
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Total member count
      sig { returns(Integer) }
      attr_accessor :member_count

      # Total moderator count
      sig { returns(T.nilable(Integer)) }
      attr_reader :moderator_count

      sig { params(moderator_count: Integer).void }
      attr_writer :moderator_count

      # Whether the community is marked sensitive
      sig { returns(T::Boolean) }
      attr_accessor :is_nsfw

      # Primary topic. Its id is absent when X lists the community in a keyword or topic
      # result.
      sig do
        returns(T.nilable(XTwitterScraper::Models::Community::PrimaryTopic))
      end
      attr_reader :primary_topic

      sig do
        params(
          primary_topic:
            XTwitterScraper::Models::Community::PrimaryTopic::OrHash
        ).void
      end
      attr_writer :primary_topic

      # Community creation timestamp
      sig { returns(T.nilable(String)) }
      attr_reader :created_at

      sig { params(created_at: String).void }
      attr_writer :created_at

      # Join policy (open or restricted)
      sig { returns(T.nilable(String)) }
      attr_reader :join_policy

      sig { params(join_policy: String).void }
      attr_writer :join_policy

      # Invitation policy
      sig { returns(T.nilable(String)) }
      attr_reader :invites_policy

      sig { params(invites_policy: String).void }
      attr_writer :invites_policy

      # What the community asks a user who joins
      sig { returns(T.nilable(String)) }
      attr_reader :question

      sig { params(question: String).void }
      attr_writer :question

      # Community rules
      sig do
        returns(T.nilable(T::Array[XTwitterScraper::Models::Community::Rule]))
      end
      attr_reader :rules

      sig do
        params(
          rules: T::Array[XTwitterScraper::Models::Community::Rule::OrHash]
        ).void
      end
      attr_writer :rules

      # Tags X finds the community by
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :search_tags

      sig { params(search_tags: T::Array[String]).void }
      attr_writer :search_tags

      # The creator's public profile, or the ID, username and badge alone when X sends
      # no profile
      sig { returns(T.nilable(XTwitterScraper::Models::Community::Creator)) }
      attr_reader :creator

      sig do
        params(
          creator: XTwitterScraper::Models::Community::Creator::OrHash
        ).void
      end
      attr_writer :creator

      # Public X profile.
      sig { returns(T.nilable(XTwitterScraper::Models::UserProfile)) }
      attr_reader :admin

      sig { params(admin: XTwitterScraper::Models::UserProfile::OrHash).void }
      attr_writer :admin

      # The members X previews beside the member count. A keyword or topic result gives
      # each member's ID & picture only.
      sig do
        returns(
          T.nilable(
            T::Array[
              XTwitterScraper::Models::Community::MembersFacepile::Variants
            ]
          )
        )
      end
      attr_reader :members_facepile

      sig do
        params(
          members_facepile:
            T::Array[
              T.any(
                XTwitterScraper::Models::UserProfile::OrHash,
                XTwitterScraper::Models::CommunityMemberPreview::OrHash
              )
            ]
        ).void
      end
      attr_writer :members_facepile

      # Community banner image URL
      sig { returns(T.nilable(String)) }
      attr_reader :banner_url

      sig { params(banner_url: String).void }
      attr_writer :banner_url

      # The banner X shows for a community, with its size & colors.
      sig { returns(T.nilable(XTwitterScraper::Models::CommunityBanner)) }
      attr_reader :banner

      sig do
        params(banner: XTwitterScraper::Models::CommunityBanner::OrHash).void
      end
      attr_writer :banner

      sig do
        params(
          id: String,
          name: String,
          member_count: Integer,
          is_nsfw: T::Boolean,
          description: String,
          moderator_count: Integer,
          primary_topic:
            XTwitterScraper::Models::Community::PrimaryTopic::OrHash,
          created_at: String,
          join_policy: String,
          invites_policy: String,
          question: String,
          rules: T::Array[XTwitterScraper::Models::Community::Rule::OrHash],
          search_tags: T::Array[String],
          creator: XTwitterScraper::Models::Community::Creator::OrHash,
          admin: XTwitterScraper::Models::UserProfile::OrHash,
          members_facepile:
            T::Array[
              T.any(
                XTwitterScraper::Models::UserProfile::OrHash,
                XTwitterScraper::Models::CommunityMemberPreview::OrHash
              )
            ],
          banner_url: String,
          banner: XTwitterScraper::Models::CommunityBanner::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique community identifier
        id:,
        # Display name of the community
        name:,
        # Total member count
        member_count:,
        # Whether the community is marked sensitive
        is_nsfw:,
        # About text for the community
        description: nil,
        # Total moderator count
        moderator_count: nil,
        # Primary topic. Its id is absent when X lists the community in a keyword or topic
        # result.
        primary_topic: nil,
        # Community creation timestamp
        created_at: nil,
        # Join policy (open or restricted)
        join_policy: nil,
        # Invitation policy
        invites_policy: nil,
        # What the community asks a user who joins
        question: nil,
        # Community rules
        rules: nil,
        # Tags X finds the community by
        search_tags: nil,
        # The creator's public profile, or the ID, username and badge alone when X sends
        # no profile
        creator: nil,
        # Public X profile.
        admin: nil,
        # The members X previews beside the member count. A keyword or topic result gives
        # each member's ID & picture only.
        members_facepile: nil,
        # Community banner image URL
        banner_url: nil,
        # The banner X shows for a community, with its size & colors.
        banner: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            description: String,
            member_count: Integer,
            moderator_count: Integer,
            is_nsfw: T::Boolean,
            primary_topic: XTwitterScraper::Models::Community::PrimaryTopic,
            created_at: String,
            join_policy: String,
            invites_policy: String,
            question: String,
            rules: T::Array[XTwitterScraper::Models::Community::Rule],
            search_tags: T::Array[String],
            creator: XTwitterScraper::Models::Community::Creator,
            admin: XTwitterScraper::Models::UserProfile,
            members_facepile:
              T::Array[
                XTwitterScraper::Models::Community::MembersFacepile::Variants
              ],
            banner_url: String,
            banner: XTwitterScraper::Models::CommunityBanner
          }
        )
      end
      def to_hash
      end

      class PrimaryTopic < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Community::PrimaryTopic,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Topic ID that /x/communities/popular takes
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Topic name X shows on the community
        sig { returns(String) }
        attr_accessor :name

        sig { params(name: String, id: String).returns(T.attached_class) }
        def self.new(
          # Topic name X shows on the community
          name:,
          # Topic ID that /x/communities/popular takes
          id: nil
        )
        end

        sig { override.returns({ id: String, name: String }) }
        def to_hash
        end
      end

      class Rule < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Community::Rule,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Rule ID
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Rule title
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # What the rule asks of members
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig do
          params(id: String, name: String, description: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Rule ID
          id: nil,
          # Rule title
          name: nil,
          # What the rule asks of members
          description: nil
        )
        end

        sig do
          override.returns({ id: String, name: String, description: String })
        end
        def to_hash
        end
      end

      class Creator < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Community::Creator,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :username

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # Omitted when X sends no count, as for the account that first posted reused
        # media.
        sig { returns(T.nilable(Integer)) }
        attr_reader :followers

        sig { params(followers: Integer).void }
        attr_writer :followers

        sig { returns(T.nilable(Integer)) }
        attr_reader :following

        sig { params(following: Integer).void }
        attr_writer :following

        sig { returns(T::Boolean) }
        attr_accessor :verified

        # Whether X shows a blue verification badge
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_blue_verified

        sig { params(is_blue_verified: T::Boolean).void }
        attr_writer :is_blue_verified

        # Whether X marks the profile as verified
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_verified

        sig { params(is_verified: T::Boolean).void }
        attr_writer :is_verified

        # Profile picture at 48 px, as X sends it.
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

        sig { returns(T.nilable(String)) }
        attr_reader :cover_picture

        sig { params(cover_picture: String).void }
        attr_writer :cover_picture

        # Original X profile banner field when available
        sig { returns(T.nilable(String)) }
        attr_reader :profile_banner_url

        sig { params(profile_banner_url: String).void }
        attr_writer :profile_banner_url

        # Account owner's public profile location text
        sig { returns(T.nilable(String)) }
        attr_reader :location

        sig { params(location: String).void }
        attr_writer :location

        # Null when X shows no label.
        sig { returns(T.nilable(XTwitterScraper::Models::AccountBasedIn)) }
        attr_reader :account_based_in

        sig do
          params(
            account_based_in:
              T.nilable(XTwitterScraper::Models::AccountBasedIn::OrHash)
          ).void
        end
        attr_writer :account_based_in

        # True when X withheld accountBasedIn from this read. Retry later.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :account_based_in_unavailable

        sig { params(account_based_in_unavailable: T::Boolean).void }
        attr_writer :account_based_in_unavailable

        # False when X notes accountBasedIn may be inaccurate.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :account_based_in_accurate

        sig { params(account_based_in_accurate: T::Boolean).void }
        attr_writer :account_based_in_accurate

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

        # Handle of the organization X shows the account is affiliated with, from its
        # About page.
        sig { returns(T.nilable(String)) }
        attr_reader :affiliate_username

        sig { params(affiliate_username: String).void }
        attr_writer :affiliate_username

        # First email the account publishes on its profile, lowercased. Omitted when it
        # publishes none.
        sig { returns(T.nilable(String)) }
        attr_reader :email

        sig { params(email: String).void }
        attr_writer :email

        # Emails, phone numbers & links the account publishes on its own profile. Omitted
        # when it publishes none.
        sig { returns(T.nilable(XTwitterScraper::Models::ProfileContactInfo)) }
        attr_reader :contact_info

        sig do
          params(
            contact_info: XTwitterScraper::Models::ProfileContactInfo::OrHash
          ).void
        end
        attr_writer :contact_info

        # How often the account changed its username.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::Community::Creator::UsernameChanges
            )
          )
        end
        attr_reader :username_changes

        sig do
          params(
            username_changes:
              XTwitterScraper::Models::Community::Creator::UsernameChanges::OrHash
          ).void
        end
        attr_writer :username_changes

        # The parts of the birthday the account made public.
        sig do
          returns(
            T.nilable(XTwitterScraper::Models::Community::Creator::Birthdate)
          )
        end
        attr_reader :birthdate

        sig do
          params(
            birthdate:
              XTwitterScraper::Models::Community::Creator::Birthdate::OrHash
          ).void
        end
        attr_writer :birthdate

        # UTC repost time with includeRetweetTimestamp. Null when Xquik found no repost
        # time. Otherwise omitted.
        sig { returns(T.nilable(Time)) }
        attr_reader :retweeted_at

        sig { params(retweeted_at: T.nilable(Time)).void }
        attr_writer :retweeted_at

        # Account creation time.
        sig { returns(T.nilable(String)) }
        attr_reader :created_at

        sig { params(created_at: String).void }
        attr_writer :created_at

        sig { returns(T.nilable(Integer)) }
        attr_reader :statuses_count

        sig { params(statuses_count: Integer).void }
        attr_writer :statuses_count

        sig { returns(T.nilable(Integer)) }
        attr_reader :media_count

        sig { params(media_count: Integer).void }
        attr_writer :media_count

        # Whether the profile protects its posts
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :protected

        sig { params(protected: T::Boolean).void }
        attr_writer :protected

        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        sig { returns(T.nilable(Integer)) }
        attr_reader :favourites_count

        sig { params(favourites_count: Integer).void }
        attr_writer :favourites_count

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_custom_timelines

        sig { params(has_custom_timelines: T::Boolean).void }
        attr_writer :has_custom_timelines

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_translator

        sig { params(is_translator: T::Boolean).void }
        attr_writer :is_translator

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :withheld_in_countries

        sig { params(withheld_in_countries: T::Array[String]).void }
        attr_writer :withheld_in_countries

        # Whether X withholds a post or user
        sig { returns(T.nilable(String)) }
        attr_reader :withheld_scope

        sig { params(withheld_scope: String).void }
        attr_writer :withheld_scope

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :possibly_sensitive

        sig { params(possibly_sensitive: T::Boolean).void }
        attr_writer :possibly_sensitive

        # Professional metadata with category display settings
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :professional

        sig { params(professional: T::Hash[Symbol, T.anything]).void }
        attr_writer :professional

        # Public profile bio translation returned by X
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :grok_translated_bio

        sig { params(grok_translated_bio: T::Hash[Symbol, T.anything]).void }
        attr_writer :grok_translated_bio

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :pinned_tweet_ids

        sig { params(pinned_tweet_ids: T::Array[String]).void }
        attr_writer :pinned_tweet_ids

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_automated

        sig { params(is_automated: T::Boolean).void }
        attr_writer :is_automated

        sig { returns(T.nilable(String)) }
        attr_reader :automated_by

        sig { params(automated_by: String).void }
        attr_writer :automated_by

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :unavailable

        sig { params(unavailable: T::Boolean).void }
        attr_writer :unavailable

        sig { returns(T.nilable(String)) }
        attr_reader :unavailable_reason

        sig { params(unavailable_reason: String).void }
        attr_writer :unavailable_reason

        sig { returns(T.nilable(String)) }
        attr_reader :verified_type

        sig { params(verified_type: String).void }
        attr_writer :verified_type

        # Organization affiliation label shown on an X profile.
        sig { returns(T.nilable(XTwitterScraper::Models::UserAffiliateLabel)) }
        attr_reader :affiliates_highlighted_label

        sig do
          params(
            affiliates_highlighted_label:
              XTwitterScraper::Models::UserAffiliateLabel::OrHash
          ).void
        end
        attr_writer :affiliates_highlighted_label

        # Whole number from 0.
        sig { returns(T.nilable(Integer)) }
        attr_reader :business_account_affiliates_count

        sig { params(business_account_affiliates_count: Integer).void }
        attr_writer :business_account_affiliates_count

        # Whole number from 0.
        sig { returns(T.nilable(Integer)) }
        attr_reader :creator_subscriptions_count

        sig { params(creator_subscriptions_count: Integer).void }
        attr_writer :creator_subscriptions_count

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_graduated_access

        sig { params(has_graduated_access: T::Boolean).void }
        attr_writer :has_graduated_access

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_hidden_subscriptions_on_profile

        sig { params(has_hidden_subscriptions_on_profile: T::Boolean).void }
        attr_writer :has_hidden_subscriptions_on_profile

        # Profile highlight availability and count metadata.
        sig { returns(T.nilable(XTwitterScraper::Models::UserHighlightsInfo)) }
        attr_reader :highlights_info

        sig do
          params(
            highlights_info: XTwitterScraper::Models::UserHighlightsInfo::OrHash
          ).void
        end
        attr_writer :highlights_info

        # Identity verification X shows on the profile & its About page.
        sig do
          returns(T.nilable(XTwitterScraper::Models::UserIdentityVerification))
        end
        attr_reader :identity_verification

        sig do
          params(
            identity_verification:
              XTwitterScraper::Models::UserIdentityVerification::OrHash
          ).void
        end
        attr_writer :identity_verification

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_profile_translatable

        sig { params(is_profile_translatable: T::Boolean).void }
        attr_writer :is_profile_translatable

        sig { returns(T.nilable(String)) }
        attr_reader :parody_commentary_fan_label

        sig { params(parody_commentary_fan_label: String).void }
        attr_writer :parody_commentary_fan_label

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

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :profile_sort_enabled

        sig { params(profile_sort_enabled: T::Boolean).void }
        attr_writer :profile_sort_enabled

        sig { returns(T.nilable(String)) }
        attr_reader :profile_translator_type

        sig { params(profile_translator_type: String).void }
        attr_writer :profile_translator_type

        # Handle x.com sends this profile's visitors to, such as the new handle of a
        # renamed account whose old handle now holds a placeholder. Missing when x.com
        # shows the profile itself.
        sig { returns(T.nilable(String)) }
        attr_reader :redirects_to_username

        sig { params(redirects_to_username: String).void }
        attr_writer :redirects_to_username

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :super_follow_eligible

        sig { params(super_follow_eligible: T::Boolean).void }
        attr_writer :super_follow_eligible

        # Whether X marks the subscription profile as active.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :super_follows_user_profile_active

        sig { params(super_follows_user_profile_active: T::Boolean).void }
        attr_writer :super_follows_user_profile_active

        # Public payment and creator-support handles shown on X.
        sig { returns(T.nilable(XTwitterScraper::Models::UserTipJar)) }
        attr_reader :tip_jar

        sig do
          params(tip_jar: XTwitterScraper::Models::UserTipJar::OrHash).void
        end
        attr_writer :tip_jar

        # Public lists that include the profile.
        sig { returns(T.nilable(Integer)) }
        attr_reader :listed_count

        sig { params(listed_count: Integer).void }
        attr_writer :listed_count

        # Followers X counts as fast followers.
        sig { returns(T.nilable(Integer)) }
        attr_reader :fast_followers_count

        sig { params(fast_followers_count: Integer).void }
        attr_writer :fast_followers_count

        # Followers minus fast followers.
        sig { returns(T.nilable(Integer)) }
        attr_reader :normal_followers_count

        sig { params(normal_followers_count: Integer).void }
        attr_writer :normal_followers_count

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

        # Whether the profile filled X's extended fields, such as a birth date. True or
        # false.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_extended_profile

        sig { params(has_extended_profile: T::Boolean).void }
        attr_writer :has_extended_profile

        # Whether the account turned on X's translation of its posts. True or false.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_translation_enabled

        sig { params(is_translation_enabled: T::Boolean).void }
        attr_writer :is_translation_enabled

        # Whether the profile may add a location to posts.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :geo_enabled

        sig { params(geo_enabled: T::Boolean).void }
        attr_writer :geo_enabled

        # The account's X Ads type. `none` for an account without ads, or
        # `promotable_user` for one that may run them.
        sig { returns(T.nilable(String)) }
        attr_reader :advertiser_account_type

        sig { params(advertiser_account_type: String).void }
        attr_writer :advertiser_account_type

        # X Ads services the account uses, such as `analytics`, `media_studio` or `smb`.
        # Empty for an account without ads.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :advertiser_account_service_levels

        sig { params(advertiser_account_service_levels: T::Array[String]).void }
        attr_writer :advertiser_account_service_levels

        # Whether X treats the profile as a business profile. `none` or `enabled`.
        sig { returns(T.nilable(String)) }
        attr_reader :business_profile_state

        sig { params(business_profile_state: String).void }
        attr_writer :business_profile_state

        # Accounts subscribed to the profile's paid Subscriptions. 0 when it has none.
        sig { returns(T.nilable(Integer)) }
        attr_reader :subscribers_count

        sig { params(subscribers_count: Integer).void }
        attr_writer :subscribers_count

        # X's text on why the profile is verified, with its links.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::Community::Creator::VerificationReason
            )
          )
        end
        attr_reader :verification_reason

        sig do
          params(
            verification_reason:
              XTwitterScraper::Models::Community::Creator::VerificationReason::OrHash
          ).void
        end
        attr_writer :verification_reason

        # Community role when returned by community member reads
        sig { returns(T.nilable(String)) }
        attr_reader :community_role

        sig { params(community_role: String).void }
        attr_writer :community_role

        # Structured profile bio with entity annotations
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :profile_bio

        sig { params(profile_bio: T::Hash[Symbol, T.anything]).void }
        attr_writer :profile_bio

        sig do
          params(
            id: String,
            username: String,
            verified: T::Boolean,
            name: String,
            description: String,
            followers: Integer,
            following: Integer,
            is_blue_verified: T::Boolean,
            is_verified: T::Boolean,
            profile_picture: String,
            profile_picture_original: String,
            cover_picture: String,
            profile_banner_url: String,
            location: String,
            account_based_in:
              T.nilable(XTwitterScraper::Models::AccountBasedIn::OrHash),
            account_based_in_unavailable: T::Boolean,
            account_based_in_accurate: T::Boolean,
            connected_via: String,
            connected_via_accurate: T::Boolean,
            affiliate_username: String,
            email: String,
            contact_info: XTwitterScraper::Models::ProfileContactInfo::OrHash,
            username_changes:
              XTwitterScraper::Models::Community::Creator::UsernameChanges::OrHash,
            birthdate:
              XTwitterScraper::Models::Community::Creator::Birthdate::OrHash,
            retweeted_at: T.nilable(Time),
            created_at: String,
            statuses_count: Integer,
            media_count: Integer,
            protected: T::Boolean,
            url: String,
            favourites_count: Integer,
            has_custom_timelines: T::Boolean,
            is_translator: T::Boolean,
            withheld_in_countries: T::Array[String],
            withheld_scope: String,
            possibly_sensitive: T::Boolean,
            professional: T::Hash[Symbol, T.anything],
            grok_translated_bio: T::Hash[Symbol, T.anything],
            pinned_tweet_ids: T::Array[String],
            is_automated: T::Boolean,
            automated_by: String,
            unavailable: T::Boolean,
            unavailable_reason: String,
            verified_type: String,
            affiliates_highlighted_label:
              XTwitterScraper::Models::UserAffiliateLabel::OrHash,
            business_account_affiliates_count: Integer,
            creator_subscriptions_count: Integer,
            has_graduated_access: T::Boolean,
            has_hidden_subscriptions_on_profile: T::Boolean,
            highlights_info:
              XTwitterScraper::Models::UserHighlightsInfo::OrHash,
            identity_verification:
              XTwitterScraper::Models::UserIdentityVerification::OrHash,
            is_profile_translatable: T::Boolean,
            parody_commentary_fan_label: String,
            profile_description_language: String,
            profile_image_shape: String,
            profile_interstitial_type: String,
            profile_sort_enabled: T::Boolean,
            profile_translator_type: String,
            redirects_to_username: String,
            super_follow_eligible: T::Boolean,
            super_follows_user_profile_active: T::Boolean,
            tip_jar: XTwitterScraper::Models::UserTipJar::OrHash,
            listed_count: Integer,
            fast_followers_count: Integer,
            normal_followers_count: Integer,
            default_profile: T::Boolean,
            default_profile_image: T::Boolean,
            has_extended_profile: T::Boolean,
            is_translation_enabled: T::Boolean,
            geo_enabled: T::Boolean,
            advertiser_account_type: String,
            advertiser_account_service_levels: T::Array[String],
            business_profile_state: String,
            subscribers_count: Integer,
            verification_reason:
              XTwitterScraper::Models::Community::Creator::VerificationReason::OrHash,
            community_role: String,
            profile_bio: T::Hash[Symbol, T.anything]
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          username:,
          verified:,
          name: nil,
          description: nil,
          # Omitted when X sends no count, as for the account that first posted reused
          # media.
          followers: nil,
          following: nil,
          # Whether X shows a blue verification badge
          is_blue_verified: nil,
          # Whether X marks the profile as verified
          is_verified: nil,
          # Profile picture at 48 px, as X sends it.
          profile_picture: nil,
          # The same profile picture at full size, as the account uploaded it. Download this
          # one for the image.
          profile_picture_original: nil,
          cover_picture: nil,
          # Original X profile banner field when available
          profile_banner_url: nil,
          # Account owner's public profile location text
          location: nil,
          # Null when X shows no label.
          account_based_in: nil,
          # True when X withheld accountBasedIn from this read. Retry later.
          account_based_in_unavailable: nil,
          # False when X notes accountBasedIn may be inaccurate.
          account_based_in_accurate: nil,
          # How the account first connected to X.
          connected_via: nil,
          # False when X notes that country may be inaccurate.
          connected_via_accurate: nil,
          # Handle of the organization X shows the account is affiliated with, from its
          # About page.
          affiliate_username: nil,
          # First email the account publishes on its profile, lowercased. Omitted when it
          # publishes none.
          email: nil,
          # Emails, phone numbers & links the account publishes on its own profile. Omitted
          # when it publishes none.
          contact_info: nil,
          # How often the account changed its username.
          username_changes: nil,
          # The parts of the birthday the account made public.
          birthdate: nil,
          # UTC repost time with includeRetweetTimestamp. Null when Xquik found no repost
          # time. Otherwise omitted.
          retweeted_at: nil,
          # Account creation time.
          created_at: nil,
          statuses_count: nil,
          media_count: nil,
          # Whether the profile protects its posts
          protected: nil,
          url: nil,
          favourites_count: nil,
          has_custom_timelines: nil,
          is_translator: nil,
          withheld_in_countries: nil,
          # Whether X withholds a post or user
          withheld_scope: nil,
          possibly_sensitive: nil,
          # Professional metadata with category display settings
          professional: nil,
          # Public profile bio translation returned by X
          grok_translated_bio: nil,
          pinned_tweet_ids: nil,
          is_automated: nil,
          automated_by: nil,
          unavailable: nil,
          unavailable_reason: nil,
          verified_type: nil,
          # Organization affiliation label shown on an X profile.
          affiliates_highlighted_label: nil,
          # Whole number from 0.
          business_account_affiliates_count: nil,
          # Whole number from 0.
          creator_subscriptions_count: nil,
          has_graduated_access: nil,
          has_hidden_subscriptions_on_profile: nil,
          # Profile highlight availability and count metadata.
          highlights_info: nil,
          # Identity verification X shows on the profile & its About page.
          identity_verification: nil,
          is_profile_translatable: nil,
          parody_commentary_fan_label: nil,
          profile_description_language: nil,
          profile_image_shape: nil,
          profile_interstitial_type: nil,
          profile_sort_enabled: nil,
          profile_translator_type: nil,
          # Handle x.com sends this profile's visitors to, such as the new handle of a
          # renamed account whose old handle now holds a placeholder. Missing when x.com
          # shows the profile itself.
          redirects_to_username: nil,
          super_follow_eligible: nil,
          # Whether X marks the subscription profile as active.
          super_follows_user_profile_active: nil,
          # Public payment and creator-support handles shown on X.
          tip_jar: nil,
          # Public lists that include the profile.
          listed_count: nil,
          # Followers X counts as fast followers.
          fast_followers_count: nil,
          # Followers minus fast followers.
          normal_followers_count: nil,
          # Whether the profile keeps X's default theme.
          default_profile: nil,
          # Whether the profile keeps X's default avatar.
          default_profile_image: nil,
          # Whether the profile filled X's extended fields, such as a birth date. True or
          # false.
          has_extended_profile: nil,
          # Whether the account turned on X's translation of its posts. True or false.
          is_translation_enabled: nil,
          # Whether the profile may add a location to posts.
          geo_enabled: nil,
          # The account's X Ads type. `none` for an account without ads, or
          # `promotable_user` for one that may run them.
          advertiser_account_type: nil,
          # X Ads services the account uses, such as `analytics`, `media_studio` or `smb`.
          # Empty for an account without ads.
          advertiser_account_service_levels: nil,
          # Whether X treats the profile as a business profile. `none` or `enabled`.
          business_profile_state: nil,
          # Accounts subscribed to the profile's paid Subscriptions. 0 when it has none.
          subscribers_count: nil,
          # X's text on why the profile is verified, with its links.
          verification_reason: nil,
          # Community role when returned by community member reads
          community_role: nil,
          # Structured profile bio with entity annotations
          profile_bio: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              username: String,
              name: String,
              description: String,
              followers: Integer,
              following: Integer,
              verified: T::Boolean,
              is_blue_verified: T::Boolean,
              is_verified: T::Boolean,
              profile_picture: String,
              profile_picture_original: String,
              cover_picture: String,
              profile_banner_url: String,
              location: String,
              account_based_in: XTwitterScraper::Models::AccountBasedIn,
              account_based_in_unavailable: T::Boolean,
              account_based_in_accurate: T::Boolean,
              connected_via: String,
              connected_via_accurate: T::Boolean,
              affiliate_username: String,
              email: String,
              contact_info: XTwitterScraper::Models::ProfileContactInfo,
              username_changes:
                XTwitterScraper::Models::Community::Creator::UsernameChanges,
              birthdate: XTwitterScraper::Models::Community::Creator::Birthdate,
              retweeted_at: Time,
              created_at: String,
              statuses_count: Integer,
              media_count: Integer,
              protected: T::Boolean,
              url: String,
              favourites_count: Integer,
              has_custom_timelines: T::Boolean,
              is_translator: T::Boolean,
              withheld_in_countries: T::Array[String],
              withheld_scope: String,
              possibly_sensitive: T::Boolean,
              professional: T::Hash[Symbol, T.anything],
              grok_translated_bio: T::Hash[Symbol, T.anything],
              pinned_tweet_ids: T::Array[String],
              is_automated: T::Boolean,
              automated_by: String,
              unavailable: T::Boolean,
              unavailable_reason: String,
              verified_type: String,
              affiliates_highlighted_label:
                XTwitterScraper::Models::UserAffiliateLabel,
              business_account_affiliates_count: Integer,
              creator_subscriptions_count: Integer,
              has_graduated_access: T::Boolean,
              has_hidden_subscriptions_on_profile: T::Boolean,
              highlights_info: XTwitterScraper::Models::UserHighlightsInfo,
              identity_verification:
                XTwitterScraper::Models::UserIdentityVerification,
              is_profile_translatable: T::Boolean,
              parody_commentary_fan_label: String,
              profile_description_language: String,
              profile_image_shape: String,
              profile_interstitial_type: String,
              profile_sort_enabled: T::Boolean,
              profile_translator_type: String,
              redirects_to_username: String,
              super_follow_eligible: T::Boolean,
              super_follows_user_profile_active: T::Boolean,
              tip_jar: XTwitterScraper::Models::UserTipJar,
              listed_count: Integer,
              fast_followers_count: Integer,
              normal_followers_count: Integer,
              default_profile: T::Boolean,
              default_profile_image: T::Boolean,
              has_extended_profile: T::Boolean,
              is_translation_enabled: T::Boolean,
              geo_enabled: T::Boolean,
              advertiser_account_type: String,
              advertiser_account_service_levels: T::Array[String],
              business_profile_state: String,
              subscribers_count: Integer,
              verification_reason:
                XTwitterScraper::Models::Community::Creator::VerificationReason,
              community_role: String,
              profile_bio: T::Hash[Symbol, T.anything]
            }
          )
        end
        def to_hash
        end

        class UsernameChanges < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::Community::Creator::UsernameChanges,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Whole number from 0.
          sig { returns(Integer) }
          attr_accessor :count

          # Time of the latest change, omitted when there is none.
          sig { returns(T.nilable(Time)) }
          attr_reader :last_changed_at

          sig { params(last_changed_at: Time).void }
          attr_writer :last_changed_at

          sig do
            params(count: Integer, last_changed_at: Time).returns(
              T.attached_class
            )
          end
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

        class Birthdate < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::Community::Creator::Birthdate,
                XTwitterScraper::Internal::AnyHash
              )
            end

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

          sig do
            params(day: Integer, month: Integer, year: Integer).returns(
              T.attached_class
            )
          end
          def self.new(day: nil, month: nil, year: nil)
          end

          sig do
            override.returns({ day: Integer, month: Integer, year: Integer })
          end
          def to_hash
          end
        end

        class VerificationReason < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::Community::Creator::VerificationReason,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :text

          sig { params(text: String).void }
          attr_writer :text

          # Links inside the text, by character range.
          sig do
            returns(
              T.nilable(
                T::Array[
                  XTwitterScraper::Models::Community::Creator::VerificationReason::Entity
                ]
              )
            )
          end
          attr_reader :entities

          sig do
            params(
              entities:
                T::Array[
                  XTwitterScraper::Models::Community::Creator::VerificationReason::Entity::OrHash
                ]
            ).void
          end
          attr_writer :entities

          sig do
            params(
              text: String,
              entities:
                T::Array[
                  XTwitterScraper::Models::Community::Creator::VerificationReason::Entity::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            text: nil,
            # Links inside the text, by character range.
            entities: nil
          )
          end

          sig do
            override.returns(
              {
                text: String,
                entities:
                  T::Array[
                    XTwitterScraper::Models::Community::Creator::VerificationReason::Entity
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
                  XTwitterScraper::Models::Community::Creator::VerificationReason::Entity,
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

            sig { returns(T.nilable(String)) }
            attr_reader :url

            sig { params(url: String).void }
            attr_writer :url

            sig { returns(T.nilable(String)) }
            attr_reader :url_type

            sig { params(url_type: String).void }
            attr_writer :url_type

            sig do
              params(
                from_index: Integer,
                to_index: Integer,
                url: String,
                url_type: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Whole number from 0.
              from_index: nil,
              # Whole number from 0.
              to_index: nil,
              url: nil,
              url_type: nil
            )
            end

            sig do
              override.returns(
                {
                  from_index: Integer,
                  to_index: Integer,
                  url: String,
                  url_type: String
                }
              )
            end
            def to_hash
            end
          end
        end
      end

      module MembersFacepile
        extend XTwitterScraper::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::UserProfile,
              XTwitterScraper::Models::CommunityMemberPreview
            )
          end

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::Community::MembersFacepile::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
