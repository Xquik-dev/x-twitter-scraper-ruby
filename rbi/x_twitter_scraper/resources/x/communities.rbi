# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X write actions (tweets, likes, follows, DMs)
        sig { returns(XTwitterScraper::Resources::X::Communities::Join) }
        attr_reader :join

        # X Community info, members, and tweets
        sig { returns(XTwitterScraper::Resources::X::Communities::Tweets) }
        attr_reader :tweets

        # Create community
        sig do
          params(
            account: String,
            name: String,
            description: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::CommunityCreateResponse)
        end
        def create(
          # X account (@username or ID) creating the community
          account:,
          # Community name
          name:,
          # Community description
          description: nil,
          request_options: {}
        )
        end

        # Delete community
        sig do
          params(
            id: String,
            account: String,
            community_name: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::CommunityDeleteResponse)
        end
        def delete(
          # Resource ID returned by the matching create or list endpoint.
          id,
          # X account (@username or ID) deleting the community
          account:,
          # Community name for confirmation
          community_name:,
          request_options: {}
        )
        end

        # Get community name, description & member count
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::CommunityRetrieveInfoResponse)
        end
        def retrieve_info(
          # Community ID
          id,
          request_options: {}
        )
        end

        # List members of a community
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_members(
          # Community ID for member lookup
          id,
          # Pagination cursor
          cursor: nil,
          # Items per page (20-200, default 20). This is an upper bound for paid
          # authenticated calls: remaining credits can reduce the returned page size, and
          # zero affordable results returns 402 insufficient_credits.
          page_size: nil,
          request_options: {}
        )
        end

        # List moderators of a community
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_moderators(
          # Community ID for moderator lookup
          id,
          # Pagination cursor for community moderators
          cursor: nil,
          request_options: {}
        )
        end

        # Returns tweets, not community records. Requires a Community ID.
        sig do
          params(
            community_id: String,
            q: String,
            cursor: String,
            page_size: Integer,
            query_type:
              XTwitterScraper::X::CommunityRetrieveSearchParams::QueryType::OrSymbol,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def retrieve_search(
          # Numeric ID of the community whose posts to search
          community_id:,
          # Search query
          q:,
          # Pagination cursor for community search
          cursor: nil,
          # Maximum items requested from this page (1-100, default 20). The response can
          # contain fewer items because the source returned fewer, filters removed items, or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true, even when a page is empty. The deprecated limit and count
          # aliases remain accepted.
          page_size: nil,
          # Sort order (Latest or Top)
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
