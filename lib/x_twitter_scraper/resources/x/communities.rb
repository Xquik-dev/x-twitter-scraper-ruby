# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X write actions (tweets, likes, follows, DMs)
        # @return [XTwitterScraper::Resources::X::Communities::Join]
        attr_reader :join

        # X data lookups (subscription required)
        # @return [XTwitterScraper::Resources::X::Communities::Tweets]
        attr_reader :tweets

        # Create community
        #
        # @overload create(account:, name:, description: nil, request_options: {})
        #
        # @param account [String] X account (@username or ID) creating the community
        #
        # @param name [String] Community name
        #
        # @param description [String] Community description
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::CommunityCreateResponse]
        #
        # @see XTwitterScraper::Models::X::CommunityCreateParams
        def create(params)
          parsed, options = XTwitterScraper::X::CommunityCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/communities",
            body: parsed,
            model: XTwitterScraper::Models::X::CommunityCreateResponse,
            options: options
          )
        end

        # Delete community
        #
        # @overload delete(id, account:, community_name:, request_options: {})
        #
        # @param id [String] Resource ID (stringified bigint)
        #
        # @param account [String] X account (@username or ID) deleting the community
        #
        # @param community_name [String] Community name for confirmation
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::CommunityDeleteResponse]
        #
        # @see XTwitterScraper::Models::X::CommunityDeleteParams
        def delete(id, params)
          parsed, options = XTwitterScraper::X::CommunityDeleteParams.dump_request(params)
          @client.request(
            method: :delete,
            path: ["x/communities/%1$s", id],
            body: parsed,
            model: XTwitterScraper::Models::X::CommunityDeleteResponse,
            options: options
          )
        end

        # Get community details
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

        # Get community members
        #
        # @overload retrieve_members(id, cursor: nil, request_options: {})
        #
        # @param id [String] Community ID for member lookup
        #
        # @param cursor [String] Pagination cursor
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::CommunityRetrieveMembersResponse]
        #
        # @see XTwitterScraper::Models::X::CommunityRetrieveMembersParams
        def retrieve_members(id, params = {})
          parsed, options = XTwitterScraper::X::CommunityRetrieveMembersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/communities/%1$s/members", id],
            query: query,
            model: XTwitterScraper::Models::X::CommunityRetrieveMembersResponse,
            options: options
          )
        end

        # Get community moderators
        #
        # @overload retrieve_moderators(id, cursor: nil, request_options: {})
        #
        # @param id [String] Community ID for moderator lookup
        #
        # @param cursor [String] Pagination cursor for community moderators
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::CommunityRetrieveModeratorsResponse]
        #
        # @see XTwitterScraper::Models::X::CommunityRetrieveModeratorsParams
        def retrieve_moderators(id, params = {})
          parsed, options = XTwitterScraper::X::CommunityRetrieveModeratorsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/communities/%1$s/moderators", id],
            query: query,
            model: XTwitterScraper::Models::X::CommunityRetrieveModeratorsResponse,
            options: options
          )
        end

        # Search tweets across communities
        #
        # @overload retrieve_search(q:, cursor: nil, query_type: nil, request_options: {})
        #
        # @param q [String] Search query
        #
        # @param cursor [String] Pagination cursor for community search
        #
        # @param query_type [String] Sort order (Latest or Top)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::CommunityRetrieveSearchResponse]
        #
        # @see XTwitterScraper::Models::X::CommunityRetrieveSearchParams
        def retrieve_search(params)
          parsed, options = XTwitterScraper::X::CommunityRetrieveSearchParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/communities/search",
            query: query.transform_keys(query_type: "queryType"),
            model: XTwitterScraper::Models::X::CommunityRetrieveSearchResponse,
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
