# typed: strong

module XTwitterScraper
  module Models
    class GuestWalletCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::GuestWalletCreateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Confirmed USD amount in cents.
      sig { returns(Integer) }
      attr_accessor :amount_minor

      sig { returns(Symbol) }
      attr_accessor :currency

      sig { returns(String) }
      attr_accessor :idempotency_key

      sig do
        params(
          amount_minor: Integer,
          idempotency_key: String,
          currency: Symbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Confirmed USD amount in cents.
        amount_minor:,
        idempotency_key:,
        currency: :usd,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            amount_minor: Integer,
            currency: Symbol,
            idempotency_key: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
