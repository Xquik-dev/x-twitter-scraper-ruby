# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # Sanitized X account summary returned by connect and reauth.
      #
      # @see XTwitterScraper::Resources::X::Accounts#create
      module AccountCreateResponse
        extend XTwitterScraper::Internal::Type::Union

        # Sanitized X account summary returned by connect and reauth.
        variant -> { XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount }

        # The connection is still in progress.
        variant -> { XTwitterScraper::Models::X::AccountCreateResponse::XAccountConnectionAttemptPending }

        # Resumable account connection challenge. Submit the email code to finish the same connection attempt.
        variant -> { XTwitterScraper::Models::X::AccountCreateResponse::XAccountConnectionChallenge }

        class SanitizedXAccount < XTwitterScraper::Internal::Type::BaseModel
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
          #   @return [Symbol, XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount::Health]
          required :health,
                   enum: -> { XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount::Health }

          # @!attribute status
          #
          #   @return [Symbol, :active]
          required :status, const: :active

          # @!attribute x_user_id
          #
          #   @return [String]
          required :x_user_id, String, api_name: :xUserId

          # @!attribute x_username
          #
          #   @return [String]
          required :x_username, String, api_name: :xUsername

          # @!method initialize(id:, created_at:, health:, x_user_id:, x_username:, status: :active)
          #   Sanitized X account summary returned by connect and reauth.
          #
          #   @param id [String]
          #   @param created_at [Time]
          #   @param health [Symbol, XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount::Health]
          #   @param x_user_id [String]
          #   @param x_username [String]
          #   @param status [Symbol, :active]

          # @see XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount#health
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

        class XAccountConnectionAttemptPending < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute object
          #
          #   @return [Symbol, :x_account_connection_attempt]
          required :object, const: :x_account_connection_attempt

          # @!attribute poll_after_ms
          #
          #   @return [Integer]
          required :poll_after_ms, Integer, api_name: :pollAfterMs

          # @!attribute status
          #
          #   @return [Symbol, :pending]
          required :status, const: :pending

          # @!method initialize(id:, poll_after_ms:, object: :x_account_connection_attempt, status: :pending)
          #   The connection is still in progress.
          #
          #   @param id [String]
          #   @param poll_after_ms [Integer]
          #   @param object [Symbol, :x_account_connection_attempt]
          #   @param status [Symbol, :pending]
        end

        class XAccountConnectionChallenge < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute expires_at
          #
          #   @return [Time]
          required :expires_at, Time, api_name: :expiresAt

          # @!attribute message
          #
          #   @return [String]
          required :message, String

          # @!attribute object
          #
          #   @return [Symbol, :x_account_connection_challenge]
          required :object, const: :x_account_connection_challenge

          # @!attribute status
          #
          #   @return [Symbol, :requires_email_code]
          required :status, const: :requires_email_code

          # @!attribute username
          #
          #   @return [String]
          required :username, String

          # @!method initialize(id:, expires_at:, message:, username:, object: :x_account_connection_challenge, status: :requires_email_code)
          #   Resumable account connection challenge. Submit the email code to finish the same
          #   connection attempt.
          #
          #   @param id [String]
          #   @param expires_at [Time]
          #   @param message [String]
          #   @param username [String]
          #   @param object [Symbol, :x_account_connection_challenge]
          #   @param status [Symbol, :requires_email_code]
        end

        # @!method self.variants
        #   @return [Array(XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount, XTwitterScraper::Models::X::AccountCreateResponse::XAccountConnectionAttemptPending, XTwitterScraper::Models::X::AccountCreateResponse::XAccountConnectionChallenge)]
      end
    end
  end
end
