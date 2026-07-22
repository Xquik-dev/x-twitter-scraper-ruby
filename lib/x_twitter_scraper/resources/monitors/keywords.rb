# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class Monitors
      # X account monitoring with 1-second checks
      class Keywords
        # Creates a keyword monitor. Keyword monitors are unlimited. Active monitors check
        # every 1 second and cost 21 credits per hour. Events and webhook deliveries are
        # included. Creation requires available credits for the first hourly charge.
        #
        # @overload create(event_types:, query:, request_options: {})
        #
        # @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
        #
        # @param query [String] X search query to monitor. Whitespace is normalized.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::Monitors::KeywordCreateResponse]
        #
        # @see XTwitterScraper::Models::Monitors::KeywordCreateParams
        def create(params)
          parsed, options = XTwitterScraper::Monitors::KeywordCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "monitors/keywords",
            body: parsed,
            model: XTwitterScraper::Models::Monitors::KeywordCreateResponse,
            options: options
          )
        end

        # Get keyword monitor
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Resource ID returned by the matching create or list endpoint.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::Monitors::KeywordRetrieveResponse]
        #
        # @see XTwitterScraper::Models::Monitors::KeywordRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["monitors/keywords/%1$s", id],
            model: XTwitterScraper::Models::Monitors::KeywordRetrieveResponse,
            options: params[:request_options]
          )
        end

        # Update keyword monitor
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
        # @return [XTwitterScraper::Models::Monitors::KeywordUpdateResponse]
        #
        # @see XTwitterScraper::Models::Monitors::KeywordUpdateParams
        def update(id, params = {})
          parsed, options = XTwitterScraper::Monitors::KeywordUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: ["monitors/keywords/%1$s", id],
            body: parsed,
            model: XTwitterScraper::Models::Monitors::KeywordUpdateResponse,
            options: options
          )
        end

        # List keyword monitors
        #
        # @overload list(request_options: {})
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::Monitors::KeywordListResponse]
        #
        # @see XTwitterScraper::Models::Monitors::KeywordListParams
        def list(params = {})
          @client.request(
            method: :get,
            path: "monitors/keywords",
            model: XTwitterScraper::Models::Monitors::KeywordListResponse,
            options: params[:request_options]
          )
        end

        # Delete keyword monitor
        #
        # @overload deactivate(id, request_options: {})
        #
        # @param id [String] Resource ID returned by the matching create or list endpoint.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::Monitors::KeywordDeactivateResponse]
        #
        # @see XTwitterScraper::Models::Monitors::KeywordDeactivateParams
        def deactivate(id, params = {})
          @client.request(
            method: :delete,
            path: ["monitors/keywords/%1$s", id],
            model: XTwitterScraper::Models::Monitors::KeywordDeactivateResponse,
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
end
