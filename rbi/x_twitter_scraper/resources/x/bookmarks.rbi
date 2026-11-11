# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      # Look up, search, and analyze individual tweets
      class Bookmarks
        # Get bookmarked tweets
        sig do
          params(
            cursor: String,
            folder_id: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def list(
          # Pagination cursor for bookmarks
          cursor: nil,
          # Optional bookmark folder ID
          folder_id: nil,
          # Items per page, 1 to 100, default 20. Source, filters or credits can return fewer. Follow next_cursor for more pages.
          page_size: nil,
          request_options: {}
        )
        end

        # Get bookmark folders
        sig do
          params(
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse)
        end
        def retrieve_folders(
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
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
