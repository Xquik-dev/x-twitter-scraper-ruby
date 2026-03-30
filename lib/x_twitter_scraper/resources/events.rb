# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Activity events from monitored accounts
    class Events
      # Get event
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::EventDetail]
      #
      # @see XTwitterScraper::Models::EventRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["events/%1$s", id],
          model: XTwitterScraper::EventDetail,
          options: params[:request_options]
        )
      end

      # List events
      #
      # @overload list(after: nil, event_type: nil, limit: nil, monitor_id: nil, request_options: {})
      #
      # @param after [String] Cursor for pagination
      #
      # @param event_type [Symbol, XTwitterScraper::Models::EventType]
      #
      # @param limit [Integer]
      #
      # @param monitor_id [String]
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::EventListResponse]
      #
      # @see XTwitterScraper::Models::EventListParams
      def list(params = {})
        parsed, options = XTwitterScraper::EventListParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "events",
          query: query.transform_keys(event_type: "eventType", monitor_id: "monitorId"),
          model: XTwitterScraper::Models::EventListResponse,
          security: {auth_api_key: true},
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
