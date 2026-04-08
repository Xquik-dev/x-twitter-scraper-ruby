# typed: strong

module XTwitterScraper
  module Models
    class XGetTrendsResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XGetTrendsResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :count

      sig do
        returns(T::Array[XTwitterScraper::Models::XGetTrendsResponse::Trend])
      end
      attr_accessor :trends

      sig { returns(Integer) }
      attr_accessor :woeid

      sig do
        params(
          count: Integer,
          trends:
            T::Array[
              XTwitterScraper::Models::XGetTrendsResponse::Trend::OrHash
            ],
          woeid: Integer
        ).returns(T.attached_class)
      end
      def self.new(count:, trends:, woeid:)
      end

      sig do
        override.returns(
          {
            count: Integer,
            trends:
              T::Array[XTwitterScraper::Models::XGetTrendsResponse::Trend],
            woeid: Integer
          }
        )
      end
      def to_hash
      end

      class Trend < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::XGetTrendsResponse::Trend,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig { returns(T.nilable(String)) }
        attr_reader :query

        sig { params(query: String).void }
        attr_writer :query

        sig { returns(T.nilable(Integer)) }
        attr_reader :rank

        sig { params(rank: Integer).void }
        attr_writer :rank

        sig do
          params(
            name: String,
            description: String,
            query: String,
            rank: Integer
          ).returns(T.attached_class)
        end
        def self.new(name:, description: nil, query: nil, rank: nil)
        end

        sig do
          override.returns(
            { name: String, description: String, query: String, rank: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
