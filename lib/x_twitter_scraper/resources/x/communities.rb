# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X write actions (tweets, likes, follows, DMs)
        # @return [XTwitterScraper::Resources::X::Communities::Join]
        attr_reader :join

        # X Community info, members, and tweets
        # @return [XTwitterScraper::Resources::X::Communities::Tweets]
        attr_reader :tweets

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::CommunityCreateParams} for more details.
        #
        # Create community
        #
        # @overload create(account:, name:, idempotency_key:, description: nil, request_options: {})
        #
        # @param account [String] Body param: X account (@username or ID) creating the community
        #
        # @param name [String] Body param: Community name
        #
        # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
        #
        # @param description [String] Body param: Community description
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::CommunityCreateResponse]
        #
        # @see XTwitterScraper::Models::X::CommunityCreateParams
        def create(params)
          parsed, options = XTwitterScraper::X::CommunityCreateParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :post,
            path: "x/communities",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: XTwitterScraper::Models::X::CommunityCreateResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::CommunityDeleteParams} for more details.
        #
        # Delete community
        #
        # @overload delete(id, account:, community_name:, idempotency_key:, request_options: {})
        #
        # @param id [String] Path param: Resource ID returned by the matching create or list endpoint.
        #
        # @param account [String] Body param: X account (@username or ID) deleting the community
        #
        # @param community_name [String] Body param: Community name for confirmation
        #
        # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::CommunityDeleteResponse]
        #
        # @see XTwitterScraper::Models::X::CommunityDeleteParams
        def delete(id, params)
          parsed, options = XTwitterScraper::X::CommunityDeleteParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :delete,
            path: ["x/communities/%1$s", id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: XTwitterScraper::Models::X::CommunityDeleteResponse,
            options: options
          )
        end

        # Get community name, description and member count
        #
        # @overload retrieve_info(id, request_options: {})
        #
        # @param id [String] Community ID
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::CommunityRetrieveInfoResponse]
        #
        # @see XTwitterScraper::Models::X::CommunityRetrieveInfoParams
        def retrieve_info(id, params = {})
          @client.request(
            method: :get,
            path: ["x/communities/%1$s/info", id],
            model: XTwitterScraper::Models::X::CommunityRetrieveInfoResponse,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::CommunityRetrieveMembersParams} for more details.
        #
        # List members of a community
        #
        # @overload retrieve_members(id, bio_contains: nil, cursor: nil, has_location: nil, has_website: nil, location_contains: nil, max_followers: nil, max_following: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param id [String] Community ID for member lookup
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param cursor [String] Pagination cursor
        #
        # @param has_location [Boolean] Only return profiles with a location.
        #
        # @param has_website [Boolean] Only return profiles with a website.
        #
        # @param location_contains [String] Match a location substring, ignoring case.
        #
        # @param max_followers [Integer] Maximum follower count. Missing counts pass this maximum.
        #
        # @param max_following [Integer] Maximum following count.
        #
        # @param max_statuses [Integer] Maximum post count. maxPosts is also accepted.
        #
        # @param min_account_age_days [Integer] Minimum account age in whole days.
        #
        # @param min_followers [Integer] Minimum follower count. Filtering happens before billing.
        #
        # @param min_following [Integer] Minimum following count.
        #
        # @param min_statuses [Integer] Minimum post count. minPosts is also accepted.
        #
        # @param page_size [Integer] Items per page (20-200, default 20). This is an upper bound for paid authenticat
        #
        # @param username_contains [String] Match a username substring, ignoring case.
        #
        # @param verified_only [Boolean] Only return verified profiles.
        #
        # @param verified_type [String] Match the verification type exactly, ignoring case.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::CommunityRetrieveMembersParams
        def retrieve_members(id, params = {})
          parsed, options = XTwitterScraper::X::CommunityRetrieveMembersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/communities/%1$s/members", id],
            query: query.transform_keys(
              bio_contains: "bioContains",
              has_location: "hasLocation",
              has_website: "hasWebsite",
              location_contains: "locationContains",
              max_followers: "maxFollowers",
              max_following: "maxFollowing",
              max_statuses: "maxStatuses",
              min_account_age_days: "minAccountAgeDays",
              min_followers: "minFollowers",
              min_following: "minFollowing",
              min_statuses: "minStatuses",
              page_size: "pageSize",
              username_contains: "usernameContains",
              verified_only: "verifiedOnly",
              verified_type: "verifiedType"
            ),
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::CommunityRetrieveModeratorsParams} for more
        # details.
        #
        # List moderators of a community
        #
        # @overload retrieve_moderators(id, bio_contains: nil, cursor: nil, has_location: nil, has_website: nil, location_contains: nil, max_followers: nil, max_following: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param id [String] Community ID for moderator lookup
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param cursor [String] Pagination cursor for community moderators
        #
        # @param has_location [Boolean] Only return profiles with a location.
        #
        # @param has_website [Boolean] Only return profiles with a website.
        #
        # @param location_contains [String] Match a location substring, ignoring case.
        #
        # @param max_followers [Integer] Maximum follower count. Missing counts pass this maximum.
        #
        # @param max_following [Integer] Maximum following count.
        #
        # @param max_statuses [Integer] Maximum post count. maxPosts is also accepted.
        #
        # @param min_account_age_days [Integer] Minimum account age in whole days.
        #
        # @param min_followers [Integer] Minimum follower count. Filtering happens before billing.
        #
        # @param min_following [Integer] Minimum following count.
        #
        # @param min_statuses [Integer] Minimum post count. minPosts is also accepted.
        #
        # @param username_contains [String] Match a username substring, ignoring case.
        #
        # @param verified_only [Boolean] Only return verified profiles.
        #
        # @param verified_type [String] Match the verification type exactly, ignoring case.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::CommunityRetrieveModeratorsParams
        def retrieve_moderators(id, params = {})
          parsed, options = XTwitterScraper::X::CommunityRetrieveModeratorsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/communities/%1$s/moderators", id],
            query: query.transform_keys(
              bio_contains: "bioContains",
              has_location: "hasLocation",
              has_website: "hasWebsite",
              location_contains: "locationContains",
              max_followers: "maxFollowers",
              max_following: "maxFollowing",
              max_statuses: "maxStatuses",
              min_account_age_days: "minAccountAgeDays",
              min_followers: "minFollowers",
              min_following: "minFollowing",
              min_statuses: "minStatuses",
              username_contains: "usernameContains",
              verified_only: "verifiedOnly",
              verified_type: "verifiedType"
            ),
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::CommunityRetrieveSearchParams} for more details.
        #
        # Returns tweets, not community records. Requires a Community ID.
        #
        # @overload retrieve_search(community_id:, q:, cursor: nil, page_size: nil, query_type: nil, request_options: {})
        #
        # @param community_id [String] Numeric ID of the community whose posts to search
        #
        # @param q [String] Search query
        #
        # @param cursor [String] Pagination cursor for community search
        #
        # @param page_size [Integer] Maximum page items (1-100, default 20). Source, filters, or credits can reduce r
        #
        # @param query_type [Symbol, XTwitterScraper::Models::X::CommunityRetrieveSearchParams::QueryType] Sort order (Latest or Top)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::CommunityRetrieveSearchParams
        def retrieve_search(params)
          parsed, options = XTwitterScraper::X::CommunityRetrieveSearchParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/communities/search",
            query: query.transform_keys(
              community_id: "communityId",
              page_size: "pageSize",
              query_type: "queryType"
            ),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
          @join = XTwitterScraper::Resources::X::Communities::Join.new(client: client)
          @tweets = XTwitterScraper::Resources::X::Communities::Tweets.new(client: client)
        end
      end
    end
  end
end
