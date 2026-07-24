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

        # @!attribute username
        #   X username
        #
        #   @return [String]
        required :username, String

        # @!attribute totp_secret
        #   TOTP secret for 2FA
        #
        #   @return [String, nil]
        optional :totp_secret, String

        # @!method initialize(email:, password:, username:, totp_secret: nil, request_options: {})
        #   @param email [String] Account email
        #
        #   @param password [String] Account password
        #
        #   @param username [String] X username
        #
        #   @param totp_secret [String] TOTP secret for 2FA
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
