# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Spaces
        # Returns public Spaces, each once, with the fields of GET /x/spaces/{id}. Latest
        # & Top find live, scheduled or ended Spaces & accept X search operators. Live &
        # Upcoming find live or scheduled Spaces by title words. Costs 1 credit per Space.
        sig do
          params(
            q: String,
            query_type:
              XTwitterScraper::Models::X::SpaceSearchParams::QueryType::OrSymbol,
            cursor: String,
            page_size: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::SpaceSearchResponse)
        end
        def search(
          # Words, hashtags or X search operators, such as from:solana. Live & Upcoming
          # match title words only, without operators. Alias query.
          q:,
          # Latest finds Spaces in the newest posts. Top finds them in the most engaging
          # posts. Live lists Spaces on air now. Upcoming lists scheduled ones, as X's
          # Spaces search does. Any case works. Aliases result_type, sort_order, type,
          # search_type, product, category & section.
          query_type: nil,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # For Latest & Top, the page size (1-100, default 20). A page can return fewer
          # Spaces. Send 100 to read a search fastest. For Live & Upcoming, the most Spaces
          # a page returns. Its aliases are limit, count, max_results, maxItems, max_items &
          # per_page.
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

        # Returns 1 X Space as X shows it, live, scheduled or ended. Accepts the Space ID
        # or the URL-encoded Space URL. A Space X limits to subscribers or a community
        # answers 404.
        sig do
          params(
            id: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::SpaceRetrieveResponse)
        end
        def retrieve(
          # X Space ID, or the URL-encoded Space URL, such as x.com/i/spaces/1OGwblLjnQMKB.
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

        # Returns the recording X plays back once a Space is over, in state Ended or
        # TimedOut. Accepts the Space ID or the URL-encoded Space URL. Check state and
        # isAvailableForReplay with the Space lookup first. A live or scheduled Space
        # answers 409, and a cancelled one 404.
        sig do
          params(
            id: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::SpaceRetrieveReplayResponse)
        end
        def retrieve_replay(
          # X Space ID, or the URL-encoded Space URL, such as x.com/i/spaces/1OGwblLjnQMKB.
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
