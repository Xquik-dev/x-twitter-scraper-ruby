# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Jobs
        # Returns the places whose names match a query, each with the location ID that GET
        # /x/jobs/search takes. No match returns an empty list, free.
        sig do
          params(
            q: String,
            limit: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::JobLocations)
        end
        def list_locations(
          # Place name or its start, such as new york. Its alias is query. Xquik's cap is
          # 4,096 characters.
          q:,
          # Most places to return. Without it, every match returns. Its aliases are
          # pageSize, count, max_results, maxItems, max_items & per_page.
          limit: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Returns job listings with title, location, salary, company & apply link. Add
        # filters to narrow them. A closed job does not appear & costs nothing. Follow
        # next_cursor for more.
        sig do
          params(
            q: String,
            location: String,
            location_id: String,
            location_type: String,
            seniority: String,
            employment_type: String,
            company: String,
            cursor: String,
            page_size: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PaginatedJobs)
        end
        def search(
          # Keyword, such as a job title or skill. Its alias is query. Xquik's cap is 4,096
          # characters.
          q:,
          # City, region or country as text, such as Berlin. Xquik's cap is 4,096
          # characters.
          location: nil,
          # Location ID from GET /x/jobs/locations. Replaces location when both are sent.
          location_id: nil,
          # Where the work happens. Comma-separated list of onsite, remote & hybrid. Any
          # case works. It allows 44 characters for every choice once with spaces, hyphens
          # or underscores.
          location_type: nil,
          # Comma-separated list of intern, entry_level, junior, mid_level, senior, lead,
          # manager & executive. Any case works. It allows 144 characters for every choice
          # once with spaces, hyphens or underscores.
          seniority: nil,
          # Comma-separated list of full_time, full_time_contract, part_time &
          # contract_to_hire. Any case works. It allows 116 characters for every choice once
          # with spaces, hyphens or underscores.
          employment_type: nil,
          # Company name to match. Xquik's cap is 4,096 characters.
          company: nil,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Items per page (1-100, default 20). Source, filters or credits can return fewer.
          # Follow next_cursor for more pages. Its aliases are limit, count, max_results,
          # maxItems, max_items & per_page.
          page_size: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Returns a public job listing with its description as text & Markdown, work type,
        # seniority, salary, company & apply link. A job that closed returns job_not_found
        # & is free.
        sig do
          params(
            id: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::JobRetrieveResponse)
        end
        def retrieve(
          # Job ID or URL-encoded job URL, such as x.com/i/jobs/123. Anything else gets 400
          # `invalid_job_id`.
          id,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # @api private
        sig do
          params(client: XTwitterScraper::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
