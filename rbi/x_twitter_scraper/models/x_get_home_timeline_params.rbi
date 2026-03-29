# typed: strong

module XTwitterScraper
  module Models
    class XGetHomeTimelineParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::XGetHomeTimelineParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Pagination cursor from previous response
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Comma-separated tweet IDs to exclude from results
      sig { returns(T.nilable(String)) }
      attr_reader :seen_tweet_ids

      sig { params(seen_tweet_ids: String).void }
      attr_writer :seen_tweet_ids

      sig do
        params(
          cursor: String,
          seen_tweet_ids: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Pagination cursor from previous response
        cursor: nil,
        # Comma-separated tweet IDs to exclude from results
        seen_tweet_ids: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            seen_tweet_ids: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
