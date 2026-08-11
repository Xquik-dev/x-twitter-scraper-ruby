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
            idempotency_key: String,
            description: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::CommunityCreateResponse)
        end
        def create(
          # Body param: X account (@username or ID) creating the community
          account:,
          # Body param: Community name
          name:,
          # Header param: Generate one unique value for each intended write. Reuse it only
          # when retrying the exact same account, action, target, and payload. A reused key
          # returns the original action. Reusing it with different input returns 409. Replay
          # protection remains active for at least 90 days.
          idempotency_key:,
          # Body param: Community description
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
            idempotency_key: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::CommunityDeleteResponse)
        end
        def delete(
          # Path param: Resource ID returned by the matching create or list endpoint.
          id,
          # Body param: X account (@username or ID) deleting the community
          account:,
          # Body param: Community name for confirmation
          community_name:,
          # Header param: Generate one unique value for each intended write. Reuse it only
          # when retrying the exact same account, action, target, and payload. A reused key
          # returns the original action. Reusing it with different input returns 409. Replay
          # protection remains active for at least 90 days.
          idempotency_key:,
          request_options: {}
        )
        end

        # Get community name, description and member count
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
            bio_contains: String,
            cursor: String,
            has_location: T::Boolean,
            has_website: T::Boolean,
            location_contains: String,
            max_followers: Integer,
            max_following: Integer,
            max_statuses: Integer,
            min_account_age_days: Integer,
            min_followers: Integer,
            min_following: Integer,
            min_statuses: Integer,
            page_size: Integer,
            username_contains: String,
            verified_only: T::Boolean,
            verified_type: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_members(
          # Community ID for member lookup
          id,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Pagination cursor
          cursor: nil,
          # Only return profiles with a location.
          has_location: nil,
          # Only return profiles with a website.
          has_website: nil,
          # Match a location substring, ignoring case.
          location_contains: nil,
          # Maximum follower count. Missing counts pass this maximum.
          max_followers: nil,
          # Maximum following count.
          max_following: nil,
          # Maximum post count. maxPosts is also accepted.
          max_statuses: nil,
          # Minimum account age in whole days.
          min_account_age_days: nil,
          # Minimum follower count. Filtering happens before billing.
          min_followers: nil,
          # Minimum following count.
          min_following: nil,
          # Minimum post count. minPosts is also accepted.
          min_statuses: nil,
          # Items per page (20-200, default 20). This is an upper bound for paid
          # authenticated calls: remaining credits can reduce the returned page size, and
          # zero affordable results returns 402 insufficient_credits.
          page_size: nil,
          # Match a username substring, ignoring case.
          username_contains: nil,
          # Only return verified profiles.
          verified_only: nil,
          # Match the verification type exactly, ignoring case.
          verified_type: nil,
          request_options: {}
        )
        end

        # List moderators of a community
        sig do
          params(
            id: String,
            bio_contains: String,
            cursor: String,
            has_location: T::Boolean,
            has_website: T::Boolean,
            location_contains: String,
            max_followers: Integer,
            max_following: Integer,
            max_statuses: Integer,
            min_account_age_days: Integer,
            min_followers: Integer,
            min_following: Integer,
            min_statuses: Integer,
            username_contains: String,
            verified_only: T::Boolean,
            verified_type: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_moderators(
          # Community ID for moderator lookup
          id,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Pagination cursor for community moderators
          cursor: nil,
          # Only return profiles with a location.
          has_location: nil,
          # Only return profiles with a website.
          has_website: nil,
          # Match a location substring, ignoring case.
          location_contains: nil,
          # Maximum follower count. Missing counts pass this maximum.
          max_followers: nil,
          # Maximum following count.
          max_following: nil,
          # Maximum post count. maxPosts is also accepted.
          max_statuses: nil,
          # Minimum account age in whole days.
          min_account_age_days: nil,
          # Minimum follower count. Filtering happens before billing.
          min_followers: nil,
          # Minimum following count.
          min_following: nil,
          # Minimum post count. minPosts is also accepted.
          min_statuses: nil,
          # Match a username substring, ignoring case.
          username_contains: nil,
          # Only return verified profiles.
          verified_only: nil,
          # Match the verification type exactly, ignoring case.
          verified_type: nil,
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
          # Maximum page items (1-100, default 20). Source, filters, or credits can reduce
          # results. Continue while has_next_page is true. Deprecated limit and count
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
