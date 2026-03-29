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
          ).void
        end
        def retrieve_followers(
          # List ID
          id,
          # Pagination cursor
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
          ).void
        end
        def retrieve_members(
          # List ID
          id,
          # Pagination cursor
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
          ).void
        end
        def retrieve_tweets(
          # List ID
          id,
          # Pagination cursor
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
