# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_verified_followers
      class UserRetrieveVerifiedFollowersParams < XTwitterScraper::Internal::Type::BaseModel
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

        # @!attribute blue_verified_only
        #   Only return profiles X marks as blue verified. X marks many business &
        #   government accounts blue too. Use verifiedType for 1 badge type.
        #
        #   @return [Boolean, nil]
        optional :blue_verified_only, XTwitterScraper::Internal::Type::Boolean

        # @!attribute business_email_only
        #   Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        #   @return [Boolean, nil]
        optional :business_email_only, XTwitterScraper::Internal::Type::Boolean

        # @!attribute cursor
        #   Cursor from the previous response. Xquik cursors resume automatic coverage.
        #   Existing unprefixed cursors keep legacy standard behavior.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute email_domains
        #   Only return profiles with an email at one of these domains. Separate domains
        #   with commas. Subdomains match.
        #
        #   @return [String, nil]
        optional :email_domains, String

        # @!attribute enrich_profiles
        #   Add each row's full profile, as GET /x/users/{id} returns it. Pages take several
        #   seconds longer.
        #
        #   @return [Boolean, nil]
        optional :enrich_profiles, XTwitterScraper::Internal::Type::Boolean

        # @!attribute fields
        #   Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #   author.username. A list keeps the field in each item. Case & underscores do not
        #   matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        #   always stay. An unknown name answers 400 unknown_field with the valid names,
        #   before any read. The price stays the same. SDK row types then hold only the
        #   named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        #   the fields you need with `fields` & `omit`.
        #
        #   @return [String, nil]
        optional :fields, String

        # @!attribute has_email
        #   Only return profiles that publish an email.
        #
        #   @return [Boolean, nil]
        optional :has_email, XTwitterScraper::Internal::Type::Boolean

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

        # @!attribute max_scan
        #   Most profiles 1 request reads, kept or dropped by the filters. The request then
        #   answers the profiles it kept, the count it dropped & the cursor to read on. Each
        #   request of a cursor may send its own value. Without it, a filtered read scans at
        #   most 100,000 profiles of the list across all its pages, & the page that reaches
        #   them ends the list with `scanLimit`. An unfiltered read has no scan limit.
        #   Automatic mode only.
        #
        #   @return [Integer, nil]
        optional :max_scan, Integer

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
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveVerifiedFollowersParams::Mode, nil]
        optional :mode, enum: -> { XTwitterScraper::X::UserRetrieveVerifiedFollowersParams::Mode }

        # @!attribute omit
        #   Fields to drop from each row, comma-separated. It takes the same names as
        #   fields. With fields, it drops from the kept fields. A longer URL fails at the
        #   edge before Xquik reads it.
        #
        #   @return [String, nil]
        optional :omit, String

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

        # @!method initialize(id:, after: nil, bio_contains: nil, blue_verified_only: nil, business_email_only: nil, cursor: nil, email_domains: nil, enrich_profiles: nil, fields: nil, has_email: nil, has_location: nil, has_website: nil, limit: nil, location_contains: nil, max_followers: nil, max_following: nil, max_scan: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, mode: nil, omit: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #   @param id [String]
        #
        #   @param after [String] Legacy cursor alias. Prefer cursor.
        #
        #   @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        #   @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & governmen
        #
        #   @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        #   @param cursor [String] Cursor from the previous response. Xquik cursors resume automatic coverage. Exis
        #
        #   @param email_domains [String] Only return profiles with an email at one of these domains. Separate domains wit
        #
        #   @param enrich_profiles [Boolean] Add each row's full profile, as GET /x/users/{id} returns it. Pages take several
        #
        #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        #   @param has_email [Boolean] Only return profiles that publish an email.
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
        #   @param max_scan [Integer] Most profiles 1 request reads, kept or dropped by the filters. The request then
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
        #   @param mode [Symbol, XTwitterScraper::Models::X::UserRetrieveVerifiedFollowersParams::Mode] Omit mode for resumable maximum coverage. Standard keeps legacy pagination. Cove
        #
        #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
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
