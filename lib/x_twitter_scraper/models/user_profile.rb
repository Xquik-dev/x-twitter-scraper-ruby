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

      # @!attribute automated_by
      #
      #   @return [String, nil]
      optional :automated_by, String, api_name: :automatedBy

      # @!attribute can_dm
      #
      #   @return [Boolean, nil]
      optional :can_dm, XTwitterScraper::Internal::Type::Boolean, api_name: :canDm

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

      # @!attribute is_automated
      #
      #   @return [Boolean, nil]
      optional :is_automated, XTwitterScraper::Internal::Type::Boolean, api_name: :isAutomated

      # @!attribute is_blue_verified
      #   Whether X shows a blue verification badge
      #
      #   @return [Boolean, nil]
      optional :is_blue_verified, XTwitterScraper::Internal::Type::Boolean, api_name: :isBlueVerified

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

      # @!attribute profile_picture
      #
      #   @return [String, nil]
      optional :profile_picture, String, api_name: :profilePicture

      # @!attribute protected
      #   Whether the profile protects its posts
      #
      #   @return [Boolean, nil]
      optional :protected, XTwitterScraper::Internal::Type::Boolean

      # @!attribute statuses_count
      #
      #   @return [Integer, nil]
      optional :statuses_count, Integer, api_name: :statusesCount

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

      # @!attribute viewer_followed_by
      #   Whether this profile follows the authenticated viewer
      #
      #   @return [Boolean, nil]
      optional :viewer_followed_by, XTwitterScraper::Internal::Type::Boolean, api_name: :viewerFollowedBy

      # @!attribute viewer_following
      #   Whether the authenticated viewer follows this profile
      #
      #   @return [Boolean, nil]
      optional :viewer_following, XTwitterScraper::Internal::Type::Boolean, api_name: :viewerFollowing

      # @!attribute withheld_in_countries
      #
      #   @return [Array<String>, nil]
      optional :withheld_in_countries,
               XTwitterScraper::Internal::Type::ArrayOf[String],
               api_name: :withheldInCountries

      # @!method initialize(id:, name:, username:, automated_by: nil, can_dm: nil, community_role: nil, cover_picture: nil, created_at: nil, description: nil, favourites_count: nil, followers: nil, following: nil, has_custom_timelines: nil, is_automated: nil, is_blue_verified: nil, is_translator: nil, is_verified: nil, location: nil, media_count: nil, pinned_tweet_ids: nil, possibly_sensitive: nil, profile_bio: nil, profile_banner_url: nil, profile_picture: nil, protected: nil, statuses_count: nil, unavailable: nil, unavailable_reason: nil, url: nil, verified: nil, verified_type: nil, viewer_followed_by: nil, viewer_following: nil, withheld_in_countries: nil)
      #   X user profile with bio, follower counts, and verification status.
      #
      #   @param id [String]
      #
      #   @param name [String]
      #
      #   @param username [String]
      #
      #   @param automated_by [String]
      #
      #   @param can_dm [Boolean]
      #
      #   @param community_role [String] Community role when returned by community member reads
      #
      #   @param cover_picture [String]
      #
      #   @param created_at [String]
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
      #   @param is_automated [Boolean]
      #
      #   @param is_blue_verified [Boolean] Whether X shows a blue verification badge
      #
      #   @param is_translator [Boolean]
      #
      #   @param is_verified [Boolean] Whether X marks the profile as verified
      #
      #   @param location [String]
      #
      #   @param media_count [Integer]
      #
      #   @param pinned_tweet_ids [Array<String>]
      #
      #   @param possibly_sensitive [Boolean]
      #
      #   @param profile_bio [Hash{Symbol=>Object}] Structured profile bio with entity annotations
      #
      #   @param profile_banner_url [String] Original X profile banner field when available
      #
      #   @param profile_picture [String]
      #
      #   @param protected [Boolean] Whether the profile protects its posts
      #
      #   @param statuses_count [Integer]
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
      #   @param viewer_followed_by [Boolean] Whether this profile follows the authenticated viewer
      #
      #   @param viewer_following [Boolean] Whether the authenticated viewer follows this profile
      #
      #   @param withheld_in_countries [Array<String>]
    end
  end
end
