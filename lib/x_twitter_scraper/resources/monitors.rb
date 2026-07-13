# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Real-time X account monitoring
    class Monitors
      # Real-time X account monitoring
      # @return [XTwitterScraper::Resources::Monitors::Keywords]
      attr_reader :keywords

      # Creates an instant monitor. Monitors are unlimited. Active monitors check every
      # 1 second and cost 21 credits per hour. Events and webhook deliveries are
      # included. Creation requires available credits for the first hourly charge and
      # username lookup.
      #
      # @overload create(event_types:, username:, request_options: {})
      #
      # @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
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
      # @param id [String] Resource ID returned by the matching create or list endpoint.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::Monitor]
      #
      # @see XTwitterScraper::Models::MonitorRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["monitors/%1$s", id],
          model: XTwitterScraper::Monitor,
          options: params[:request_options]
        )
      end

      # Update monitor
      #
      # @overload update(id, event_types: nil, is_active: nil, request_options: {})
      #
      # @param id [String] Resource ID returned by the matching create or list endpoint.
      #
      # @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
      #
      # @param is_active [Boolean]
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::Monitor]
      #
      # @see XTwitterScraper::Models::MonitorUpdateParams
      def update(id, params = {})
        parsed, options = XTwitterScraper::MonitorUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["monitors/%1$s", id],
          body: parsed,
          model: XTwitterScraper::Monitor,
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

      # Delete monitor
      #
      # @overload deactivate(id, request_options: {})
      #
      # @param id [String] Resource ID returned by the matching create or list endpoint.
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
        @keywords = XTwitterScraper::Resources::Monitors::Keywords.new(client: client)
      end
    end
  end
end
