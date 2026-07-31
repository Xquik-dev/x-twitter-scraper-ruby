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

      sig { returns(T.nilable(Integer)) }
      attr_reader :business_account_affiliates_count

      sig { params(business_account_affiliates_count: Integer).void }
      attr_writer :business_account_affiliates_count

      # Community role when returned by community member reads
      sig { returns(T.nilable(String)) }
      attr_reader :community_role

      sig { params(community_role: String).void }
      attr_writer :community_role

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

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

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

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_custom_timelines

      sig { params(has_custom_timelines: T::Boolean).void }
      attr_writer :has_custom_timelines

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

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_translator

      sig { params(is_translator: T::Boolean).void }
      attr_writer :is_translator

      # Whether X marks the profile as verified
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_verified

      sig { params(is_verified: T::Boolean).void }
      attr_writer :is_verified

      sig { returns(T.nilable(String)) }
      attr_reader :location

      sig { params(location: String).void }
      attr_writer :location

      sig { returns(T.nilable(Integer)) }
      attr_reader :media_count

      sig { params(media_count: Integer).void }
      attr_writer :media_count

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

      sig { returns(T.nilable(Integer)) }
      attr_reader :statuses_count

      sig { params(statuses_count: Integer).void }
      attr_writer :statuses_count

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :super_follow_eligible

      sig { params(super_follow_eligible: T::Boolean).void }
      attr_writer :super_follow_eligible

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

      # X user profile with bio, follower counts, and verification status.
      sig do
        params(
          id: String,
          name: String,
          username: String,
          affiliates_highlighted_label:
            XTwitterScraper::UserProfile::AffiliatesHighlightedLabel::OrHash,
          automated_by: String,
          business_account_affiliates_count: Integer,
          community_role: String,
          cover_picture: String,
          created_at: String,
          creator_subscriptions_count: Integer,
          description: String,
          favourites_count: Integer,
          followers: Integer,
          following: Integer,
          has_custom_timelines: T::Boolean,
          has_graduated_access: T::Boolean,
          has_hidden_subscriptions_on_profile: T::Boolean,
          highlights_info: XTwitterScraper::UserProfile::HighlightsInfo::OrHash,
          identity_verification:
            XTwitterScraper::UserProfile::IdentityVerification::OrHash,
          is_automated: T::Boolean,
          is_blue_verified: T::Boolean,
          is_profile_translatable: T::Boolean,
          is_translator: T::Boolean,
          is_verified: T::Boolean,
          location: String,
          media_count: Integer,
          parody_commentary_fan_label: String,
          pinned_tweet_ids: T::Array[String],
          possibly_sensitive: T::Boolean,
          profile_bio: T::Hash[Symbol, T.anything],
          profile_banner_url: String,
          profile_description_language: String,
          profile_image_shape: String,
          profile_interstitial_type: String,
          profile_picture: String,
          profile_sort_enabled: T::Boolean,
          profile_translator_type: String,
          protected: T::Boolean,
          statuses_count: Integer,
          super_follow_eligible: T::Boolean,
          unavailable: T::Boolean,
          unavailable_reason: String,
          url: String,
          verified: T::Boolean,
          verified_type: String,
          withheld_in_countries: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        name:,
        username:,
        # Organization affiliation label shown on an X profile.
        affiliates_highlighted_label: nil,
        automated_by: nil,
        business_account_affiliates_count: nil,
        # Community role when returned by community member reads
        community_role: nil,
        cover_picture: nil,
        created_at: nil,
        creator_subscriptions_count: nil,
        description: nil,
        favourites_count: nil,
        followers: nil,
        following: nil,
        has_custom_timelines: nil,
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
        is_translator: nil,
        # Whether X marks the profile as verified
        is_verified: nil,
        location: nil,
        media_count: nil,
        parody_commentary_fan_label: nil,
        pinned_tweet_ids: nil,
        possibly_sensitive: nil,
        # Structured profile bio with entity annotations
        profile_bio: nil,
        # Original X profile banner field when available
        profile_banner_url: nil,
        profile_description_language: nil,
        profile_image_shape: nil,
        profile_interstitial_type: nil,
        profile_picture: nil,
        profile_sort_enabled: nil,
        profile_translator_type: nil,
        # Whether the profile protects its posts
        protected: nil,
        statuses_count: nil,
        super_follow_eligible: nil,
        unavailable: nil,
        unavailable_reason: nil,
        url: nil,
        verified: nil,
        verified_type: nil,
        withheld_in_countries: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            username: String,
            affiliates_highlighted_label:
              XTwitterScraper::UserProfile::AffiliatesHighlightedLabel,
            automated_by: String,
            business_account_affiliates_count: Integer,
            community_role: String,
            cover_picture: String,
            created_at: String,
            creator_subscriptions_count: Integer,
            description: String,
            favourites_count: Integer,
            followers: Integer,
            following: Integer,
            has_custom_timelines: T::Boolean,
            has_graduated_access: T::Boolean,
            has_hidden_subscriptions_on_profile: T::Boolean,
            highlights_info: XTwitterScraper::UserProfile::HighlightsInfo,
            identity_verification:
              XTwitterScraper::UserProfile::IdentityVerification,
            is_automated: T::Boolean,
            is_blue_verified: T::Boolean,
            is_profile_translatable: T::Boolean,
            is_translator: T::Boolean,
            is_verified: T::Boolean,
            location: String,
            media_count: Integer,
            parody_commentary_fan_label: String,
            pinned_tweet_ids: T::Array[String],
            possibly_sensitive: T::Boolean,
            profile_bio: T::Hash[Symbol, T.anything],
            profile_banner_url: String,
            profile_description_language: String,
            profile_image_shape: String,
            profile_interstitial_type: String,
            profile_picture: String,
            profile_sort_enabled: T::Boolean,
            profile_translator_type: String,
            protected: T::Boolean,
            statuses_count: Integer,
            super_follow_eligible: T::Boolean,
            unavailable: T::Boolean,
            unavailable_reason: String,
            url: String,
            verified: T::Boolean,
            verified_type: String,
            withheld_in_countries: T::Array[String]
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
    end
  end
end
