# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class CommunityNotes
        # Returns 1 Community Notes contributor by the alias X gives them. Includes note
        # counts by rating, rating counts & the deleted notes count. Each lookup costs 1
        # credit.
        #
        # @overload retrieve_contributor(alias_, fields: nil, omit: nil, request_options: {})
        #
        # @param alias_ [String] Community Notes contributor alias, or the URL-encoded contributor URL, such as x.com/i/communitynotes/u/ardent-beach-friarbird. Any letter case works.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::CommunityNoteRetrieveContributorResponse]
        #
        # @see XTwitterScraper::Models::X::CommunityNoteRetrieveContributorParams
        def retrieve_contributor(alias_, params = {})
          parsed, options = XTwitterScraper::Models::X::CommunityNoteRetrieveContributorParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/community-notes/contributors/%1$s", alias_],
            query: query,
            model: XTwitterScraper::Models::X::CommunityNoteRetrieveContributorResponse,
            options: options
          )
        end

        # Returns the notes a contributor deleted, newest first. X keeps each note's ID,
        # times, rating & tags. A notice replaces its text & post. Each note costs 1
        # credit. A contributor who deleted none returns an empty list, free.
        #
        # @overload list_contributor_deleted_notes(alias_, cursor: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param alias_ [String] Community Notes contributor alias, or the URL-encoded contributor URL, such as x.com/i/communitynotes/u/ardent-beach-friarbird. Any letter case works.
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] Notes per page (1-10, default 10). A low credit balance can return fewer. Follow next_cursor for more pages. Also read as limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedCommunityNotes]
        #
        # @see XTwitterScraper::Models::X::CommunityNoteListContributorDeletedNotesParams
        def list_contributor_deleted_notes(alias_, params = {})
          parsed, options = XTwitterScraper::Models::X::CommunityNoteListContributorDeletedNotesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/community-notes/contributors/%1$s/deleted-notes", alias_],
            query: query,
            model: XTwitterScraper::Models::PaginatedCommunityNotes,
            options: options
          )
        end

        # Returns a contributor's notes, newest first, each with the post it is on.
        # Includes notes X has not rated helpful. Each note costs 1 credit. Follow
        # next_cursor for more.
        #
        # @overload list_contributor_notes(alias_, cursor: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param alias_ [String] Community Notes contributor alias, or the URL-encoded contributor URL, such as x.com/i/communitynotes/u/ardent-beach-friarbird. Any letter case works.
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] Notes per page (1-10, default 10). A low credit balance can return fewer. Follow next_cursor for more pages. Also read as limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedCommunityNotes]
        #
        # @see XTwitterScraper::Models::X::CommunityNoteListContributorNotesParams
        def list_contributor_notes(alias_, params = {})
          parsed, options = XTwitterScraper::Models::X::CommunityNoteListContributorNotesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/community-notes/contributors/%1$s/notes", alias_],
            query: query,
            model: XTwitterScraper::Models::PaginatedCommunityNotes,
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
