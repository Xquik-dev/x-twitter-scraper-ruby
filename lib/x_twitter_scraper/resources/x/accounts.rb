# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # Connected X account management
      class Accounts
        # Connect X account
        #
        # @overload create(email:, password:, username:, proxy_country: nil, totp_secret: nil, request_options: {})
        #
        # @param email [String] Account email
        #
        # @param password [String] Account password
        #
        # @param username [String] X username
        #
        # @param proxy_country [String] Proxy country code
        #
        # @param totp_secret [String] TOTP secret for 2FA
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::AccountCreateResponse]
        #
        # @see XTwitterScraper::Models::X::AccountCreateParams
        def create(params)
          parsed, options = XTwitterScraper::X::AccountCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/accounts",
            body: parsed,
            model: XTwitterScraper::Models::X::AccountCreateResponse,
            security: {auth_api_key: true},
            options: options
          )
        end

        # Get X account details
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Resource ID (stringified bigint)
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
            security: {auth_api_key: true},
            options: params[:request_options]
          )
        end

        # List connected X accounts
        #
        # @overload list(request_options: {})
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::AccountListResponse]
        #
        # @see XTwitterScraper::Models::X::AccountListParams
        def list(params = {})
          @client.request(
            method: :get,
            path: "x/accounts",
            model: XTwitterScraper::Models::X::AccountListResponse,
            security: {auth_api_key: true},
            options: params[:request_options]
          )
        end

        # Disconnect X account
        #
        # @overload delete(id, request_options: {})
        #
        # @param id [String] Resource ID (stringified bigint)
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
            security: {auth_api_key: true},
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
          @client.request(
            method: :post,
            path: "x/accounts/bulk-retry",
            model: XTwitterScraper::Models::X::AccountBulkRetryResponse,
            security: {auth_api_key: true},
            options: params[:request_options]
          )
        end

        # Re-authenticate X account
        #
        # @overload reauth(id, password:, totp_secret: nil, request_options: {})
        #
        # @param id [String] Resource ID (stringified bigint)
        #
        # @param password [String] Updated account password
        #
        # @param totp_secret [String] TOTP secret for 2FA re-authentication
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::AccountReauthResponse]
        #
        # @see XTwitterScraper::Models::X::AccountReauthParams
        def reauth(id, params)
          parsed, options = XTwitterScraper::X::AccountReauthParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["x/accounts/%1$s/reauth", id],
            body: parsed,
            model: XTwitterScraper::Models::X::AccountReauthResponse,
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
end
