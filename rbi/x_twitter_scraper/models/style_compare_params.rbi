# typed: strong

module XTwitterScraper
  module Models
    class StyleCompareParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::StyleCompareParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # First username to compare
      sig { returns(String) }
      attr_accessor :username1

      # Second username to compare
      sig { returns(String) }
      attr_accessor :username2

      sig do
        params(
          username1: String,
          username2: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # First username to compare
        username1:,
        # Second username to compare
        username2:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            username1: String,
            username2: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
