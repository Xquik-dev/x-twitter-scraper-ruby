# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X Community info, members, and tweets
        class Tweets
          # List tweets across all communities
          sig do
            params(
              q: String,
              cursor: String,
              query_type: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(XTwitterScraper::PaginatedTweets)
          end
          def list(
            # Search query for cross-community tweets
            q:,
            # Pagination cursor for cross-community results
            cursor: nil,
            # Sort order for cross-community results (Latest or Top)
            query_type: nil,
            request_options: {}
          )
          end

          # List tweets posted in a community
          sig do
            params(
              id: String,
              cursor: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(XTwitterScraper::PaginatedTweets)
          end
          def list_by_community(
            # Community ID for tweet lookup
            id,
            # Pagination cursor for community tweets
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
end
