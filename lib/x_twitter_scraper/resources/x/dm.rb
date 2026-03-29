# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Dm
        # Send direct message
        #
        # @overload update(user_id, account:, text:, media_ids: nil, reply_to_message_id: nil, request_options: {})
        #
        # @param user_id [String] Recipient user ID
        #
        # @param account [String] X account (@username or account ID)
        #
        # @param text [String]
        #
        # @param media_ids [Array<String>]
        #
        # @param reply_to_message_id [String]
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::DmUpdateResponse]
        #
        # @see XTwitterScraper::Models::X::DmUpdateParams
        def update(user_id, params)
          parsed, options = XTwitterScraper::X::DmUpdateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["x/dm/%1$s", user_id],
            body: parsed,
            model: XTwitterScraper::Models::X::DmUpdateResponse,
            options: options
          )
        end

        # Get DM conversation history
        #
        # @overload retrieve_history(user_id, cursor: nil, max_id: nil, request_options: {})
        #
        # @param user_id [String] Target user ID
        #
        # @param cursor [String] Pagination cursor from previous response
        #
        # @param max_id [String] Legacy pagination cursor (backward compat)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::DmRetrieveHistoryResponse]
        #
        # @see XTwitterScraper::Models::X::DmRetrieveHistoryParams
        def retrieve_history(user_id, params = {})
          parsed, options = XTwitterScraper::X::DmRetrieveHistoryParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/dm/%1$s/history", user_id],
            query: query.transform_keys(max_id: "maxId"),
            model: XTwitterScraper::Models::X::DmRetrieveHistoryResponse,
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
