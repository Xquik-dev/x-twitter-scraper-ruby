# typed: strong

module XTwitterScraper
  module Models
    class DraftListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::DraftListParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Cursor for pagination
      sig { returns(T.nilable(String)) }
      attr_reader :after_cursor

      sig { params(after_cursor: String).void }
      attr_writer :after_cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          after_cursor: String,
          limit: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor for pagination
        after_cursor: nil,
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            after_cursor: String,
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
