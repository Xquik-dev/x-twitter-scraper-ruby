# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X Community info, members, and tweets
        class Tweets
          # Requires a Community ID and keyword query.
          sig do
            params(
              community_id: String,
              q: String,
              cursor: String,
              page_size: Integer,
              query_type:
                XTwitterScraper::X::Communities::TweetListParams::QueryType::OrSymbol,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(XTwitterScraper::PaginatedTweets)
          end
          def list(
            # Numeric ID of the community to search
            community_id:,
            # Keyword query within the selected community
            q:,
            # Pagination cursor for community results
            cursor: nil,
            # Maximum items requested from this page (1-100, default 20). The response can
            # contain fewer items because the source returned fewer, filters removed items, or
            # remaining credits cover fewer results. Keep requesting next_cursor while
            # has_next_page is true, even when a page is empty. The deprecated limit and count
            # aliases remain accepted.
            page_size: nil,
            # Sort order for community results (Latest or Top)
            query_type: nil,
            request_options: {}
          )
          end

          # List tweets posted in a community
          sig do
            params(
              id: String,
              cursor: String,
              page_size: Integer,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(XTwitterScraper::PaginatedTweets)
          end
          def list_by_community(
            # Community ID for tweet lookup
            id,
            # Pagination cursor for community tweets
            cursor: nil,
            # Maximum items requested from this page (1-100, default 20). The response can
            # contain fewer items because the source returned fewer, filters removed items, or
            # remaining credits cover fewer results. Keep requesting next_cursor while
            # has_next_page is true, even when a page is empty. The deprecated limit and count
            # aliases remain accepted.
            page_size: nil,
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
end
