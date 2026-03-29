# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class Bot
      # Telegram bot service endpoints
      class PlatformLinks
        # Link a platform user to an Xquik account
        #
        # @overload create(platform:, platform_user_id:, request_options: {})
        #
        # @param platform [Symbol, XTwitterScraper::Models::Bot::PlatformLinkCreateParams::Platform]
        # @param platform_user_id [String]
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::Bot::PlatformLinkCreateResponse]
        #
        # @see XTwitterScraper::Models::Bot::PlatformLinkCreateParams
        def create(params)
          parsed, options = XTwitterScraper::Bot::PlatformLinkCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "bot/platform-links",
            body: parsed,
            model: XTwitterScraper::Models::Bot::PlatformLinkCreateResponse,
            options: options
          )
        end

        # Unlink a platform user from an Xquik account
        #
        # @overload delete(platform:, platform_user_id:, request_options: {})
        #
        # @param platform [Symbol, XTwitterScraper::Models::Bot::PlatformLinkDeleteParams::Platform]
        # @param platform_user_id [String]
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::Bot::PlatformLinkDeleteResponse]
        #
        # @see XTwitterScraper::Models::Bot::PlatformLinkDeleteParams
        def delete(params)
          parsed, options = XTwitterScraper::Bot::PlatformLinkDeleteParams.dump_request(params)
          @client.request(
            method: :delete,
            path: "bot/platform-links",
            body: parsed,
            model: XTwitterScraper::Models::Bot::PlatformLinkDeleteResponse,
            options: options
          )
        end

        # Look up an Xquik user by platform identity
        #
        # @overload lookup(platform:, platform_user_id:, request_options: {})
        #
        # @param platform [String]
        # @param platform_user_id [String]
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::Bot::PlatformLinkLookupResponse]
        #
        # @see XTwitterScraper::Models::Bot::PlatformLinkLookupParams
        def lookup(params)
          parsed, options = XTwitterScraper::Bot::PlatformLinkLookupParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "bot/platform-links/lookup",
            query: query.transform_keys(platform_user_id: "platformUserId"),
            model: XTwitterScraper::Models::Bot::PlatformLinkLookupResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
