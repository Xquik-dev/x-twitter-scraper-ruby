# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class JobSearchParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::JobSearchParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Keyword, such as a job title or skill. Its alias is query. Xquik's cap is 4,096
        # characters.
        sig { returns(String) }
        attr_accessor :q

        # City, region or country as text, such as Berlin. Xquik's cap is 4,096
        # characters.
        sig { returns(T.nilable(String)) }
        attr_reader :location

        sig { params(location: String).void }
        attr_writer :location

        # Location ID from GET /x/jobs/locations. Replaces location when both are sent.
        sig { returns(T.nilable(String)) }
        attr_reader :location_id

        sig { params(location_id: String).void }
        attr_writer :location_id

        # Where the work happens. Comma-separated list of onsite, remote & hybrid. Any
        # case works. It allows 44 characters for every choice once with spaces, hyphens
        # or underscores.
        sig { returns(T.nilable(String)) }
        attr_reader :location_type

        sig { params(location_type: String).void }
        attr_writer :location_type

        # Comma-separated list of intern, entry_level, junior, mid_level, senior, lead,
        # manager & executive. Any case works. It allows 144 characters for every choice
        # once with spaces, hyphens or underscores.
        sig { returns(T.nilable(String)) }
        attr_reader :seniority

        sig { params(seniority: String).void }
        attr_writer :seniority

        # Comma-separated list of full_time, full_time_contract, part_time &
        # contract_to_hire. Any case works. It allows 116 characters for every choice once
        # with spaces, hyphens or underscores.
        sig { returns(T.nilable(String)) }
        attr_reader :employment_type

        sig { params(employment_type: String).void }
        attr_writer :employment_type

        # Company name to match. Xquik's cap is 4,096 characters.
        sig { returns(T.nilable(String)) }
        attr_reader :company

        sig { params(company: String).void }
        attr_writer :company

        # Pagination cursor for collection results. Also read as next_cursor, next_token,
        # pagination_token or continuation_token.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Items per page (1-100, default 20). Source, filters or credits can return fewer.
        # Follow next_cursor for more pages. Its aliases are limit, count, max_results,
        # maxItems, max_items & per_page.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        sig { returns(T.nilable(String)) }
        attr_reader :fields

        sig { params(fields: String).void }
        attr_writer :fields

        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        sig { returns(T.nilable(String)) }
        attr_reader :omit

        sig { params(omit: String).void }
        attr_writer :omit

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
          ).returns(T.attached_class)
        end
        def self.new(
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

        sig do
          override.returns(
            {
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
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
