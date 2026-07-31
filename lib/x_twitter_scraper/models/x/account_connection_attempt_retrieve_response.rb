# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # The connection is still in progress.
      #
      # @see XTwitterScraper::Resources::X::AccountConnectionAttempts#retrieve
      module AccountConnectionAttemptRetrieveResponse
        extend XTwitterScraper::Internal::Type::Union

        discriminator :status

        # The connection is still in progress.
        variant :pending, -> { XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Pending }

        # The account connected successfully.
        variant :success, -> { XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Success }

        # The connection reached a final failure.
        variant :failed, -> { XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Failed }

        # Resumable account connection challenge. Submit the email code to finish the same connection attempt.
        variant :requires_email_code,
                -> { XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::RequiresEmailCode }

        class Pending < XTwitterScraper::Internal::Type::BaseModel
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

          module Object
            extend XTwitterScraper::Internal::Type::Enum

            X_ACCOUNT_CONNECTION_ATTEMPT = :x_account_connection_attempt
          end

          module Status
            extend XTwitterScraper::Internal::Type::Enum

            PENDING = :pending
          end
        end

        class Success < XTwitterScraper::Internal::Type::BaseModel
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

          module Object
            extend XTwitterScraper::Internal::Type::Enum

            X_ACCOUNT_CONNECTION_ATTEMPT = :x_account_connection_attempt
          end

          module Status
            extend XTwitterScraper::Internal::Type::Enum

            SUCCESS = :success
          end
        end

        class Failed < XTwitterScraper::Internal::Type::BaseModel
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

          module Object
            extend XTwitterScraper::Internal::Type::Enum

            X_ACCOUNT_CONNECTION_ATTEMPT = :x_account_connection_attempt
          end

          module Status
            extend XTwitterScraper::Internal::Type::Enum

            FAILED = :failed
          end
        end

        class RequiresEmailCode < XTwitterScraper::Internal::Type::BaseModel
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

          module Object
            extend XTwitterScraper::Internal::Type::Enum

            X_ACCOUNT_CONNECTION_CHALLENGE = :x_account_connection_challenge
          end

          module Status
            extend XTwitterScraper::Internal::Type::Enum

            REQUIRES_EMAIL_CODE = :requires_email_code
          end
        end

        XAccountConnectionAttemptPending = Pending
        XAccountConnectionAttemptSuccess = Success
        XAccountConnectionAttemptFailed = Failed
        XAccountConnectionChallenge = RequiresEmailCode

        # @!method self.variants
        #   @return [Array(XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Pending, XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Success, XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Failed, XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::RequiresEmailCode)]
      end
    end
  end
end
