# typed: strong

module XTwitterScraper
  module Models
    class AccountRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::AccountRetrieveResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :monitors_allowed

      sig { returns(Integer) }
      attr_accessor :monitors_used

      sig do
        returns(
          XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol
        )
      end
      attr_accessor :plan

      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo
          )
        )
      end
      attr_reader :credit_info

      sig do
        params(
          credit_info:
            XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo::OrHash
        ).void
      end
      attr_writer :credit_info

      # Linked X username, omitted when no X account is connected.
      sig { returns(T.nilable(String)) }
      attr_reader :x_username

      sig { params(x_username: String).void }
      attr_writer :x_username

      sig do
        params(
          monitors_allowed: Integer,
          monitors_used: Integer,
          plan:
            XTwitterScraper::Models::AccountRetrieveResponse::Plan::OrSymbol,
          credit_info:
            XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo::OrHash,
          x_username: String
        ).returns(T.attached_class)
      end
      def self.new(
        monitors_allowed:,
        monitors_used:,
        plan:,
        credit_info: nil,
        # Linked X username, omitted when no X account is connected.
        x_username: nil
      )
      end

      sig do
        override.returns(
          {
            monitors_allowed: Integer,
            monitors_used: Integer,
            plan:
              XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol,
            credit_info:
              XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo,
            x_username: String
          }
        )
      end
      def to_hash
      end

      module Plan
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::AccountRetrieveResponse::Plan
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(
            :active,
            XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol
          )
        INACTIVE =
          T.let(
            :inactive,
            XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class CreditInfo < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :auto_topup_enabled

        sig { returns(Integer) }
        attr_accessor :balance

        sig { returns(Integer) }
        attr_accessor :lifetime_purchased

        sig { returns(Integer) }
        attr_accessor :lifetime_used

        sig do
          params(
            auto_topup_enabled: T::Boolean,
            balance: Integer,
            lifetime_purchased: Integer,
            lifetime_used: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          auto_topup_enabled:,
          balance:,
          lifetime_purchased:,
          lifetime_used:
        )
        end

        sig do
          override.returns(
            {
              auto_topup_enabled: T::Boolean,
              balance: Integer,
              lifetime_purchased: Integer,
              lifetime_used: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
