# frozen_string_literal: true

module XTwitterScraper
  module Models
    class RadarItem < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   Internal numeric identifier (stringified bigint).
      #
      #   @return [String]
      required :id, String

      # @!attribute category
      #
      #   @return [Symbol, XTwitterScraper::Models::RadarItem::Category]
      required :category, enum: -> { XTwitterScraper::RadarItem::Category }

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute language
      #
      #   @return [String]
      required :language, String

      # @!attribute metadata
      #   Source-specific fields. Shape varies per source:
      #
      #   - reddit: { subreddit: string, author: string }
      #   - github: { starsToday: number }
      #   - hacker_news: { points: number, numberComments: number }
      #   - google_trends: { approxTraffic: number }
      #   - polymarket: { volume24hr: number }
      #   - wikipedia: { views: number }
      #   - trustmrr: { mrr, growthPercent, last30Days, total, customers,
      #     activeSubscriptions, onSale, xHandle?, category?, askingPrice?, country?,
      #     growthMrrPercent?, multiple?, paymentProvider?, rank? }
      #
      #   @return [Hash{Symbol=>Object}]
      required :metadata, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

      # @!attribute published_at
      #
      #   @return [Time]
      required :published_at, Time, api_name: :publishedAt

      # @!attribute region
      #
      #   @return [String]
      required :region, String

      # @!attribute score
      #
      #   @return [Float]
      required :score, Float

      # @!attribute source
      #
      #   @return [Symbol, XTwitterScraper::Models::RadarItem::Source]
      required :source, enum: -> { XTwitterScraper::RadarItem::Source }

      # @!attribute source_id
      #   Source-specific identifier used for deduplication.
      #
      #   @return [String]
      required :source_id, String, api_name: :sourceId

      # @!attribute title
      #
      #   @return [String]
      required :title, String

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute image_url
      #
      #   @return [String, nil]
      optional :image_url, String, api_name: :imageUrl

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(id:, category:, created_at:, language:, metadata:, published_at:, region:, score:, source:, source_id:, title:, description: nil, image_url: nil, url: nil)
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::RadarItem} for more details.
      #
      #   Trending topic with score, category, source, region, language, and
      #   source-specific metadata.
      #
      #   @param id [String] Internal numeric identifier (stringified bigint).
      #
      #   @param category [Symbol, XTwitterScraper::Models::RadarItem::Category]
      #
      #   @param created_at [Time]
      #
      #   @param language [String]
      #
      #   @param metadata [Hash{Symbol=>Object}] Source-specific fields. Shape varies per source:
      #
      #   @param published_at [Time]
      #
      #   @param region [String]
      #
      #   @param score [Float]
      #
      #   @param source [Symbol, XTwitterScraper::Models::RadarItem::Source]
      #
      #   @param source_id [String] Source-specific identifier used for deduplication.
      #
      #   @param title [String]
      #
      #   @param description [String]
      #
      #   @param image_url [String]
      #
      #   @param url [String]

      # @see XTwitterScraper::Models::RadarItem#category
      module Category
        extend XTwitterScraper::Internal::Type::Enum

        GENERAL = :general
        TECH = :tech
        DEV = :dev
        SCIENCE = :science
        CULTURE = :culture
        POLITICS = :politics
        BUSINESS = :business
        ENTERTAINMENT = :entertainment

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see XTwitterScraper::Models::RadarItem#source
      module Source
        extend XTwitterScraper::Internal::Type::Enum

        GITHUB = :github
        GOOGLE_TRENDS = :google_trends
        HACKER_NEWS = :hacker_news
        POLYMARKET = :polymarket
        REDDIT = :reddit
        TRUSTMRR = :trustmrr
        WIKIPEDIA = :wikipedia

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
