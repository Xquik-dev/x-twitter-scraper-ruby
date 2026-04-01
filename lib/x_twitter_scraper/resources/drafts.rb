# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Tweet composition, drafts, writing styles & radar
    class Drafts
      # Save a tweet draft
      #
      # @overload create(text:, goal: nil, topic: nil, request_options: {})
      #
      # @param text [String]
      # @param goal [Symbol, XTwitterScraper::Models::DraftCreateParams::Goal]
      # @param topic [String]
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::DraftCreateResponse]
      #
      # @see XTwitterScraper::Models::DraftCreateParams
      def create(params)
        parsed, options = XTwitterScraper::DraftCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "drafts",
          body: parsed,
          model: XTwitterScraper::Models::DraftCreateResponse,
          options: options
        )
      end

      # Get draft by ID
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::DraftRetrieveResponse]
      #
      # @see XTwitterScraper::Models::DraftRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["drafts/%1$s", id],
          model: XTwitterScraper::Models::DraftRetrieveResponse,
          options: params[:request_options]
        )
      end

      # List saved drafts
      #
      # @overload list(after_cursor: nil, limit: nil, request_options: {})
      #
      # @param after_cursor [String] Cursor for pagination
      #
      # @param limit [Integer]
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::DraftListResponse]
      #
      # @see XTwitterScraper::Models::DraftListParams
      def list(params = {})
        parsed, options = XTwitterScraper::DraftListParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "drafts",
          query: query.transform_keys(after_cursor: "afterCursor"),
          model: XTwitterScraper::Models::DraftListResponse,
          options: options
        )
      end

      # Delete a draft
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see XTwitterScraper::Models::DraftDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["drafts/%1$s", id],
          model: NilClass,
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
