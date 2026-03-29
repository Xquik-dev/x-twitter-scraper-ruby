# typed: strong

module XTwitterScraper
  module Models
    class TrendListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::TrendListParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :count

      sig { params(count: Integer).void }
      attr_writer :count

      # Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
      sig { returns(T.nilable(Integer)) }
      attr_reader :woeid

      sig { params(woeid: Integer).void }
      attr_writer :woeid

      sig do
        params(
          count: Integer,
          woeid: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        count: nil,
        # Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
        woeid: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            count: Integer,
            woeid: Integer,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
