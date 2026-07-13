# typed: strong

module XTwitterScraper
  module Models
    class CreditRedirectTopupCheckoutParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::CreditRedirectTopupCheckoutParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Billing session ID returned by the top-up billing flow.
      sig { returns(String) }
      attr_accessor :session_id

      sig do
        params(
          session_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Billing session ID returned by the top-up billing flow.
        session_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            session_id: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
