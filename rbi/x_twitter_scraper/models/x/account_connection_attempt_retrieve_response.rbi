# typed: strong

module XTwitterScraper
  module Models
    module X
      # The connection is still in progress.
      module AccountConnectionAttemptRetrieveResponse
        extend XTwitterScraper::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Pending,
              XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Success,
              XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Failed,
              XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::RequiresEmailCode
            )
          end

        class Pending < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Pending,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(Symbol) }
          attr_accessor :object

          sig { returns(Integer) }
          attr_accessor :poll_after_ms

          sig { returns(Symbol) }
          attr_accessor :status

          # The connection is still in progress.
          sig do
            params(
              id: String,
              poll_after_ms: Integer,
              object: Symbol,
              status: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            poll_after_ms:,
            object: :x_account_connection_attempt,
            status: :pending
          )
          end

          sig do
            override.returns(
              {
                id: String,
                object: Symbol,
                poll_after_ms: Integer,
                status: Symbol
              }
            )
          end
          def to_hash
          end

          module Object
            X_ACCOUNT_CONNECTION_ATTEMPT =
              T.let(:x_account_connection_attempt, Symbol)
          end

          module Status
            PENDING = T.let(:pending, Symbol)
          end
        end

        class Success < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Success,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(Symbol) }
          attr_accessor :object

          sig { returns(Symbol) }
          attr_accessor :status

          # The account connected successfully.
          sig do
            params(id: String, object: Symbol, status: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            id:,
            object: :x_account_connection_attempt,
            status: :success
          )
          end

          sig do
            override.returns({ id: String, object: Symbol, status: Symbol })
          end
          def to_hash
          end

          module Object
            X_ACCOUNT_CONNECTION_ATTEMPT =
              T.let(:x_account_connection_attempt, Symbol)
          end

          module Status
            SUCCESS = T.let(:success, Symbol)
          end
        end

        class Failed < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Failed,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :error

          sig { returns(Symbol) }
          attr_accessor :object

          sig { returns(T::Boolean) }
          attr_accessor :retryable

          sig { returns(Symbol) }
          attr_accessor :status

          sig { returns(T.nilable(String)) }
          attr_reader :reason

          sig { params(reason: String).void }
          attr_writer :reason

          # The connection reached a final failure.
          sig do
            params(
              id: String,
              error: String,
              retryable: T::Boolean,
              reason: String,
              object: Symbol,
              status: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            error:,
            retryable:,
            reason: nil,
            object: :x_account_connection_attempt,
            status: :failed
          )
          end

          sig do
            override.returns(
              {
                id: String,
                error: String,
                object: Symbol,
                retryable: T::Boolean,
                status: Symbol,
                reason: String
              }
            )
          end
          def to_hash
          end

          module Object
            X_ACCOUNT_CONNECTION_ATTEMPT =
              T.let(:x_account_connection_attempt, Symbol)
          end

          module Status
            FAILED = T.let(:failed, Symbol)
          end
        end

        class RequiresEmailCode < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::RequiresEmailCode,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(Time) }
          attr_accessor :expires_at

          sig { returns(String) }
          attr_accessor :message

          sig { returns(Symbol) }
          attr_accessor :object

          sig { returns(Symbol) }
          attr_accessor :status

          sig { returns(String) }
          attr_accessor :username

          # Resumable account connection challenge. Submit the email code to finish the same
          # connection attempt.
          sig do
            params(
              id: String,
              expires_at: Time,
              message: String,
              username: String,
              object: Symbol,
              status: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            expires_at:,
            message:,
            username:,
            object: :x_account_connection_challenge,
            status: :requires_email_code
          )
          end

          sig do
            override.returns(
              {
                id: String,
                expires_at: Time,
                message: String,
                object: Symbol,
                status: Symbol,
                username: String
              }
            )
          end
          def to_hash
          end

          module Object
            X_ACCOUNT_CONNECTION_CHALLENGE =
              T.let(:x_account_connection_challenge, Symbol)
          end

          module Status
            REQUIRES_EMAIL_CODE = T.let(:requires_email_code, Symbol)
          end
        end

        XAccountConnectionAttemptPending = Pending
        XAccountConnectionAttemptSuccess = Success
        XAccountConnectionAttemptFailed = Failed
        XAccountConnectionChallenge = RequiresEmailCode

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
