# typed: strong

module XTwitterScraper
  module Resources
    class X
      # X data lookups (subscription required)
      class Lists
        # Get list followers
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::ListRetrieveFollowersResponse)
        end
        def retrieve_followers(
          # List ID
          id,
          # Pagination cursor for list followers
          cursor: nil,
          request_options: {}
        )
        end

        # Get list members
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::ListRetrieveMembersResponse)
        end
        def retrieve_members(
          # List ID for member lookup
          id,
          # Pagination cursor for list members
          cursor: nil,
          request_options: {}
        )
        end

        # Get list tweets
        sig do
          params(
            id: String,
            cursor: String,
            include_replies: T::Boolean,
            since_time: String,
            until_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::ListRetrieveTweetsResponse)
        end
        def retrieve_tweets(
          # List ID for tweet lookup
          id,
          # Pagination cursor for list tweets
          cursor: nil,
          # Include replies (default false)
          include_replies: nil,
          # Unix timestamp - filter after
          since_time: nil,
          # Unix timestamp - filter before
          until_time: nil,
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
