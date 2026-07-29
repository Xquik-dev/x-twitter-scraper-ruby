# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Accounts#create
      class AccountCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute email
        #   Account email
        #
        #   @return [String]
        required :email, String

        # @!attribute password
        #   Account password
        #
        #   @return [String]
        required :password, String

        # @!attribute totp_secret
        #   Authenticator App TOTP secret required for durable login
        #
        #   @return [String]
        required :totp_secret, String

        # @!attribute username
        #   X username
        #
        #   @return [String]
        required :username, String

        # @!method initialize(email:, password:, totp_secret:, username:, request_options: {})
        #   @param email [String] Account email
        #
        #   @param password [String] Account password
        #
        #   @param totp_secret [String] Authenticator App TOTP secret required for durable login
        #
        #   @param username [String] X username
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
