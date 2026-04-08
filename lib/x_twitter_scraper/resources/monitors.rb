# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Real-time X account monitoring
    class Monitors
      # Create monitor
      #
      # @overload create(event_types:, username:, request_options: {})
      #
      # @param event_types [Array<Symbol, XTwitterScraper::Models::MonitorCreateParams::EventType>] Array of event types to subscribe to.
      #
      # @param username [String] X username (without @)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::MonitorCreateResponse]
      #
      # @see XTwitterScraper::Models::MonitorCreateParams
      def create(params)
        parsed, options = XTwitterScraper::MonitorCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "monitors",
          body: parsed,
          model: XTwitterScraper::Models::MonitorCreateResponse,
          options: options
        )
      end

      # Get monitor
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::MonitorRetrieveResponse]
      #
      # @see XTwitterScraper::Models::MonitorRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["monitors/%1$s", id],
          model: XTwitterScraper::Models::MonitorRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Update monitor
      #
      # @overload update(id, event_types: nil, is_active: nil, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param event_types [Array<Symbol, XTwitterScraper::Models::MonitorUpdateParams::EventType>] Array of event types to subscribe to.
      #
      # @param is_active [Boolean]
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::MonitorUpdateResponse]
      #
      # @see XTwitterScraper::Models::MonitorUpdateParams
      def update(id, params = {})
        parsed, options = XTwitterScraper::MonitorUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["monitors/%1$s", id],
          body: parsed,
          model: XTwitterScraper::Models::MonitorUpdateResponse,
          options: options
        )
      end

      # List monitors
      #
      # @overload list(request_options: {})
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::MonitorListResponse]
      #
      # @see XTwitterScraper::Models::MonitorListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "monitors",
          model: XTwitterScraper::Models::MonitorListResponse,
          options: params[:request_options]
        )
      end

      # Deactivate monitor
      #
      # @overload deactivate(id, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::MonitorDeactivateResponse]
      #
      # @see XTwitterScraper::Models::MonitorDeactivateParams
      def deactivate(id, params = {})
        @client.request(
          method: :delete,
          path: ["monitors/%1$s", id],
          model: XTwitterScraper::Models::MonitorDeactivateResponse,
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
