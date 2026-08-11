# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_followers_you_know
      class UserRetrieveFollowersYouKnowParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute bio_contains
        #   Match any comma-separated or line-separated bio term, ignoring case.
        #
        #   @return [String, nil]
        optional :bio_contains, String

        # @!attribute cursor
        #   Pagination cursor for followers-you-know
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute has_location
        #   Only return profiles with a location.
        #
        #   @return [Boolean, nil]
        optional :has_location, XTwitterScraper::Internal::Type::Boolean

        # @!attribute has_website
        #   Only return profiles with a website.
        #
        #   @return [Boolean, nil]
        optional :has_website, XTwitterScraper::Internal::Type::Boolean

        # @!attribute location_contains
        #   Match a location substring, ignoring case.
        #
        #   @return [String, nil]
        optional :location_contains, String

        # @!attribute max_followers
        #   Maximum follower count. Missing counts pass this maximum.
        #
        #   @return [Integer, nil]
        optional :max_followers, Integer

        # @!attribute max_following
        #   Maximum following count.
        #
        #   @return [Integer, nil]
        optional :max_following, Integer

        # @!attribute max_statuses
        #   Maximum post count. maxPosts is also accepted.
        #
        #   @return [Integer, nil]
        optional :max_statuses, Integer

        # @!attribute min_account_age_days
        #   Minimum account age in whole days.
        #
        #   @return [Integer, nil]
        optional :min_account_age_days, Integer

        # @!attribute min_followers
        #   Minimum follower count. Filtering happens before billing.
        #
        #   @return [Integer, nil]
        optional :min_followers, Integer

        # @!attribute min_following
        #   Minimum following count.
        #
        #   @return [Integer, nil]
        optional :min_following, Integer

        # @!attribute min_statuses
        #   Minimum post count. minPosts is also accepted.
        #
        #   @return [Integer, nil]
        optional :min_statuses, Integer

        # @!attribute page_size
        #   Maximum user profiles requested from this page (20-200, default 200). Source,
        #   filters, or credits can return fewer profiles. Keep requesting next_cursor while
        #   has_next_page is true. Deprecated aliases remain accepted.
        #
        #   @return [Integer, nil]
        optional :page_size, Integer

        # @!attribute username_contains
        #   Match a username substring, ignoring case.
        #
        #   @return [String, nil]
        optional :username_contains, String

        # @!attribute verified_only
        #   Only return verified profiles.
        #
        #   @return [Boolean, nil]
        optional :verified_only, XTwitterScraper::Internal::Type::Boolean

        # @!attribute verified_type
        #   Match the verification type exactly, ignoring case.
        #
        #   @return [String, nil]
        optional :verified_type, String

        # @!method initialize(id:, bio_contains: nil, cursor: nil, has_location: nil, has_website: nil, location_contains: nil, max_followers: nil, max_following: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::UserRetrieveFollowersYouKnowParams} for more
        #   details.
        #
        #   @param id [String]
        #
        #   @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        #   @param cursor [String] Pagination cursor for followers-you-know
        #
        #   @param has_location [Boolean] Only return profiles with a location.
        #
        #   @param has_website [Boolean] Only return profiles with a website.
        #
        #   @param location_contains [String] Match a location substring, ignoring case.
        #
        #   @param max_followers [Integer] Maximum follower count. Missing counts pass this maximum.
        #
        #   @param max_following [Integer] Maximum following count.
        #
        #   @param max_statuses [Integer] Maximum post count. maxPosts is also accepted.
        #
        #   @param min_account_age_days [Integer] Minimum account age in whole days.
        #
        #   @param min_followers [Integer] Minimum follower count. Filtering happens before billing.
        #
        #   @param min_following [Integer] Minimum following count.
        #
        #   @param min_statuses [Integer] Minimum post count. minPosts is also accepted.
        #
        #   @param page_size [Integer] Maximum user profiles requested from this page (20-200, default 200). Source, fi
        #
        #   @param username_contains [String] Match a username substring, ignoring case.
        #
        #   @param verified_only [Boolean] Only return verified profiles.
        #
        #   @param verified_type [String] Match the verification type exactly, ignoring case.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
