# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Accounts#reauth
      class AccountReauthParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute password
        #   Updated account password
        #
        #   @return [String]
        required :password, String

        # @!attribute email
        #   Email for the X account (updates stored email)
        #
        #   @return [String, nil]
        optional :email, String

        # @!attribute proxy_country
        #   Two-letter country code for login proxy region
        #
        #   @return [String, nil]
        optional :proxy_country, String

        # @!attribute totp_secret
        #   TOTP secret for 2FA re-authentication
        #
        #   @return [String, nil]
        optional :totp_secret, String

        # @!method initialize(id:, password:, email: nil, proxy_country: nil, totp_secret: nil, request_options: {})
        #   @param id [String]
        #
        #   @param password [String] Updated account password
        #
        #   @param email [String] Email for the X account (updates stored email)
        #
        #   @param proxy_country [String] Two-letter country code for login proxy region
        #
        #   @param totp_secret [String] TOTP secret for 2FA re-authentication
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
