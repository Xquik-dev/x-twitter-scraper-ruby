# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # The connection is still in progress.
      #
      # @see XTwitterScraper::Resources::X::AccountConnectionAttempts#retrieve
      module AccountConnectionAttemptRetrieveResponse
        extend XTwitterScraper::Internal::Type::Union

        # The connection is still in progress.
        variant -> { XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptPending }

        # The account connected successfully.
        variant -> { XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptSuccess }

        # The connection reached a final failure.
        variant -> { XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptFailed }

        # Resumable account connection challenge. Submit the email code to finish the same connection attempt.
        variant -> { XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge }

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

        class XAccountConnectionAttemptSuccess < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute object
          #
          #   @return [Symbol, :x_account_connection_attempt]
          required :object, const: :x_account_connection_attempt

          # @!attribute status
          #
          #   @return [Symbol, :success]
          required :status, const: :success

          # @!method initialize(id:, object: :x_account_connection_attempt, status: :success)
          #   The account connected successfully.
          #
          #   @param id [String]
          #   @param object [Symbol, :x_account_connection_attempt]
          #   @param status [Symbol, :success]
        end

        class XAccountConnectionAttemptFailed < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute error
          #
          #   @return [String]
          required :error, String

          # @!attribute object
          #
          #   @return [Symbol, :x_account_connection_attempt]
          required :object, const: :x_account_connection_attempt

          # @!attribute retryable
          #
          #   @return [Boolean]
          required :retryable, XTwitterScraper::Internal::Type::Boolean

          # @!attribute status
          #
          #   @return [Symbol, :failed]
          required :status, const: :failed

          # @!attribute reason
          #
          #   @return [String, nil]
          optional :reason, String

          # @!method initialize(id:, error:, retryable:, reason: nil, object: :x_account_connection_attempt, status: :failed)
          #   The connection reached a final failure.
          #
          #   @param id [String]
          #   @param error [String]
          #   @param retryable [Boolean]
          #   @param reason [String]
          #   @param object [Symbol, :x_account_connection_attempt]
          #   @param status [Symbol, :failed]
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
          #   @return [Symbol, XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Object]
          required :object,
                   enum: -> { XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Object }

          # @!attribute status
          #
          #   @return [Symbol, XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Status]
          required :status,
                   enum: -> { XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Status }

          # @!attribute username
          #
          #   @return [String]
          required :username, String

          # @!method initialize(id:, expires_at:, message:, object:, status:, username:)
          #   Resumable account connection challenge. Submit the email code to finish the same
          #   connection attempt.
          #
          #   @param id [String]
          #   @param expires_at [Time]
          #   @param message [String]
          #   @param object [Symbol, XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Object]
          #   @param status [Symbol, XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Status]
          #   @param username [String]

          # @see XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge#object
          module Object
            extend XTwitterScraper::Internal::Type::Enum

            X_ACCOUNT_CONNECTION_CHALLENGE = :x_account_connection_challenge

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge#status
          module Status
            extend XTwitterScraper::Internal::Type::Enum

            REQUIRES_EMAIL_CODE = :requires_email_code

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptPending, XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptSuccess, XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptFailed, XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge)]
      end
    end
  end
end
