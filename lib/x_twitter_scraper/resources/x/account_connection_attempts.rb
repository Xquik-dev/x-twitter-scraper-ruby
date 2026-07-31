# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # Connected X account management
      class AccountConnectionAttempts
        # Get X account connection status
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Connection attempt ID returned by `POST /x/accounts`.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Pending, XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Success, XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Failed, XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::RequiresEmailCode]
        #
        # @see XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["x/account-connection-attempts/%1$s", id],
            model: XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse,
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
