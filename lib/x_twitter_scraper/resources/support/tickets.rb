# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class Support
      # Support ticket management
      class Tickets
        # Create a support ticket
        #
        # @overload create(body:, subject:, request_options: {})
        #
        # @param body [String]
        # @param subject [String]
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::Support::TicketCreateResponse]
        #
        # @see XTwitterScraper::Models::Support::TicketCreateParams
        def create(params)
          parsed, options = XTwitterScraper::Support::TicketCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "support/tickets",
            body: parsed,
            model: XTwitterScraper::Models::Support::TicketCreateResponse,
            options: options
          )
        end

        # Get ticket with all messages
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Support ticket public ID
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::Support::TicketRetrieveResponse]
        #
        # @see XTwitterScraper::Models::Support::TicketRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["support/tickets/%1$s", id],
            model: XTwitterScraper::Models::Support::TicketRetrieveResponse,
            options: params[:request_options]
          )
        end

        # Update ticket status
        #
        # @overload update(id, status:, request_options: {})
        #
        # @param id [String] Support ticket public ID to update
        #
        # @param status [Symbol, XTwitterScraper::Models::Support::TicketUpdateParams::Status]
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::Support::TicketUpdateResponse]
        #
        # @see XTwitterScraper::Models::Support::TicketUpdateParams
        def update(id, params)
          parsed, options = XTwitterScraper::Support::TicketUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: ["support/tickets/%1$s", id],
            body: parsed,
            model: XTwitterScraper::Models::Support::TicketUpdateResponse,
            options: options
          )
        end

        # List user's support tickets
        #
        # @overload list(request_options: {})
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::Support::TicketListResponse]
        #
        # @see XTwitterScraper::Models::Support::TicketListParams
        def list(params = {})
          @client.request(
            method: :get,
            path: "support/tickets",
            model: XTwitterScraper::Models::Support::TicketListResponse,
            options: params[:request_options]
          )
        end

        # Reply to a support ticket
        #
        # @overload reply(id, body:, request_options: {})
        #
        # @param id [String] Support ticket public ID for the reply
        #
        # @param body [String]
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::Support::TicketReplyResponse]
        #
        # @see XTwitterScraper::Models::Support::TicketReplyParams
        def reply(id, params)
          parsed, options = XTwitterScraper::Support::TicketReplyParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["support/tickets/%1$s/messages", id],
            body: parsed,
            model: XTwitterScraper::Models::Support::TicketReplyResponse,
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
