# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      class CommunityNotes
        # Returns 1 Community Notes contributor by the alias X gives them. Includes note
        # counts by rating, rating counts & the deleted notes count. Each lookup costs 1
        # credit.
        sig do
          params(
            alias_: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(
            XTwitterScraper::Models::X::CommunityNoteRetrieveContributorResponse
          )
        end
        def retrieve_contributor(
          # Community Notes contributor alias, or the URL-encoded contributor URL, such as
          # x.com/i/communitynotes/u/ardent-beach-friarbird. Any letter case works.
          alias_,
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

        # Returns the notes a contributor deleted, newest first. X keeps each note's ID,
        # times, rating & tags. A notice replaces its text & post. Each note costs 1
        # credit. A contributor who deleted none returns an empty list, free.
        sig do
          params(
            alias_: String,
            cursor: String,
            page_size: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PaginatedCommunityNotes)
        end
        def list_contributor_deleted_notes(
          # Community Notes contributor alias, or the URL-encoded contributor URL, such as
          # x.com/i/communitynotes/u/ardent-beach-friarbird. Any letter case works.
          alias_,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Notes per page (1-10, default 10). A low credit balance can return fewer. Follow
          # next_cursor for more pages. Also read as limit, count, max_results, maxItems,
          # max_items & per_page.
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

        # Returns a contributor's notes, newest first, each with the post it is on.
        # Includes notes X has not rated helpful. Each note costs 1 credit. Follow
        # next_cursor for more.
        sig do
          params(
            alias_: String,
            cursor: String,
            page_size: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PaginatedCommunityNotes)
        end
        def list_contributor_notes(
          # Community Notes contributor alias, or the URL-encoded contributor URL, such as
          # x.com/i/communitynotes/u/ardent-beach-friarbird. Any letter case works.
          alias_,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Notes per page (1-10, default 10). A low credit balance can return fewer. Follow
          # next_cursor for more pages. Also read as limit, count, max_results, maxItems,
          # max_items & per_page.
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
