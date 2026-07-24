# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class GuestWalletCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::GuestWalletCreateResponse,
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

      # Paid-read bearer credential returned only by initial creation. Store it as a
      # secret. Never place it in a URL or log.
      sig { returns(String) }
      attr_accessor :api_key

      sig do
        returns(
          XTwitterScraper::Models::GuestWalletCreateResponse::Authorization
        )
      end
      attr_reader :authorization

      sig do
        params(
          authorization:
            XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::OrHash
        ).void
      end
      attr_writer :authorization

      # Raw Stripe-hosted checkout URL for user interaction.
      sig { returns(String) }
      attr_accessor :checkout_url

      sig { returns(Symbol) }
      attr_accessor :credential_notice

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
          XTwitterScraper::Models::GuestWalletCreateResponse::Status::TaggedSymbol
        )
      end
      attr_accessor :status

      sig { returns(Symbol) }
      attr_accessor :status_url

      sig { returns(String) }
      attr_accessor :wallet_id

      # Initial guest wallet response containing the one-time key.
      sig do
        params(
          amount: XTwitterScraper::GuestWalletAmount::OrHash,
          api_key: String,
          authorization:
            XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::OrHash,
          checkout_url: String,
          credits: String,
          expires_at: Time,
          purchase_id: String,
          status:
            XTwitterScraper::Models::GuestWalletCreateResponse::Status::OrSymbol,
          wallet_id: String,
          account_required: T::Boolean,
          credential_notice: Symbol,
          instructions: Symbol,
          poll_after_seconds: Integer,
          requires_user_interaction: T::Boolean,
          status_url: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Confirmed USD amount for a guest wallet purchase.
        amount:,
        # Paid-read bearer credential returned only by initial creation. Store it as a
        # secret. Never place it in a URL or log.
        api_key:,
        authorization:,
        # Raw Stripe-hosted checkout URL for user interaction.
        checkout_url:,
        # Credits granted after verified payment.
        credits:,
        # Time when the pending checkout expires.
        expires_at:,
        purchase_id:,
        status:,
        wallet_id:,
        account_required: false,
        credential_notice: :"Store api_key and the Idempotency-Key securely before sharing checkout_url. No email recovery is available.",
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
            api_key: String,
            authorization:
              XTwitterScraper::Models::GuestWalletCreateResponse::Authorization,
            checkout_url: String,
            credential_notice: Symbol,
            credits: String,
            expires_at: Time,
            instructions: Symbol,
            poll_after_seconds: Integer,
            purchase_id: String,
            requires_user_interaction: T::Boolean,
            status:
              XTwitterScraper::Models::GuestWalletCreateResponse::Status::TaggedSymbol,
            status_url: Symbol,
            wallet_id: String
          }
        )
      end
      def to_hash
      end

      class Authorization < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::GuestWalletCreateResponse::Authorization,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Header::TaggedSymbol
          )
        end
        attr_accessor :header

        sig do
          returns(
            XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Scheme::TaggedSymbol
          )
        end
        attr_accessor :scheme

        sig do
          params(
            header:
              XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Header::OrSymbol,
            scheme:
              XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Scheme::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(header:, scheme:)
        end

        sig do
          override.returns(
            {
              header:
                XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Header::TaggedSymbol,
              scheme:
                XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Scheme::TaggedSymbol
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
                XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Header
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AUTHORIZATION =
            T.let(
              :Authorization,
              XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Header::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Header::TaggedSymbol
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
                XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Scheme
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BEARER =
            T.let(
              :Bearer,
              XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Scheme::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Scheme::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      module Status
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::GuestWalletCreateResponse::Status
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CREATING =
          T.let(
            :creating,
            XTwitterScraper::Models::GuestWalletCreateResponse::Status::TaggedSymbol
          )
        PENDING =
          T.let(
            :pending,
            XTwitterScraper::Models::GuestWalletCreateResponse::Status::TaggedSymbol
          )
        PAID =
          T.let(
            :paid,
            XTwitterScraper::Models::GuestWalletCreateResponse::Status::TaggedSymbol
          )
        EXPIRED =
          T.let(
            :expired,
            XTwitterScraper::Models::GuestWalletCreateResponse::Status::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            XTwitterScraper::Models::GuestWalletCreateResponse::Status::TaggedSymbol
          )
        REFUNDED =
          T.let(
            :refunded,
            XTwitterScraper::Models::GuestWalletCreateResponse::Status::TaggedSymbol
          )
        DISPUTED =
          T.let(
            :disputed,
            XTwitterScraper::Models::GuestWalletCreateResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::GuestWalletCreateResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
