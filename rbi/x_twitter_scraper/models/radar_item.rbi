# typed: strong

module XTwitterScraper
  module Models
    class RadarItem < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::RadarItem, XTwitterScraper::Internal::AnyHash)
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
