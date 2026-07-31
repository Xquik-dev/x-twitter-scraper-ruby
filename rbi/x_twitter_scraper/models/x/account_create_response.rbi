# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      # Sanitized X account summary returned by connect and reauth.
      module AccountCreateResponse
        extend XTwitterScraper::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount,
              XTwitterScraper::Models::X::AccountCreateResponse::XAccountConnectionAttemptPending,
              XTwitterScraper::Models::X::AccountCreateResponse::XAccountConnectionChallenge
            )
          end

        class SanitizedXAccount < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(Time) }
          attr_accessor :created_at

          sig do
            returns(
              XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount::Health::TaggedSymbol
            )
          end
          attr_accessor :health

          sig { returns(Symbol) }
          attr_accessor :status

          sig { returns(String) }
          attr_accessor :x_user_id

          sig { returns(String) }
          attr_accessor :x_username

          # Sanitized X account summary returned by connect and reauth.
          sig do
            params(
              id: String,
              created_at: Time,
              health:
                XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount::Health::OrSymbol,
              x_user_id: String,
              x_username: String,
              status: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            created_at:,
            health:,
            x_user_id:,
            x_username:,
            status: :active
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                health:
                  XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount::Health::TaggedSymbol,
                status: Symbol,
                x_user_id: String,
                x_username: String
              }
            )
          end
          def to_hash
          end

          module Health
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount::Health
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            HEALTHY =
              T.let(
                :healthy,
                XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount::Health::TaggedSymbol
              )
            LOCKED =
              T.let(
                :locked,
                XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount::Health::TaggedSymbol
              )
            NEEDS_REAUTH =
              T.let(
                :needsReauth,
                XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount::Health::TaggedSymbol
              )
            RECOVERING =
              T.let(
                :recovering,
                XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount::Health::TaggedSymbol
              )
            SUSPENDED =
              T.let(
                :suspended,
                XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount::Health::TaggedSymbol
              )
            TEMPORARY_ISSUE =
              T.let(
                :temporaryIssue,
                XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount::Health::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::X::AccountCreateResponse::SanitizedXAccount::Health::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class XAccountConnectionAttemptPending < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::AccountCreateResponse::XAccountConnectionAttemptPending,
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

        class XAccountConnectionChallenge < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::AccountCreateResponse::XAccountConnectionChallenge,
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
        end

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::X::AccountCreateResponse::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
