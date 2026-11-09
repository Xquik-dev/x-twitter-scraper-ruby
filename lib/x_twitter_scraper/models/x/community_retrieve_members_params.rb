# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Communities#retrieve_members
      class CommunityRetrieveMembersParams < XTwitterScraper::Internal::Type::BaseModel
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
        #   Pagination cursor
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute email_domains
        #   Only return profiles with an email at one of these domains. Separate domains
        #   with commas. Subdomains match.
        #
        #   @return [String, nil]
        optional :email_domains, String

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

        # @!attribute omit
        #   Fields to drop from each row, comma-separated. It takes the same names as
        #   fields. With fields, it drops from the kept fields. A longer URL fails at the
        #   edge before Xquik reads it.
        #
        #   @return [String, nil]
        optional :omit, String

        # @!attribute page_size
        #   Items per page (20-200, default 20). This is an upper bound for paid
        #   authenticated calls: remaining credits can reduce the returned page size, and
        #   zero affordable results returns 402 insufficient_credits.
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

        # @!method initialize(id:, bio_contains: nil, blue_verified_only: nil, business_email_only: nil, cursor: nil, email_domains: nil, fields: nil, has_email: nil, has_location: nil, has_website: nil, location_contains: nil, max_followers: nil, max_following: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, omit: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #   @param id [String]
        #
        #   @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        #   @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & governmen
        #
        #   @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        #   @param cursor [String] Pagination cursor
        #
        #   @param email_domains [String] Only return profiles with an email at one of these domains. Separate domains wit
        #
        #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        #   @param has_email [Boolean] Only return profiles that publish an email.
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
        #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        #   @param page_size [Integer] Items per page (20-200, default 20). This is an upper bound for paid authenticat
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
