# typed: strong

module XTwitterScraper
  module Resources
    class X
      # X data lookups (subscription required)
      class Bookmarks
        # Get bookmarked tweets
        sig do
          params(
            cursor: String,
            folder_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::BookmarkListResponse)
        end
        def list(
          # Pagination cursor from previous response
          cursor: nil,
          # Optional bookmark folder ID
          folder_id: nil,
          request_options: {}
        )
        end

        # Get bookmark folders
        sig do
          params(
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse)
        end
        def retrieve_folders(request_options: {})
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
