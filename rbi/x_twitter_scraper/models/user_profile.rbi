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

      sig { returns(T.nilable(String)) }
      attr_reader :automated_by

      sig { params(automated_by: String).void }
      attr_writer :automated_by

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :can_dm

      sig { params(can_dm: T::Boolean).void }
      attr_writer :can_dm

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
      attr_reader :is_automated

      sig { params(is_automated: T::Boolean).void }
      attr_writer :is_automated

      # Whether X shows a blue verification badge
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_blue_verified

      sig { params(is_blue_verified: T::Boolean).void }
      attr_writer :is_blue_verified

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
      attr_reader :profile_picture

      sig { params(profile_picture: String).void }
      attr_writer :profile_picture

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

      # Whether this profile follows the authenticated viewer
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :viewer_followed_by

      sig { params(viewer_followed_by: T::Boolean).void }
      attr_writer :viewer_followed_by

      # Whether the authenticated viewer follows this profile
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :viewer_following

      sig { params(viewer_following: T::Boolean).void }
      attr_writer :viewer_following

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
          automated_by: String,
          can_dm: T::Boolean,
          community_role: String,
          cover_picture: String,
          created_at: String,
          description: String,
          favourites_count: Integer,
          followers: Integer,
          following: Integer,
          has_custom_timelines: T::Boolean,
          is_automated: T::Boolean,
          is_blue_verified: T::Boolean,
          is_translator: T::Boolean,
          is_verified: T::Boolean,
          location: String,
          media_count: Integer,
          pinned_tweet_ids: T::Array[String],
          possibly_sensitive: T::Boolean,
          profile_bio: T::Hash[Symbol, T.anything],
          profile_banner_url: String,
          profile_picture: String,
          protected: T::Boolean,
          statuses_count: Integer,
          unavailable: T::Boolean,
          unavailable_reason: String,
          url: String,
          verified: T::Boolean,
          verified_type: String,
          viewer_followed_by: T::Boolean,
          viewer_following: T::Boolean,
          withheld_in_countries: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        name:,
        username:,
        automated_by: nil,
        can_dm: nil,
        # Community role when returned by community member reads
        community_role: nil,
        cover_picture: nil,
        created_at: nil,
        description: nil,
        favourites_count: nil,
        followers: nil,
        following: nil,
        has_custom_timelines: nil,
        is_automated: nil,
        # Whether X shows a blue verification badge
        is_blue_verified: nil,
        is_translator: nil,
        # Whether X marks the profile as verified
        is_verified: nil,
        location: nil,
        media_count: nil,
        pinned_tweet_ids: nil,
        possibly_sensitive: nil,
        # Structured profile bio with entity annotations
        profile_bio: nil,
        # Original X profile banner field when available
        profile_banner_url: nil,
        profile_picture: nil,
        # Whether the profile protects its posts
        protected: nil,
        statuses_count: nil,
        unavailable: nil,
        unavailable_reason: nil,
        url: nil,
        verified: nil,
        verified_type: nil,
        # Whether this profile follows the authenticated viewer
        viewer_followed_by: nil,
        # Whether the authenticated viewer follows this profile
        viewer_following: nil,
        withheld_in_countries: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            username: String,
            automated_by: String,
            can_dm: T::Boolean,
            community_role: String,
            cover_picture: String,
            created_at: String,
            description: String,
            favourites_count: Integer,
            followers: Integer,
            following: Integer,
            has_custom_timelines: T::Boolean,
            is_automated: T::Boolean,
            is_blue_verified: T::Boolean,
            is_translator: T::Boolean,
            is_verified: T::Boolean,
            location: String,
            media_count: Integer,
            pinned_tweet_ids: T::Array[String],
            possibly_sensitive: T::Boolean,
            profile_bio: T::Hash[Symbol, T.anything],
            profile_banner_url: String,
            profile_picture: String,
            protected: T::Boolean,
            statuses_count: Integer,
            unavailable: T::Boolean,
            unavailable_reason: String,
            url: String,
            verified: T::Boolean,
            verified_type: String,
            viewer_followed_by: T::Boolean,
            viewer_following: T::Boolean,
            withheld_in_countries: T::Array[String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
