# typed: strong

module XTwitterScraper
  module Models
    class APIKeyCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::APIKeyCreateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig do
        params(
          name: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(name: nil, request_options: {})
      end

      sig do
        override.returns(
          { name: String, request_options: XTwitterScraper::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
