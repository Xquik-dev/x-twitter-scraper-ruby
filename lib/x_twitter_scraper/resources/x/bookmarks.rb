# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # X data lookups (subscription required)
      class Bookmarks
        # Get bookmarked tweets
        #
        # @overload list(cursor: nil, folder_id: nil, request_options: {})
        #
        # @param cursor [String] Pagination cursor for bookmarks
        #
        # @param folder_id [String] Optional bookmark folder ID
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Internal::CursorPage<XTwitterScraper::Models::PaginatedTweets>]
        #
        # @see XTwitterScraper::Models::X::BookmarkListParams
        def list(params = {})
          parsed, options = XTwitterScraper::X::BookmarkListParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/bookmarks",
            query: query.transform_keys(folder_id: "folderId"),
            page: XTwitterScraper::Internal::CursorPage,
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Get bookmark folders
        #
        # @overload retrieve_folders(request_options: {})
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse]
        #
        # @see XTwitterScraper::Models::X::BookmarkRetrieveFoldersParams
        def retrieve_folders(params = {})
          @client.request(
            method: :get,
            path: "x/bookmarks/folders",
            model: XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse,
            options: params[:request_options]
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
