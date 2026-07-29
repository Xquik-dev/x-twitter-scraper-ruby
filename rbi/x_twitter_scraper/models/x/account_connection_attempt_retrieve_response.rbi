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
              XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptPending,
              XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptSuccess,
              XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptFailed,
              XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge
            )
          end

        class XAccountConnectionAttemptPending < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptPending,
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
        end

        class XAccountConnectionAttemptSuccess < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptSuccess,
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
        end

        class XAccountConnectionAttemptFailed < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptFailed,
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
        end

        class XAccountConnectionChallenge < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(Time) }
          attr_accessor :expires_at

          sig { returns(String) }
          attr_accessor :message

          sig do
            returns(
              XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Object::TaggedSymbol
            )
          end
          attr_accessor :object

          sig do
            returns(
              XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Status::TaggedSymbol
            )
          end
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
              object:
                XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Object::OrSymbol,
              status:
                XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Status::OrSymbol,
              username: String
            ).returns(T.attached_class)
          end
          def self.new(id:, expires_at:, message:, object:, status:, username:)
          end

          sig do
            override.returns(
              {
                id: String,
                expires_at: Time,
                message: String,
                object:
                  XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Object::TaggedSymbol,
                status:
                  XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Status::TaggedSymbol,
                username: String
              }
            )
          end
          def to_hash
          end

          module Object
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Object
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            X_ACCOUNT_CONNECTION_CHALLENGE =
              T.let(
                :x_account_connection_challenge,
                XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Object::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Object::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module Status
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            REQUIRES_EMAIL_CODE =
              T.let(
                :requires_email_code,
                XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

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
