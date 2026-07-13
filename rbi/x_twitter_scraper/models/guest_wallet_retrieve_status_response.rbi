# typed: strong

module XTwitterScraper
  module Models
    class GuestWalletRetrieveStatusResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::GuestWalletRetrieveStatusResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :balance

      # Latest guest wallet purchase fulfillment state.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase
          )
        )
      end
      attr_reader :latest_purchase

      sig do
        params(
          latest_purchase:
            T.nilable(
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::OrHash
            )
        ).void
      end
      attr_writer :latest_purchase

      # Polling delay while payment is pending. Null means stop.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::PollAfterSeconds::TaggedInteger
          )
        )
      end
      attr_accessor :poll_after_seconds

      sig { returns(Symbol) }
      attr_accessor :scope

      # Combined wallet and pending-checkout state. A pending top-up can coexist with
      # usable true. Terminal expired or failed states require a new guest wallet.
      sig do
        returns(
          XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status::TaggedSymbol
        )
      end
      attr_accessor :status

      # Top-up action when usable and no checkout is pending.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::TopUp
          )
        )
      end
      attr_reader :top_up

      sig do
        params(
          top_up:
            T.nilable(
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::TopUp::OrHash
            )
        ).void
      end
      attr_writer :top_up

      # Authoritative paid-read readiness. Use instead of status.
      sig { returns(T::Boolean) }
      attr_accessor :usable

      sig { returns(String) }
      attr_accessor :wallet_id

      # Current balance, usability, and latest guest purchase state.
      sig do
        params(
          balance: String,
          latest_purchase:
            T.nilable(
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::OrHash
            ),
          poll_after_seconds:
            T.nilable(
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::PollAfterSeconds::OrInteger
            ),
          status:
            XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status::OrSymbol,
          top_up:
            T.nilable(
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::TopUp::OrHash
            ),
          usable: T::Boolean,
          wallet_id: String,
          scope: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        balance:,
        # Latest guest wallet purchase fulfillment state.
        latest_purchase:,
        # Polling delay while payment is pending. Null means stop.
        poll_after_seconds:,
        # Combined wallet and pending-checkout state. A pending top-up can coexist with
        # usable true. Terminal expired or failed states require a new guest wallet.
        status:,
        # Top-up action when usable and no checkout is pending.
        top_up:,
        # Authoritative paid-read readiness. Use instead of status.
        usable:,
        wallet_id:,
        scope: :paid_reads
      )
      end

      sig do
        override.returns(
          {
            balance: String,
            latest_purchase:
              T.nilable(
                XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase
              ),
            poll_after_seconds:
              T.nilable(
                XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::PollAfterSeconds::TaggedInteger
              ),
            scope: Symbol,
            status:
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status::TaggedSymbol,
            top_up:
              T.nilable(
                XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::TopUp
              ),
            usable: T::Boolean,
            wallet_id: String
          }
        )
      end
      def to_hash
      end

      class LatestPurchase < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Confirmed USD amount for a guest wallet purchase.
        sig { returns(XTwitterScraper::GuestWalletAmount) }
        attr_reader :amount

        sig { params(amount: XTwitterScraper::GuestWalletAmount::OrHash).void }
        attr_writer :amount

        # Present only while the purchase is pending.
        sig { returns(T.nilable(String)) }
        attr_accessor :checkout_url

        sig { returns(String) }
        attr_accessor :credits

        sig { returns(Time) }
        attr_accessor :expires_at

        sig { returns(String) }
        attr_accessor :purchase_id

        sig do
          returns(
            XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Latest guest wallet purchase fulfillment state.
        sig do
          params(
            amount: XTwitterScraper::GuestWalletAmount::OrHash,
            checkout_url: T.nilable(String),
            credits: String,
            expires_at: Time,
            purchase_id: String,
            status:
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Confirmed USD amount for a guest wallet purchase.
          amount:,
          # Present only while the purchase is pending.
          checkout_url:,
          credits:,
          expires_at:,
          purchase_id:,
          status:
        )
        end

        sig do
          override.returns(
            {
              amount: XTwitterScraper::GuestWalletAmount,
              checkout_url: T.nilable(String),
              credits: String,
              expires_at: Time,
              purchase_id: String,
              status:
                XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status::TaggedSymbol
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
                XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CREATING =
            T.let(
              :creating,
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status::TaggedSymbol
            )
          PAID =
            T.let(
              :paid,
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status::TaggedSymbol
            )
          EXPIRED =
            T.let(
              :expired,
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status::TaggedSymbol
            )
          REFUNDED =
            T.let(
              :refunded,
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status::TaggedSymbol
            )
          DISPUTED =
            T.let(
              :disputed,
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Polling delay while payment is pending. Null means stop.
      module PollAfterSeconds
        extend XTwitterScraper::Internal::Type::Enum

        TaggedInteger =
          T.type_alias do
            T.all(
              Integer,
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::PollAfterSeconds
            )
          end
        OrInteger = T.type_alias { Integer }

        POLL_AFTER_SECONDS_2 =
          T.let(
            2,
            XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::PollAfterSeconds::TaggedInteger
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::PollAfterSeconds::TaggedInteger
            ]
          )
        end
        def self.values
        end
      end

      # Combined wallet and pending-checkout state. A pending top-up can coexist with
      # usable true. Terminal expired or failed states require a new guest wallet.
      module Status
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(
            :active,
            XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status::TaggedSymbol
          )
        PENDING =
          T.let(
            :pending,
            XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status::TaggedSymbol
          )
        EXPIRED =
          T.let(
            :expired,
            XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status::TaggedSymbol
          )
        FROZEN =
          T.let(
            :frozen,
            XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status::TaggedSymbol
          )
        CLOSED =
          T.let(
            :closed,
            XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class TopUp < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::TopUp,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :method_

        sig { returns(Symbol) }
        attr_accessor :path

        # Top-up action when usable and no checkout is pending.
        sig { params(method_: Symbol, path: Symbol).returns(T.attached_class) }
        def self.new(method_: :POST, path: :"/api/v1/guest-wallets/topups")
        end

        sig { override.returns({ method_: Symbol, path: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
