# typed: strong

module XTwitterScraper
  module Models
    class CreditTopupBalanceParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::CreditTopupBalanceParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Amount to top up in credits
      sig { returns(Integer) }
      attr_accessor :amount

      sig do
        params(
          amount: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Amount to top up in credits
        amount:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { amount: Integer, request_options: XTwitterScraper::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
