# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class GuestWalletTopupResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::GuestWalletTopupResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :account_required

      # Confirmed USD amount for a guest wallet purchase.
      sig { returns(XTwitterScraper::GuestWalletAmount) }
      attr_reader :amount

      sig { params(amount: XTwitterScraper::GuestWalletAmount::OrHash).void }
      attr_writer :amount

      # Raw Stripe-hosted checkout URL for user interaction.
      sig { returns(String) }
      attr_accessor :checkout_url

      # Credits granted after verified payment.
      sig { returns(String) }
      attr_accessor :credits

      # Time when the pending checkout expires.
      sig { returns(Time) }
      attr_accessor :expires_at

      sig { returns(Symbol) }
      attr_accessor :instructions

      # Wait at least this long before polling status_url.
      sig { returns(Integer) }
      attr_accessor :poll_after_seconds

      sig { returns(String) }
      attr_accessor :purchase_id

      sig { returns(T::Boolean) }
      attr_accessor :requires_user_interaction

      sig do
        returns(
          XTwitterScraper::Models::GuestWalletTopupResponse::Status::TaggedSymbol
        )
      end
      attr_accessor :status

      sig { returns(Symbol) }
      attr_accessor :status_url

      sig { returns(String) }
      attr_accessor :wallet_id

      # Paid-read bearer credential returned only by initial creation. Store it as a
      # secret. Never place it in a URL or log.
      sig { returns(T.nilable(String)) }
      attr_reader :api_key

      sig { params(api_key: String).void }
      attr_writer :api_key

      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::GuestWalletTopupResponse::Authorization
          )
        )
      end
      attr_reader :authorization

      sig do
        params(
          authorization:
            XTwitterScraper::Models::GuestWalletTopupResponse::Authorization::OrHash
        ).void
      end
      attr_writer :authorization

      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::GuestWalletTopupResponse::CredentialNotice::TaggedSymbol
          )
        )
      end
      attr_reader :credential_notice

      sig do
        params(
          credential_notice:
            XTwitterScraper::Models::GuestWalletTopupResponse::CredentialNotice::OrSymbol
        ).void
      end
      attr_writer :credential_notice

      # Pending Stripe checkout and guest wallet purchase details.
      sig do
        params(
          amount: XTwitterScraper::GuestWalletAmount::OrHash,
          checkout_url: String,
          credits: String,
          expires_at: Time,
          purchase_id: String,
          status:
            XTwitterScraper::Models::GuestWalletTopupResponse::Status::OrSymbol,
          wallet_id: String,
          api_key: String,
          authorization:
            XTwitterScraper::Models::GuestWalletTopupResponse::Authorization::OrHash,
          credential_notice:
            XTwitterScraper::Models::GuestWalletTopupResponse::CredentialNotice::OrSymbol,
          account_required: T::Boolean,
          instructions: Symbol,
          poll_after_seconds: Integer,
          requires_user_interaction: T::Boolean,
          status_url: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Confirmed USD amount for a guest wallet purchase.
        amount:,
        # Raw Stripe-hosted checkout URL for user interaction.
        checkout_url:,
        # Credits granted after verified payment.
        credits:,
        # Time when the pending checkout expires.
        expires_at:,
        purchase_id:,
        status:,
        wallet_id:,
        # Paid-read bearer credential returned only by initial creation. Store it as a
        # secret. Never place it in a URL or log.
        api_key: nil,
        authorization: nil,
        credential_notice: nil,
        account_required: false,
        instructions: :"Give checkout_url to the user. They must complete payment on Stripe. Never submit payment for them. After payment, poll status_url every poll_after_seconds until latest_purchase.status is no longer pending.",
        # Wait at least this long before polling status_url.
        poll_after_seconds: 2,
        requires_user_interaction: true,
        status_url: :"https://xquik.com/api/v1/guest-wallets/status"
      )
      end

      sig do
        override.returns(
          {
            account_required: T::Boolean,
            amount: XTwitterScraper::GuestWalletAmount,
            checkout_url: String,
            credits: String,
            expires_at: Time,
            instructions: Symbol,
            poll_after_seconds: Integer,
            purchase_id: String,
            requires_user_interaction: T::Boolean,
            status:
              XTwitterScraper::Models::GuestWalletTopupResponse::Status::TaggedSymbol,
            status_url: Symbol,
            wallet_id: String,
            api_key: String,
            authorization:
              XTwitterScraper::Models::GuestWalletTopupResponse::Authorization,
            credential_notice:
              XTwitterScraper::Models::GuestWalletTopupResponse::CredentialNotice::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Status
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::GuestWalletTopupResponse::Status
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CREATING =
          T.let(
            :creating,
            XTwitterScraper::Models::GuestWalletTopupResponse::Status::TaggedSymbol
          )
        PENDING =
          T.let(
            :pending,
            XTwitterScraper::Models::GuestWalletTopupResponse::Status::TaggedSymbol
          )
        PAID =
          T.let(
            :paid,
            XTwitterScraper::Models::GuestWalletTopupResponse::Status::TaggedSymbol
          )
        EXPIRED =
          T.let(
            :expired,
            XTwitterScraper::Models::GuestWalletTopupResponse::Status::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            XTwitterScraper::Models::GuestWalletTopupResponse::Status::TaggedSymbol
          )
        REFUNDED =
          T.let(
            :refunded,
            XTwitterScraper::Models::GuestWalletTopupResponse::Status::TaggedSymbol
          )
        DISPUTED =
          T.let(
            :disputed,
            XTwitterScraper::Models::GuestWalletTopupResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::GuestWalletTopupResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Authorization < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::GuestWalletTopupResponse::Authorization,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            XTwitterScraper::Models::GuestWalletTopupResponse::Authorization::Header::TaggedSymbol
          )
        end
        attr_accessor :header

        sig do
          returns(
            XTwitterScraper::Models::GuestWalletTopupResponse::Authorization::Scheme::TaggedSymbol
          )
        end
        attr_accessor :scheme

        sig do
          params(
            header:
              XTwitterScraper::Models::GuestWalletTopupResponse::Authorization::Header::OrSymbol,
            scheme:
              XTwitterScraper::Models::GuestWalletTopupResponse::Authorization::Scheme::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(header:, scheme:)
        end

        sig do
          override.returns(
            {
              header:
                XTwitterScraper::Models::GuestWalletTopupResponse::Authorization::Header::TaggedSymbol,
              scheme:
                XTwitterScraper::Models::GuestWalletTopupResponse::Authorization::Scheme::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Header
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::GuestWalletTopupResponse::Authorization::Header
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AUTHORIZATION =
            T.let(
              :Authorization,
              XTwitterScraper::Models::GuestWalletTopupResponse::Authorization::Header::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::GuestWalletTopupResponse::Authorization::Header::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Scheme
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::GuestWalletTopupResponse::Authorization::Scheme
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BEARER =
            T.let(
              :Bearer,
              XTwitterScraper::Models::GuestWalletTopupResponse::Authorization::Scheme::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::GuestWalletTopupResponse::Authorization::Scheme::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      module CredentialNotice
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::GuestWalletTopupResponse::CredentialNotice
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STORE_API_KEY_AND_THE_IDEMPOTENCY_KEY_SECURELY_BEFORE_SHARING_CHECKOUT_URL_NO_EMAIL_RECOVERY_IS_AVAILABLE =
          T.let(
            :"Store api_key and the Idempotency-Key securely before sharing checkout_url. No email recovery is available.",
            XTwitterScraper::Models::GuestWalletTopupResponse::CredentialNotice::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::GuestWalletTopupResponse::CredentialNotice::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
