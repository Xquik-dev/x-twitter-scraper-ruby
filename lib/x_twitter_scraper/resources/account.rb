# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Account info & settings
    class Account
      # Get account info
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::AccountRetrieveResponse]
      #
      # @see XTwitterScraper::Models::AccountRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "account",
          model: XTwitterScraper::Models::AccountRetrieveResponse,
          security: {auth_api_key: true},
          options: params[:request_options]
        )
      end

      # Set linked X username
      #
      # @overload set_x_username(username:, request_options: {})
      #
      # @param username [String] X username without @
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::AccountSetXUsernameResponse]
      #
      # @see XTwitterScraper::Models::AccountSetXUsernameParams
      def set_x_username(params)
        parsed, options = XTwitterScraper::AccountSetXUsernameParams.dump_request(params)
        @client.request(
          method: :put,
          path: "account/x-identity",
          body: parsed,
          model: XTwitterScraper::Models::AccountSetXUsernameResponse,
          options: options
        )
      end

      # Update account locale
      #
      # @overload update_locale(locale:, request_options: {})
      #
      # @param locale [Symbol, XTwitterScraper::Models::AccountUpdateLocaleParams::Locale]
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::AccountUpdateLocaleResponse]
      #
      # @see XTwitterScraper::Models::AccountUpdateLocaleParams
      def update_locale(params)
        parsed, options = XTwitterScraper::AccountUpdateLocaleParams.dump_request(params)
        @client.request(
          method: :patch,
          path: "account",
          body: parsed,
          model: XTwitterScraper::Models::AccountUpdateLocaleResponse,
          security: {},
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
