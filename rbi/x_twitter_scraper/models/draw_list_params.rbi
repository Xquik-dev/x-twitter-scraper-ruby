# typed: strong

module XTwitterScraper
  module Models
    class DrawListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::DrawListParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Cursor for pagination
      sig { returns(T.nilable(String)) }
      attr_reader :after

      sig { params(after: String).void }
      attr_writer :after

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          after: String,
          limit: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor for pagination
        after: nil,
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            after: String,
            limit: Integer,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
