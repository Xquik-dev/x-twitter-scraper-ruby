# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Jobs
        # Returns the places whose names match a query, each with the location ID that GET
        # /x/jobs/search takes. No match returns an empty list, free.
        #
        # @overload list_locations(q:, limit: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param q [String] Place name or its start, such as new york. Its alias is query. Xquik's cap is 4,096 characters.
        #
        # @param limit [Integer] Most places to return. Without it, every match returns. Its aliases are pageSize, count, max_results, maxItems, max_items & per_page.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::JobLocations]
        #
        # @see XTwitterScraper::Models::X::JobListLocationsParams
        def list_locations(params)
          parsed, options = XTwitterScraper::Models::X::JobListLocationsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/jobs/locations",
            query: query,
            model: XTwitterScraper::Models::JobLocations,
            options: options
          )
        end

        # Returns job listings with title, location, salary, company & apply link. Add
        # filters to narrow them. A closed job does not appear & costs nothing. Follow
        # next_cursor for more.
        #
        # @overload search(q:, location: nil, location_id: nil, location_type: nil, seniority: nil, employment_type: nil, company: nil, cursor: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param q [String] Keyword, such as a job title or skill. Its alias is query. Xquik's cap is 4,096 characters.
        #
        # @param location [String] City, region or country as text, such as Berlin. Xquik's cap is 4,096 characters.
        #
        # @param location_id [String] Location ID from GET /x/jobs/locations. Replaces location when both are sent.
        #
        # @param location_type [String] Where the work happens. Comma-separated list of onsite, remote & hybrid. Any case works. It allows 44 characters for every choice once with spaces, hyphens or underscores.
        #
        # @param seniority [String] Comma-separated list of intern, entry_level, junior, mid_level, senior, lead, manager & executive. Any case works. It allows 144 characters for every choice once with spaces, hyphens or underscores.
        #
        # @param employment_type [String] Comma-separated list of full_time, full_time_contract, part_time & contract_to_hire. Any case works. It allows 116 characters for every choice once with spaces, hyphens or underscores.
        #
        # @param company [String] Company name to match. Xquik's cap is 4,096 characters.
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] Items per page (1-100, default 20). Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedJobs]
        #
        # @see XTwitterScraper::Models::X::JobSearchParams
        def search(params)
          parsed, options = XTwitterScraper::Models::X::JobSearchParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/jobs/search",
            query: query,
            model: XTwitterScraper::Models::PaginatedJobs,
            options: options
          )
        end

        # Returns a public job listing with its description as text & Markdown, work type,
        # seniority, salary, company & apply link. A job that closed returns job_not_found
        # & is free.
        #
        # @overload retrieve(id, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] Job ID or URL-encoded job URL, such as x.com/i/jobs/123. Anything else gets 400 `invalid_job_id`.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::JobRetrieveResponse]
        #
        # @see XTwitterScraper::Models::X::JobRetrieveParams
        def retrieve(id, params = {})
          parsed, options = XTwitterScraper::Models::X::JobRetrieveParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/jobs/%1$s", id],
            query: query,
            model: XTwitterScraper::Models::X::JobRetrieveResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
