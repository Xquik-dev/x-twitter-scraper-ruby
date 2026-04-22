# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Accounts#reauth
      class AccountReauthResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute health
        #
        #   @return [Symbol, XTwitterScraper::Models::X::AccountReauthResponse::Health]
        required :health, enum: -> { XTwitterScraper::Models::X::AccountReauthResponse::Health }

        # @!attribute status
        #
        #   @return [String]
        required :status, String

        # @!attribute x_user_id
        #
        #   @return [String]
        required :x_user_id, String, api_name: :xUserId

        # @!attribute x_username
        #
        #   @return [String]
        required :x_username, String, api_name: :xUsername

        # @!attribute login_country
        #   ISO-3166-1 alpha-2 country code of the Driver consumer device used for this
        #   login. Present only when the US fallback was triggered because Driver had no
        #   capacity in the declared region. Omitted otherwise.
        #
        #   @return [String, nil]
        optional :login_country, String, api_name: :loginCountry

        # @!method initialize(id:, created_at:, health:, status:, x_user_id:, x_username:, login_country: nil)
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::AccountReauthResponse} for more details.
        #
        #   Sanitized X account summary returned by connect and reauth. Includes an optional
        #   `loginCountry` field surfaced only when the declared proxy region had no Driver
        #   capacity and the login fell back to a single US consumer device for this
        #   one-time action. Future activity continues to use the selected `proxy_country`;
        #   the field is omitted on normal logins.
        #
        #   @param id [String]
        #
        #   @param created_at [Time]
        #
        #   @param health [Symbol, XTwitterScraper::Models::X::AccountReauthResponse::Health]
        #
        #   @param status [String]
        #
        #   @param x_user_id [String]
        #
        #   @param x_username [String]
        #
        #   @param login_country [String] ISO-3166-1 alpha-2 country code of the Driver consumer device used for this logi

        # @see XTwitterScraper::Models::X::AccountReauthResponse#health
        module Health
          extend XTwitterScraper::Internal::Type::Enum

          HEALTHY = :healthy
          LOCKED = :locked
          NEEDS_REAUTH = :needsReauth
          RECOVERING = :recovering
          SUSPENDED = :suspended
          TEMPORARY_ISSUE = :temporaryIssue

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
