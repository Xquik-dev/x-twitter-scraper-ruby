# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Webhook endpoint management & delivery
    class Webhooks
      # Create webhook
      #
      # @overload create(event_types:, url:, request_options: {})
      #
      # @param event_types [Array<Symbol, XTwitterScraper::Models::WebhookCreateParams::EventType>]
      #
      # @param url [String] HTTPS URL
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::WebhookCreateResponse]
      #
      # @see XTwitterScraper::Models::WebhookCreateParams
      def create(params)
        parsed, options = XTwitterScraper::WebhookCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "webhooks",
          body: parsed,
          model: XTwitterScraper::Models::WebhookCreateResponse,
          options: options
        )
      end

      # Update webhook
      #
      # @overload update(id, event_types: nil, is_active: nil, url: nil, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param event_types [Array<Symbol, XTwitterScraper::Models::WebhookUpdateParams::EventType>]
      #
      # @param is_active [Boolean]
      #
      # @param url [String]
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::WebhookUpdateResponse]
      #
      # @see XTwitterScraper::Models::WebhookUpdateParams
      def update(id, params = {})
        parsed, options = XTwitterScraper::WebhookUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["webhooks/%1$s", id],
          body: parsed,
          model: XTwitterScraper::Models::WebhookUpdateResponse,
          options: options
        )
      end

      # List webhooks
      #
      # @overload list(request_options: {})
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::WebhookListResponse]
      #
      # @see XTwitterScraper::Models::WebhookListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "webhooks",
          model: XTwitterScraper::Models::WebhookListResponse,
          options: params[:request_options]
        )
      end

      # Deactivate webhook
      #
      # @overload deactivate(id, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::WebhookDeactivateResponse]
      #
      # @see XTwitterScraper::Models::WebhookDeactivateParams
      def deactivate(id, params = {})
        @client.request(
          method: :delete,
          path: ["webhooks/%1$s", id],
          model: XTwitterScraper::Models::WebhookDeactivateResponse,
          options: params[:request_options]
        )
      end

      # List webhook deliveries
      #
      # @overload list_deliveries(id, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::WebhookListDeliveriesResponse]
      #
      # @see XTwitterScraper::Models::WebhookListDeliveriesParams
      def list_deliveries(id, params = {})
        @client.request(
          method: :get,
          path: ["webhooks/%1$s/deliveries", id],
          model: XTwitterScraper::Models::WebhookListDeliveriesResponse,
          options: params[:request_options]
        )
      end

      # Test webhook endpoint
      #
      # @overload test_(id, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::WebhookTestResponse]
      #
      # @see XTwitterScraper::Models::WebhookTestParams
      def test_(id, params = {})
        @client.request(
          method: :post,
          path: ["webhooks/%1$s/test", id],
          model: XTwitterScraper::Models::WebhookTestResponse,
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
