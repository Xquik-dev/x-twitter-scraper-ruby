# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_similar
      class UserRetrieveSimilarParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute cursor
        #   Pagination cursor for collection results. Also read as next_cursor, next_token,
        #   pagination_token or continuation_token.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute page_size
        #   Profiles to request from this page. A page holds up to 10,000, so a larger
        #   pageSize gets the largest page. Default 200. Source, filters or credits can
        #   return fewer. Follow next_cursor for more pages. Its aliases are limit, count,
        #   max_results, maxItems, max_items & per_page.
        #
        #   @return [Integer, nil]
        optional :page_size, Integer, api_name: :pageSize

        # @!attribute min_followers
        #   Minimum follower count. Profiles the filter drops cost nothing.
        #
        #   @return [Integer, nil]
        optional :min_followers, Integer, api_name: :minFollowers

        # @!attribute max_followers
        #   Maximum follower count. A profile without a count passes.
        #
        #   @return [Integer, nil]
        optional :max_followers, Integer, api_name: :maxFollowers

        # @!attribute min_following
        #   Profiles must follow at least this many accounts.
        #
        #   @return [Integer, nil]
        optional :min_following, Integer, api_name: :minFollowing

        # @!attribute max_following
        #   Profiles may follow at most this many accounts.
        #
        #   @return [Integer, nil]
        optional :max_following, Integer, api_name: :maxFollowing

        # @!attribute min_statuses
        #   Minimum post count. minPosts is also accepted.
        #
        #   @return [Integer, nil]
        optional :min_statuses, Integer, api_name: :minStatuses

        # @!attribute max_statuses
        #   Maximum post count. maxPosts is also accepted.
        #
        #   @return [Integer, nil]
        optional :max_statuses, Integer, api_name: :maxStatuses

        # @!attribute min_account_age_days
        #   Minimum account age in whole days.
        #
        #   @return [Integer, nil]
        optional :min_account_age_days, Integer, api_name: :minAccountAgeDays

        # @!attribute verified_only
        #   Only return verified profiles.
        #
        #   @return [Boolean, nil]
        optional :verified_only, XTwitterScraper::Internal::Type::Boolean, api_name: :verifiedOnly

        # @!attribute blue_verified_only
        #   Only return profiles X marks as blue verified. X marks many business &
        #   government accounts blue too. Use verifiedType for 1 badge type.
        #
        #   @return [Boolean, nil]
        optional :blue_verified_only, XTwitterScraper::Internal::Type::Boolean, api_name: :blueVerifiedOnly

        # @!attribute verified_type
        #   Match the verification type exactly, ignoring case.
        #
        #   @return [String, nil]
        optional :verified_type, String, api_name: :verifiedType

        # @!attribute has_website
        #   Only return profiles with a website.
        #
        #   @return [Boolean, nil]
        optional :has_website, XTwitterScraper::Internal::Type::Boolean, api_name: :hasWebsite

        # @!attribute has_location
        #   Only return profiles with a location.
        #
        #   @return [Boolean, nil]
        optional :has_location, XTwitterScraper::Internal::Type::Boolean, api_name: :hasLocation

        # @!attribute has_email
        #   Only return profiles that publish an email.
        #
        #   @return [Boolean, nil]
        optional :has_email, XTwitterScraper::Internal::Type::Boolean, api_name: :hasEmail

        # @!attribute business_email_only
        #   Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        #   @return [Boolean, nil]
        optional :business_email_only, XTwitterScraper::Internal::Type::Boolean, api_name: :businessEmailOnly

        # @!attribute email_domains
        #   Only return profiles with an email at one of these domains. Separate domains
        #   with commas. Subdomains match.
        #
        #   @return [String, nil]
        optional :email_domains, String, api_name: :emailDomains

        # @!attribute bio_contains
        #   Match any comma-separated or line-separated bio term, ignoring case.
        #
        #   @return [String, nil]
        optional :bio_contains, String, api_name: :bioContains

        # @!attribute location_contains
        #   Match a location substring, ignoring case.
        #
        #   @return [String, nil]
        optional :location_contains, String, api_name: :locationContains

        # @!attribute username_contains
        #   Match a username substring, ignoring case.
        #
        #   @return [String, nil]
        optional :username_contains, String, api_name: :usernameContains

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

        # @!attribute omit
        #   Fields to drop from each row, comma-separated. It takes the same names as
        #   fields. With fields, it drops from the kept fields. A longer URL fails at the
        #   edge before Xquik reads it.
        #
        #   @return [String, nil]
        optional :omit, String

        # @!method initialize(id:, cursor: nil, page_size: nil, min_followers: nil, max_followers: nil, min_following: nil, max_following: nil, min_statuses: nil, max_statuses: nil, min_account_age_days: nil, verified_only: nil, blue_verified_only: nil, verified_type: nil, has_website: nil, has_location: nil, has_email: nil, business_email_only: nil, email_domains: nil, bio_contains: nil, location_contains: nil, username_contains: nil, fields: nil, omit: nil, request_options: {})
        #   @param id [String]
        #
        #   @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        #   @param page_size [Integer] Profiles to request from this page. A page holds up to 10,000, so a larger pageSize gets the largest page. Default 200. Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        #   @param min_followers [Integer] Minimum follower count. Profiles the filter drops cost nothing.
        #
        #   @param max_followers [Integer] Maximum follower count. A profile without a count passes.
        #
        #   @param min_following [Integer] Profiles must follow at least this many accounts.
        #
        #   @param max_following [Integer] Profiles may follow at most this many accounts.
        #
        #   @param min_statuses [Integer] Minimum post count. minPosts is also accepted.
        #
        #   @param max_statuses [Integer] Maximum post count. maxPosts is also accepted.
        #
        #   @param min_account_age_days [Integer] Minimum account age in whole days.
        #
        #   @param verified_only [Boolean] Only return verified profiles.
        #
        #   @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & government accounts blue too. Use verifiedType for 1 badge type.
        #
        #   @param verified_type [String] Match the verification type exactly, ignoring case.
        #
        #   @param has_website [Boolean] Only return profiles with a website.
        #
        #   @param has_location [Boolean] Only return profiles with a location.
        #
        #   @param has_email [Boolean] Only return profiles that publish an email.
        #
        #   @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        #   @param email_domains [String] Only return profiles with an email at one of these domains. Separate domains with commas. Subdomains match.
        #
        #   @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        #   @param location_contains [String] Match a location substring, ignoring case.
        #
        #   @param username_contains [String] Match a username substring, ignoring case.
        #
        #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
