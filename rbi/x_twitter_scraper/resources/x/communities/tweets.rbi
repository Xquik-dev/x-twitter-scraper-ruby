# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X data lookups (subscription required)
        class Tweets
          # Search tweets across all communities
          sig do
            params(
              q: String,
              cursor: String,
              query_type: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(
              XTwitterScraper::Models::X::Communities::TweetListResponse
            )
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
