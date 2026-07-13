# typed: strong

module XTwitterScraper
  module Models
    class RadarItem < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::RadarItem, XTwitterScraper::Internal::AnyHash)
        end

      # Internal numeric identifier (stringified bigint).
      sig { returns(String) }
      attr_accessor :id

      sig { returns(XTwitterScraper::RadarItem::Category::TaggedSymbol) }
      attr_accessor :category

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(String) }
      attr_accessor :language

      # Source-specific fields. Shape varies per source:
      #
      # - reddit: { subreddit: string, author: string }
      # - github: { starsToday: number }
      # - hacker_news: { points: number, numberComments: number }
      # - google_trends: { approxTraffic: number }
      # - polymarket: { volume24hr: number }
      # - wikipedia: { views: number }
      # - trustmrr: { mrr, growthPercent, last30Days, total, customers,
      #   activeSubscriptions, onSale, xHandle?, category?, askingPrice?, country?,
      #   growthMrrPercent?, multiple?, paymentProvider?, rank? }
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :metadata

      sig { returns(Time) }
      attr_accessor :published_at

      sig { returns(String) }
      attr_accessor :region

      sig { returns(Float) }
      attr_accessor :score

      sig { returns(XTwitterScraper::RadarItem::Source::TaggedSymbol) }
      attr_accessor :source

      # Source-specific identifier used for deduplication.
      sig { returns(String) }
      attr_accessor :source_id

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

      # Trending topic with score, category, source, region, language, and
      # source-specific metadata.
      sig do
        params(
          id: String,
          category: XTwitterScraper::RadarItem::Category::OrSymbol,
          created_at: Time,
          language: String,
          metadata: T::Hash[Symbol, T.anything],
          published_at: Time,
          region: String,
          score: Float,
          source: XTwitterScraper::RadarItem::Source::OrSymbol,
          source_id: String,
          title: String,
          description: String,
          image_url: String,
          url: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Internal numeric identifier (stringified bigint).
        id:,
        category:,
        created_at:,
        language:,
        # Source-specific fields. Shape varies per source:
        #
        # - reddit: { subreddit: string, author: string }
        # - github: { starsToday: number }
        # - hacker_news: { points: number, numberComments: number }
        # - google_trends: { approxTraffic: number }
        # - polymarket: { volume24hr: number }
        # - wikipedia: { views: number }
        # - trustmrr: { mrr, growthPercent, last30Days, total, customers,
        #   activeSubscriptions, onSale, xHandle?, category?, askingPrice?, country?,
        #   growthMrrPercent?, multiple?, paymentProvider?, rank? }
        metadata:,
        published_at:,
        region:,
        score:,
        source:,
        # Source-specific identifier used for deduplication.
        source_id:,
        title:,
        description: nil,
        image_url: nil,
        url: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            category: XTwitterScraper::RadarItem::Category::TaggedSymbol,
            created_at: Time,
            language: String,
            metadata: T::Hash[Symbol, T.anything],
            published_at: Time,
            region: String,
            score: Float,
            source: XTwitterScraper::RadarItem::Source::TaggedSymbol,
            source_id: String,
            title: String,
            description: String,
            image_url: String,
            url: String
          }
        )
      end
      def to_hash
      end

      module Category
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::RadarItem::Category) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        GENERAL =
          T.let(:general, XTwitterScraper::RadarItem::Category::TaggedSymbol)
        TECH = T.let(:tech, XTwitterScraper::RadarItem::Category::TaggedSymbol)
        DEV = T.let(:dev, XTwitterScraper::RadarItem::Category::TaggedSymbol)
        SCIENCE =
          T.let(:science, XTwitterScraper::RadarItem::Category::TaggedSymbol)
        CULTURE =
          T.let(:culture, XTwitterScraper::RadarItem::Category::TaggedSymbol)
        POLITICS =
          T.let(:politics, XTwitterScraper::RadarItem::Category::TaggedSymbol)
        BUSINESS =
          T.let(:business, XTwitterScraper::RadarItem::Category::TaggedSymbol)
        ENTERTAINMENT =
          T.let(
            :entertainment,
            XTwitterScraper::RadarItem::Category::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::RadarItem::Category::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Source
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::RadarItem::Source) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        GITHUB =
          T.let(:github, XTwitterScraper::RadarItem::Source::TaggedSymbol)
        GOOGLE_TRENDS =
          T.let(
            :google_trends,
            XTwitterScraper::RadarItem::Source::TaggedSymbol
          )
        HACKER_NEWS =
          T.let(:hacker_news, XTwitterScraper::RadarItem::Source::TaggedSymbol)
        POLYMARKET =
          T.let(:polymarket, XTwitterScraper::RadarItem::Source::TaggedSymbol)
        REDDIT =
          T.let(:reddit, XTwitterScraper::RadarItem::Source::TaggedSymbol)
        TRUSTMRR =
          T.let(:trustmrr, XTwitterScraper::RadarItem::Source::TaggedSymbol)
        WIKIPEDIA =
          T.let(:wikipedia, XTwitterScraper::RadarItem::Source::TaggedSymbol)

        sig do
          override.returns(
            T::Array[XTwitterScraper::RadarItem::Source::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
