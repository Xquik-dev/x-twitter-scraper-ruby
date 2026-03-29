# typed: strong

module XTwitterScraper
  module Models
    class CreditRetrieveBalanceResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CreditRetrieveBalanceResponse,
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
