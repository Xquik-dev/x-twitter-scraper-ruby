# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Push notification integrations (Telegram)
    class Integrations
      # Create integration
      #
      # @overload create(config:, event_types:, name:, type:, request_options: {})
      #
      # @param config [XTwitterScraper::Models::IntegrationCreateParams::Config] Integration config (e.g. Telegram chatId)
      #
      # @param event_types [Array<Symbol, XTwitterScraper::Models::IntegrationCreateParams::EventType>]
      #
      # @param name [String]
      #
      # @param type [Symbol, XTwitterScraper::Models::IntegrationCreateParams::Type]
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::IntegrationCreateResponse]
      #
      # @see XTwitterScraper::Models::IntegrationCreateParams
      def create(params)
        parsed, options = XTwitterScraper::IntegrationCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "integrations",
          body: parsed,
          model: XTwitterScraper::Models::IntegrationCreateResponse,
          options: options
        )
      end

      # Get integration details
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::IntegrationRetrieveResponse]
      #
      # @see XTwitterScraper::Models::IntegrationRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["integrations/%1$s", id],
          model: XTwitterScraper::Models::IntegrationRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Update integration
      #
      # @overload update(id, event_types: nil, filters: nil, is_active: nil, message_template: nil, name: nil, scope_all_monitors: nil, silent_push: nil, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param event_types [Array<Symbol, XTwitterScraper::Models::IntegrationUpdateParams::EventType>]
      #
      # @param filters [Hash{Symbol=>Object}]
      #
      # @param is_active [Boolean]
      #
      # @param message_template [Hash{Symbol=>Object}]
      #
      # @param name [String]
      #
      # @param scope_all_monitors [Boolean]
      #
      # @param silent_push [Boolean]
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::IntegrationUpdateResponse]
      #
      # @see XTwitterScraper::Models::IntegrationUpdateParams
      def update(id, params = {})
        parsed, options = XTwitterScraper::IntegrationUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["integrations/%1$s", id],
          body: parsed,
          model: XTwitterScraper::Models::IntegrationUpdateResponse,
          options: options
        )
      end

      # List integrations
      #
      # @overload list(request_options: {})
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::IntegrationListResponse]
      #
      # @see XTwitterScraper::Models::IntegrationListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "integrations",
          model: XTwitterScraper::Models::IntegrationListResponse,
          options: params[:request_options]
        )
      end

      # Delete integration
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::IntegrationDeleteResponse]
      #
      # @see XTwitterScraper::Models::IntegrationDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["integrations/%1$s", id],
          model: XTwitterScraper::Models::IntegrationDeleteResponse,
          options: params[:request_options]
        )
      end

      # List integration delivery history
      #
      # @overload list_deliveries(id, limit: nil, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param limit [Integer]
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::IntegrationListDeliveriesResponse]
      #
      # @see XTwitterScraper::Models::IntegrationListDeliveriesParams
      def list_deliveries(id, params = {})
        parsed, options = XTwitterScraper::IntegrationListDeliveriesParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["integrations/%1$s/deliveries", id],
          query: query,
          model: XTwitterScraper::Models::IntegrationListDeliveriesResponse,
          options: options
        )
      end

      # Send test delivery
      #
      # @overload send_test(id, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::IntegrationSendTestResponse]
      #
      # @see XTwitterScraper::Models::IntegrationSendTestParams
      def send_test(id, params = {})
        @client.request(
          method: :post,
          path: ["integrations/%1$s/test", id],
          model: XTwitterScraper::Models::IntegrationSendTestResponse,
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
