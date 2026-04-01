# typed: strong

module XTwitterScraper
  module Models
    class RadarRetrieveTrendingTopicsResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig do
        returns(
          T::Array[
            XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse::Item
          ]
        )
      end
      attr_accessor :items

      sig { returns(Integer) }
      attr_accessor :total

      sig do
        params(
          items:
            T::Array[
              XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse::Item::OrHash
            ],
          total: Integer
        ).returns(T.attached_class)
      end
      def self.new(items:, total:)
      end

      sig do
        override.returns(
          {
            items:
              T::Array[
                XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse::Item
              ],
            total: Integer
          }
        )
      end
      def to_hash
      end

      class Item < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse::Item,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :category

        sig { returns(Time) }
        attr_accessor :published_at

        sig { returns(String) }
        attr_accessor :region

        sig { returns(Float) }
        attr_accessor :score

        sig { returns(String) }
        attr_accessor :source

        sig { returns(String) }
        attr_accessor :title

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig { returns(T.nilable(String)) }
        attr_reader :image_url

        sig { params(image_url: String).void }
        attr_writer :image_url

        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        sig do
          params(
            category: String,
            published_at: Time,
            region: String,
            score: Float,
            source: String,
            title: String,
            description: String,
            image_url: String,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          category:,
          published_at:,
          region:,
          score:,
          source:,
          title:,
          description: nil,
          image_url: nil,
          url: nil
        )
        end

        sig do
          override.returns(
            {
              category: String,
              published_at: Time,
              region: String,
              score: Float,
              source: String,
              title: String,
              description: String,
              image_url: String,
              url: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
