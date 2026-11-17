# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # Connected X account management
      class AccountConnectionLinks
        # Creates a link to a page Xquik hosts, where a person connects an X account with
        # no Xquik signup. Send `account_id` to reconnect 1 of your accounts instead. The
        # link works for 30 minutes, and this response is the only place its token
        # appears. Takes a Full access API key holding `connectsXAccounts`.
        #
        # @overload create(reference: nil, return_url: nil, account_id: nil, request_options: {})
        #
        # @param reference [String] Your own ID for this person. It comes back when you read the link.
        #
        # @param return_url [String] A public https URL the page offers as a button once the account connects. Xquik never redirects by itself, and never adds the token.
        #
        # @param account_id [String] The ID of 1 of your X accounts. The link then reconnects that account.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::AccountConnectionLinkCreateResponse]
        #
        # @see XTwitterScraper::Models::X::AccountConnectionLinkCreateParams
        def create(params = {})
          parsed, options = XTwitterScraper::X::AccountConnectionLinkCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/account-connection-links",
            body: parsed,
            model: XTwitterScraper::Models::X::AccountConnectionLinkCreateResponse,
            options: options
          )
        end

        # Reads what happened on a link. `status` reads `connected` once the person
        # finishes, with `x_user_id`, `x_username` and `health`. It never holds the token. Takes a Full access API key holding `connectsXAccounts`.
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Connect link ID returned when you created the link.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::XAccountConnectionLink]
        #
        # @see XTwitterScraper::Models::X::AccountConnectionLinkRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["x/account-connection-links/%1$s", id],
            model: XTwitterScraper::X::XAccountConnectionLink,
            options: params[:request_options]
          )
        end

        # Stops a link working. An account it already connected stays connected. Takes a Full access API key holding `connectsXAccounts`.
        #
        # @overload revoke(id, request_options: {})
        #
        # @param id [String] Connect link ID returned when you created the link.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::AccountConnectionLinkRevokeResponse]
        #
        # @see XTwitterScraper::Models::X::AccountConnectionLinkRevokeParams
        def revoke(id, params = {})
          @client.request(
            method: :delete,
            path: ["x/account-connection-links/%1$s", id],
            model: XTwitterScraper::Models::X::AccountConnectionLinkRevokeResponse,
            options: params[:request_options]
          )
        end

        # Lists your connect links, newest first, with `api_key_id` naming the API key that
        # made each one, or nil for a dashboard session. Use it to find and revoke the
        # links a leaked key made. It never holds a token. Takes a Full access API key holding `connectsXAccounts`.
        #
        # @overload list(cursor: nil, limit: nil, request_options: {})
        #
        # @param cursor [String] Previous nextCursor. The after alias also works. Offset pagination is not supported.
        #
        # @param limit [Integer] Maximum items per page, from 1 to 10,000. Default 200. Pass nextCursor as cursor for the next page.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::AccountConnectionLinkListResponse]
        #
        # @see XTwitterScraper::Models::X::AccountConnectionLinkListParams
        def list(params = {})
          parsed, options = XTwitterScraper::X::AccountConnectionLinkListParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/account-connection-links",
            query: query,
            model: XTwitterScraper::Models::X::AccountConnectionLinkListResponse,
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
