# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # API key management (session auth only)
    class APIKeys
      # Create API key
      #
      # @overload create(name: nil, request_options: {})
      #
      # @param name [String]
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::APIKeyCreateResponse]
      #
      # @see XTwitterScraper::Models::APIKeyCreateParams
      def create(params = {})
        parsed, options = XTwitterScraper::APIKeyCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api-keys",
          body: parsed,
          model: XTwitterScraper::Models::APIKeyCreateResponse,
          security: {auth_api_key: true},
          options: options
        )
      end

      # List API keys
      #
      # @overload list(request_options: {})
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::APIKeyListResponse]
      #
      # @see XTwitterScraper::Models::APIKeyListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "api-keys",
          model: XTwitterScraper::Models::APIKeyListResponse,
          security: {auth_api_key: true},
          options: params[:request_options]
        )
      end

      # Revoke API key
      #
      # @overload revoke(id, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::APIKeyRevokeResponse]
      #
      # @see XTwitterScraper::Models::APIKeyRevokeParams
      def revoke(id, params = {})
        @client.request(
          method: :delete,
          path: ["api-keys/%1$s", id],
          model: XTwitterScraper::Models::APIKeyRevokeResponse,
          security: {auth_api_key: true},
          options: params[:request_options]
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
