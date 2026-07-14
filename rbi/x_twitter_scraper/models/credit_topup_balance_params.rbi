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

      # Amount to top up in US dollars. Minimum 10.
      sig { returns(Integer) }
      attr_accessor :dollars

      # Optional checkout locale. Defaults to en.
      sig { returns(T.nilable(String)) }
      attr_reader :locale

      sig { params(locale: String).void }
      attr_writer :locale

      sig do
        params(
          dollars: Integer,
          locale: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Amount to top up in US dollars. Minimum 10.
        dollars:,
        # Optional checkout locale. Defaults to en.
        locale: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            dollars: Integer,
            locale: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
