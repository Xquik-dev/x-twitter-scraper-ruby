# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class RadarItem < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   Radar item identifier.
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
      #   BCP-47 language code. und means the source did not identify a language.
      #
      #   @return [String]
      required :language, String

      # @!attribute metadata
      #   Source-specific fields. Shape varies per source:
      #
      #   - reddit: { author, authorId?, subreddit, subredditId?, subredditSubscribers?,
      #     sourceFormat, score?, upvoteRatio?, estimatedUpvotes?, estimatedDownvotes?,
      #     numberComments?, numberCrossposts?, selftext?, contentUrl?, domain?,
      #     postHint?, linkFlairText?, distinguished?, totalAwardsReceived?, viewCount?,
      #     editedAt?, galleryImageUrls?, redditVideo?, archived?, contestMode?,
      #     isCrosspostable?, isMeta?, isNsfw?, isOriginalContent?, isRobotIndexable?,
      #     isSelf?, isSpoiler?, isVideo?, locked?, stickied? }. `score` is Reddit's
      #     public net score. Exact public upvote and downvote counts are not available.
      #     Estimated counts derive from the public score and upvote ratio, which Reddit
      #     may fuzz. Comment bodies are not included. Current items combine public
      #     listing discovery with server-rendered post data and use `sourceFormat: html`;
      #     `json` and `rss` remain for legacy rows.
      #   - github: { starsToday: number }
      #   - hacker_news: { points: number, numberComments: number }
      #   - google_trends: { approxTraffic: number }
      #   - polymarket: { volume24hr: number }
      #   - wikipedia: { views: number }
      #   - trustmrr: { mrr, growthPercent, last30Days, total, customers,
      #     activeSubscriptions, onSale, xHandle?, category?, askingPrice?, country?,
      #     foundedDate?, googleSearchImpressionsLast30Days?, growthMrrPercent?,
      #     multiple?, paymentProvider?, profitMarginLast30Days?, rank?,
      #     revenuePerVisitor?, targetAudience?, visitorsLast30Days? } For the startup
      #     growth source, xHandle is the founder's X username without @. The rank field
      #     is the source's revenue rank. Result order represents reported 30-day
      #     revenue-growth rank.
      #
      #   @return [XTwitterScraper::Models::RadarItem::Metadata]
      required :metadata, -> { XTwitterScraper::RadarItem::Metadata }

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
      #   Source image. Startup growth items return the logo here.
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
      #   @param id [String] Radar item identifier.
      #
      #   @param category [Symbol, XTwitterScraper::Models::RadarItem::Category]
      #
      #   @param created_at [Time]
      #
      #   @param language [String] BCP-47 language code. und means the source did not identify a language.
      #
      #   @param metadata [XTwitterScraper::Models::RadarItem::Metadata] Source-specific fields. Shape varies per source:
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
      #   @param image_url [String] Source image. Startup growth items return the logo here.
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

      # @see XTwitterScraper::Models::RadarItem#metadata
      class Metadata < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute author
        #
        #   @return [String, nil]
        optional :author, String

        # @!attribute content_url
        #
        #   @return [String, nil]
        optional :content_url, String, api_name: :contentUrl

        # @!attribute estimated_downvotes
        #
        #   @return [Integer, nil]
        optional :estimated_downvotes, Integer, api_name: :estimatedDownvotes

        # @!attribute estimated_upvotes
        #
        #   @return [Integer, nil]
        optional :estimated_upvotes, Integer, api_name: :estimatedUpvotes

        # @!attribute number_comments
        #
        #   @return [Integer, nil]
        optional :number_comments, Integer, api_name: :numberComments

        # @!attribute score
        #
        #   @return [Integer, nil]
        optional :score, Integer

        # @!attribute selftext
        #
        #   @return [String, nil]
        optional :selftext, String

        # @!attribute source_format
        #   Current items use html. json and rss are retained for legacy rows.
        #
        #   @return [Symbol, XTwitterScraper::Models::RadarItem::Metadata::SourceFormat, nil]
        optional :source_format,
                 enum: -> { XTwitterScraper::RadarItem::Metadata::SourceFormat },
                 api_name: :sourceFormat

        # @!attribute subreddit
        #
        #   @return [String, nil]
        optional :subreddit, String

        # @!attribute upvote_ratio
        #
        #   @return [Float, nil]
        optional :upvote_ratio, Float, api_name: :upvoteRatio

        # @!method initialize(author: nil, content_url: nil, estimated_downvotes: nil, estimated_upvotes: nil, number_comments: nil, score: nil, selftext: nil, source_format: nil, subreddit: nil, upvote_ratio: nil)
        #   Source-specific fields. Shape varies per source:
        #
        #   - reddit: { author, authorId?, subreddit, subredditId?, subredditSubscribers?,
        #     sourceFormat, score?, upvoteRatio?, estimatedUpvotes?, estimatedDownvotes?,
        #     numberComments?, numberCrossposts?, selftext?, contentUrl?, domain?,
        #     postHint?, linkFlairText?, distinguished?, totalAwardsReceived?, viewCount?,
        #     editedAt?, galleryImageUrls?, redditVideo?, archived?, contestMode?,
        #     isCrosspostable?, isMeta?, isNsfw?, isOriginalContent?, isRobotIndexable?,
        #     isSelf?, isSpoiler?, isVideo?, locked?, stickied? }. `score` is Reddit's
        #     public net score. Exact public upvote and downvote counts are not available.
        #     Estimated counts derive from the public score and upvote ratio, which Reddit
        #     may fuzz. Comment bodies are not included. Current items combine public
        #     listing discovery with server-rendered post data and use `sourceFormat: html`;
        #     `json` and `rss` remain for legacy rows.
        #   - github: { starsToday: number }
        #   - hacker_news: { points: number, numberComments: number }
        #   - google_trends: { approxTraffic: number }
        #   - polymarket: { volume24hr: number }
        #   - wikipedia: { views: number }
        #   - trustmrr: { mrr, growthPercent, last30Days, total, customers,
        #     activeSubscriptions, onSale, xHandle?, category?, askingPrice?, country?,
        #     foundedDate?, googleSearchImpressionsLast30Days?, growthMrrPercent?,
        #     multiple?, paymentProvider?, profitMarginLast30Days?, rank?,
        #     revenuePerVisitor?, targetAudience?, visitorsLast30Days? } For the startup
        #     growth source, xHandle is the founder's X username without @. The rank field
        #     is the source's revenue rank. Result order represents reported 30-day
        #     revenue-growth rank.
        #
        #   @param author [String]
        #
        #   @param content_url [String]
        #
        #   @param estimated_downvotes [Integer]
        #
        #   @param estimated_upvotes [Integer]
        #
        #   @param number_comments [Integer]
        #
        #   @param score [Integer]
        #
        #   @param selftext [String]
        #
        #   @param source_format [Symbol, XTwitterScraper::Models::RadarItem::Metadata::SourceFormat] Current items use html. json and rss are retained for legacy rows.
        #
        #   @param subreddit [String]
        #
        #   @param upvote_ratio [Float]

        # Current items use html. json and rss are retained for legacy rows.
        #
        # @see XTwitterScraper::Models::RadarItem::Metadata#source_format
        module SourceFormat
          extend XTwitterScraper::Internal::Type::Enum

          HTML = :html
          JSON = :json
          RSS = :rss

          # @!method self.values
          #   @return [Array<Symbol>]
        end
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
