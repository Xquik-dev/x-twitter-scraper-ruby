# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Jobs#search
      class JobSearchParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute q
        #   Keyword, such as a job title or skill. Its alias is query. Xquik's cap is 4,096
        #   characters.
        #
        #   @return [String]
        required :q, String

        # @!attribute location
        #   City, region or country as text, such as Berlin. Xquik's cap is 4,096
        #   characters.
        #
        #   @return [String, nil]
        optional :location, String

        # @!attribute location_id
        #   Location ID from GET /x/jobs/locations. Replaces location when both are sent.
        #
        #   @return [String, nil]
        optional :location_id, String, api_name: :locationId

        # @!attribute location_type
        #   Where the work happens. Comma-separated list of onsite, remote & hybrid. Any
        #   case works. It allows 44 characters for every choice once with spaces, hyphens
        #   or underscores.
        #
        #   @return [String, nil]
        optional :location_type, String, api_name: :locationType

        # @!attribute seniority
        #   Comma-separated list of intern, entry_level, junior, mid_level, senior, lead,
        #   manager & executive. Any case works. It allows 144 characters for every choice
        #   once with spaces, hyphens or underscores.
        #
        #   @return [String, nil]
        optional :seniority, String

        # @!attribute employment_type
        #   Comma-separated list of full_time, full_time_contract, part_time &
        #   contract_to_hire. Any case works. It allows 116 characters for every choice once
        #   with spaces, hyphens or underscores.
        #
        #   @return [String, nil]
        optional :employment_type, String, api_name: :employmentType

        # @!attribute company
        #   Company name to match. Xquik's cap is 4,096 characters.
        #
        #   @return [String, nil]
        optional :company, String

        # @!attribute cursor
        #   Pagination cursor for collection results. Also read as next_cursor, next_token,
        #   pagination_token or continuation_token.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute page_size
        #   Items per page (1-100, default 20). Source, filters or credits can return fewer.
        #   Follow next_cursor for more pages. Its aliases are limit, count, max_results,
        #   maxItems, max_items & per_page.
        #
        #   @return [Integer, nil]
        optional :page_size, Integer, api_name: :pageSize

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

        # @!method initialize(q:, location: nil, location_id: nil, location_type: nil, seniority: nil, employment_type: nil, company: nil, cursor: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #   @param q [String] Keyword, such as a job title or skill. Its alias is query. Xquik's cap is 4,096 characters.
        #
        #   @param location [String] City, region or country as text, such as Berlin. Xquik's cap is 4,096 characters.
        #
        #   @param location_id [String] Location ID from GET /x/jobs/locations. Replaces location when both are sent.
        #
        #   @param location_type [String] Where the work happens. Comma-separated list of onsite, remote & hybrid. Any case works. It allows 44 characters for every choice once with spaces, hyphens or underscores.
        #
        #   @param seniority [String] Comma-separated list of intern, entry_level, junior, mid_level, senior, lead, manager & executive. Any case works. It allows 144 characters for every choice once with spaces, hyphens or underscores.
        #
        #   @param employment_type [String] Comma-separated list of full_time, full_time_contract, part_time & contract_to_hire. Any case works. It allows 116 characters for every choice once with spaces, hyphens or underscores.
        #
        #   @param company [String] Company name to match. Xquik's cap is 4,096 characters.
        #
        #   @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        #   @param page_size [Integer] Items per page (1-100, default 20). Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
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
