# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_followers
      class UserRetrieveFollowersParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute after
        #   Legacy cursor alias. Prefer cursor.
        #
        #   @return [String, nil]
        optional :after, String

        # @!attribute bio_contains
        #   Match any comma-separated or line-separated bio term, ignoring case.
        #
        #   @return [String, nil]
        optional :bio_contains, String

        # @!attribute cursor
        #   Cursor from the previous response. Xquik cursors resume automatic coverage.
        #   Existing unprefixed cursors keep legacy standard behavior.
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

        # @!attribute limit
        #   Legacy page-size alias outside explicit coverage mode. Coverage accepts 1-10000.
        #   Prefer pageSize.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

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

        # @!attribute mode
        #   Omit mode for resumable maximum coverage. Standard keeps legacy pagination.
        #   Coverage returns diagnostics once and rejects cursors.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveFollowersParams::Mode, nil]
        optional :mode, enum: -> { XTwitterScraper::X::UserRetrieveFollowersParams::Mode }

        # @!attribute page_size
        #   Maximum user profiles: automatic 300; standard 200. Sources return fewer
        #   profiles. Continue with has_next_page.
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

        # @!method initialize(id:, after: nil, bio_contains: nil, cursor: nil, has_location: nil, has_website: nil, limit: nil, location_contains: nil, max_followers: nil, max_following: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, mode: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::UserRetrieveFollowersParams} for more details.
        #
        #   @param id [String]
        #
        #   @param after [String] Legacy cursor alias. Prefer cursor.
        #
        #   @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        #   @param cursor [String] Cursor from the previous response. Xquik cursors resume automatic coverage. Exis
        #
        #   @param has_location [Boolean] Only return profiles with a location.
        #
        #   @param has_website [Boolean] Only return profiles with a website.
        #
        #   @param limit [Integer] Legacy page-size alias outside explicit coverage mode. Coverage accepts 1-10000.
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
        #   @param mode [Symbol, XTwitterScraper::Models::X::UserRetrieveFollowersParams::Mode] Omit mode for resumable maximum coverage. Standard keeps legacy pagination. Cove
        #
        #   @param page_size [Integer] Maximum user profiles: automatic 300; standard 200. Sources return fewer profile
        #
        #   @param username_contains [String] Match a username substring, ignoring case.
        #
        #   @param verified_only [Boolean] Only return verified profiles.
        #
        #   @param verified_type [String] Match the verification type exactly, ignoring case.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

        # Omit mode for resumable maximum coverage. Standard keeps legacy pagination.
        # Coverage returns diagnostics once and rejects cursors.
        module Mode
          extend XTwitterScraper::Internal::Type::Enum

          STANDARD = :standard
          COVERAGE = :coverage

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
