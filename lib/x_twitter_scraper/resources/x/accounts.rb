# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # Connected X account management
      class Accounts
        # Connect X account
        #
        # @overload create(email:, password:, totp_secret:, username:, connection_attempt_id: nil, request_options: {})
        #
        # @param email [String] Account email
        #
        # @param password [String] Account password
        #
        # @param totp_secret [String] Authenticator App TOTP secret required for durable login
        #
        # @param username [String] X username
        #
        # @param connection_attempt_id [String] An ID you generate to read this attempt's status, even if the response never reaches you. Leave it out to get one in a pending response.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount, XTwitterScraper::Models::X::AccountCreateResponse::XAccountConnectionAttemptPending, XTwitterScraper::Models::X::AccountCreateResponse::XAccountConnectionChallenge]
        #
        # @see XTwitterScraper::Models::X::AccountCreateParams
        def create(params)
          parsed, options = XTwitterScraper::X::AccountCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/accounts",
            body: parsed,
            model: XTwitterScraper::Models::X::AccountCreateResponse,
            options: options
          )
        end

        # Get X account details
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Resource ID returned by the matching create or list endpoint.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::XAccountDetail]
        #
        # @see XTwitterScraper::Models::X::AccountRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["x/accounts/%1$s", id],
            model: XTwitterScraper::X::XAccountDetail,
            options: params[:request_options]
          )
        end

        # List connected X accounts
        #
        # @overload list(cursor: nil, limit: nil, request_options: {})
        #
        # @param cursor [String] Previous nextCursor. The after alias also works. Offset pagination is not suppor
        #
        # @param limit [Integer] Maximum items per page, from 1 to 10,000. Default 50. A low credit balance can r
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::AccountListResponse]
        #
        # @see XTwitterScraper::Models::X::AccountListParams
        def list(params = {})
          parsed, options = XTwitterScraper::X::AccountListParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/accounts",
            query: query,
            model: XTwitterScraper::Models::X::AccountListResponse,
            options: options
          )
        end

        # Disconnect X account
        #
        # @overload delete(id, request_options: {})
        #
        # @param id [String] Resource ID returned by the matching create or list endpoint.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::AccountDeleteResponse]
        #
        # @see XTwitterScraper::Models::X::AccountDeleteParams
        def delete(id, params = {})
          @client.request(
            method: :delete,
            path: ["x/accounts/%1$s", id],
            model: XTwitterScraper::Models::X::AccountDeleteResponse,
            options: params[:request_options]
          )
        end

        # Clears loginFailedAt and loginFailureReason for all accounts with transient or
        # automated failure reasons, making them eligible for retry on next use.
        #
        # @overload bulk_retry(request_options: {})
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::AccountBulkRetryResponse]
        #
        # @see XTwitterScraper::Models::X::AccountBulkRetryParams
        def bulk_retry(params = {})
          parsed, options = XTwitterScraper::X::AccountBulkRetryParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/accounts/bulk-retry",
            body: parsed,
            model: XTwitterScraper::Models::X::AccountBulkRetryResponse,
            options: options
          )
        end

        # Re-authenticate X account
        #
        # @overload reauth(id, password:, connection_attempt_id: nil, email: nil, totp_secret: nil, request_options: {})
        #
        # @param id [String] Resource ID returned by the matching create or list endpoint.
        #
        # @param password [String] Updated account password
        #
        # @param connection_attempt_id [String] An ID you generate to read this reconnect's status, even if the response never reaches you. Leave it out to get one in a pending response.
        #
        # @param email [String] Email for the X account (updates stored email)
        #
        # @param totp_secret [String] Replacement Authenticator App TOTP secret. Omit it to reuse the saved secret.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::AccountReauthResponse::SanitizedXAccount, XTwitterScraper::Models::X::AccountReauthResponse::XAccountConnectionAttemptPending, XTwitterScraper::Models::X::AccountReauthResponse::XAccountConnectionChallenge]
        #
        # @see XTwitterScraper::Models::X::AccountReauthParams
        def reauth(id, params)
          parsed, options = XTwitterScraper::X::AccountReauthParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["x/accounts/%1$s/reauth", id],
            body: parsed,
            model: XTwitterScraper::Models::X::AccountReauthResponse,
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
