# typed: strong

module XTwitterScraper
  module Models
    class RadarItem < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::RadarItem, XTwitterScraper::Internal::AnyHash)
        end

      # Radar item identifier.
      sig { returns(String) }
      attr_accessor :id

      sig { returns(XTwitterScraper::RadarItem::Category::TaggedSymbol) }
      attr_accessor :category

      sig { returns(Time) }
      attr_accessor :created_at

      # BCP-47 language code. und means the source did not identify a language.
      sig { returns(String) }
      attr_accessor :language

      # Source-specific fields. Shape varies per source:
      #
      # - reddit: { author, authorId?, subreddit, subredditId?, subredditSubscribers?,
      #   sourceFormat, score?, upvoteRatio?, estimatedUpvotes?, estimatedDownvotes?,
      #   numberComments?, numberCrossposts?, selftext?, contentUrl?, domain?,
      #   postHint?, linkFlairText?, distinguished?, totalAwardsReceived?, viewCount?,
      #   editedAt?, galleryImageUrls?, redditVideo?, archived?, contestMode?,
      #   isCrosspostable?, isMeta?, isNsfw?, isOriginalContent?, isRobotIndexable?,
      #   isSelf?, isSpoiler?, isVideo?, locked?, stickied? }. `score` is Reddit's
      #   public net score. Exact public upvote and downvote counts are not available.
      #   Estimated counts derive from the public score and upvote ratio, which Reddit
      #   may fuzz. Comment bodies are not included. Current items combine public
      #   listing discovery with server-rendered post data and use `sourceFormat: html`;
      #   `json` and `rss` remain for legacy rows.
      # - github: { starsToday: number }
      # - hacker_news: { points: number, numberComments: number }
      # - google_trends: { approxTraffic: number }
      # - polymarket: { volume24hr: number }
      # - wikipedia: { views: number }
      # - trustmrr: { mrr, growthPercent, last30Days, total, customers,
      #   activeSubscriptions, onSale, xHandle?, category?, askingPrice?, country?,
      #   foundedDate?, googleSearchImpressionsLast30Days?, growthMrrPercent?,
      #   multiple?, paymentProvider?, profitMarginLast30Days?, rank?,
      #   revenuePerVisitor?, targetAudience?, visitorsLast30Days? } For the startup
      #   growth source, xHandle is the founder's X username without @. The rank field
      #   is the source's revenue rank. Result order represents reported 30-day
      #   revenue-growth rank.
      sig { returns(XTwitterScraper::RadarItem::Metadata) }
      attr_reader :metadata

      sig do
        params(metadata: XTwitterScraper::RadarItem::Metadata::OrHash).void
      end
      attr_writer :metadata

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

      # Source image. Startup growth items return the logo here.
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
          metadata: XTwitterScraper::RadarItem::Metadata::OrHash,
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
        # Radar item identifier.
        id:,
        category:,
        created_at:,
        # BCP-47 language code. und means the source did not identify a language.
        language:,
        # Source-specific fields. Shape varies per source:
        #
        # - reddit: { author, authorId?, subreddit, subredditId?, subredditSubscribers?,
        #   sourceFormat, score?, upvoteRatio?, estimatedUpvotes?, estimatedDownvotes?,
        #   numberComments?, numberCrossposts?, selftext?, contentUrl?, domain?,
        #   postHint?, linkFlairText?, distinguished?, totalAwardsReceived?, viewCount?,
        #   editedAt?, galleryImageUrls?, redditVideo?, archived?, contestMode?,
        #   isCrosspostable?, isMeta?, isNsfw?, isOriginalContent?, isRobotIndexable?,
        #   isSelf?, isSpoiler?, isVideo?, locked?, stickied? }. `score` is Reddit's
        #   public net score. Exact public upvote and downvote counts are not available.
        #   Estimated counts derive from the public score and upvote ratio, which Reddit
        #   may fuzz. Comment bodies are not included. Current items combine public
        #   listing discovery with server-rendered post data and use `sourceFormat: html`;
        #   `json` and `rss` remain for legacy rows.
        # - github: { starsToday: number }
        # - hacker_news: { points: number, numberComments: number }
        # - google_trends: { approxTraffic: number }
        # - polymarket: { volume24hr: number }
        # - wikipedia: { views: number }
        # - trustmrr: { mrr, growthPercent, last30Days, total, customers,
        #   activeSubscriptions, onSale, xHandle?, category?, askingPrice?, country?,
        #   foundedDate?, googleSearchImpressionsLast30Days?, growthMrrPercent?,
        #   multiple?, paymentProvider?, profitMarginLast30Days?, rank?,
        #   revenuePerVisitor?, targetAudience?, visitorsLast30Days? } For the startup
        #   growth source, xHandle is the founder's X username without @. The rank field
        #   is the source's revenue rank. Result order represents reported 30-day
        #   revenue-growth rank.
        metadata:,
        published_at:,
        region:,
        score:,
        source:,
        # Source-specific identifier used for deduplication.
        source_id:,
        title:,
        description: nil,
        # Source image. Startup growth items return the logo here.
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
            metadata: XTwitterScraper::RadarItem::Metadata,
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

      class Metadata < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::RadarItem::Metadata,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :author

        sig { params(author: String).void }
        attr_writer :author

        sig { returns(T.nilable(String)) }
        attr_reader :content_url

        sig { params(content_url: String).void }
        attr_writer :content_url

        sig { returns(T.nilable(Integer)) }
        attr_reader :estimated_downvotes

        sig { params(estimated_downvotes: Integer).void }
        attr_writer :estimated_downvotes

        sig { returns(T.nilable(Integer)) }
        attr_reader :estimated_upvotes

        sig { params(estimated_upvotes: Integer).void }
        attr_writer :estimated_upvotes

        sig { returns(T.nilable(Integer)) }
        attr_reader :number_comments

        sig { params(number_comments: Integer).void }
        attr_writer :number_comments

        sig { returns(T.nilable(Integer)) }
        attr_reader :score

        sig { params(score: Integer).void }
        attr_writer :score

        sig { returns(T.nilable(String)) }
        attr_reader :selftext

        sig { params(selftext: String).void }
        attr_writer :selftext

        # Current items use html. json and rss are retained for legacy rows.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::RadarItem::Metadata::SourceFormat::TaggedSymbol
            )
          )
        end
        attr_reader :source_format

        sig do
          params(
            source_format:
              XTwitterScraper::RadarItem::Metadata::SourceFormat::OrSymbol
          ).void
        end
        attr_writer :source_format

        sig { returns(T.nilable(String)) }
        attr_reader :subreddit

        sig { params(subreddit: String).void }
        attr_writer :subreddit

        sig { returns(T.nilable(Float)) }
        attr_reader :upvote_ratio

        sig { params(upvote_ratio: Float).void }
        attr_writer :upvote_ratio

        # Source-specific fields. Shape varies per source:
        #
        # - reddit: { author, authorId?, subreddit, subredditId?, subredditSubscribers?,
        #   sourceFormat, score?, upvoteRatio?, estimatedUpvotes?, estimatedDownvotes?,
        #   numberComments?, numberCrossposts?, selftext?, contentUrl?, domain?,
        #   postHint?, linkFlairText?, distinguished?, totalAwardsReceived?, viewCount?,
        #   editedAt?, galleryImageUrls?, redditVideo?, archived?, contestMode?,
        #   isCrosspostable?, isMeta?, isNsfw?, isOriginalContent?, isRobotIndexable?,
        #   isSelf?, isSpoiler?, isVideo?, locked?, stickied? }. `score` is Reddit's
        #   public net score. Exact public upvote and downvote counts are not available.
        #   Estimated counts derive from the public score and upvote ratio, which Reddit
        #   may fuzz. Comment bodies are not included. Current items combine public
        #   listing discovery with server-rendered post data and use `sourceFormat: html`;
        #   `json` and `rss` remain for legacy rows.
        # - github: { starsToday: number }
        # - hacker_news: { points: number, numberComments: number }
        # - google_trends: { approxTraffic: number }
        # - polymarket: { volume24hr: number }
        # - wikipedia: { views: number }
        # - trustmrr: { mrr, growthPercent, last30Days, total, customers,
        #   activeSubscriptions, onSale, xHandle?, category?, askingPrice?, country?,
        #   foundedDate?, googleSearchImpressionsLast30Days?, growthMrrPercent?,
        #   multiple?, paymentProvider?, profitMarginLast30Days?, rank?,
        #   revenuePerVisitor?, targetAudience?, visitorsLast30Days? } For the startup
        #   growth source, xHandle is the founder's X username without @. The rank field
        #   is the source's revenue rank. Result order represents reported 30-day
        #   revenue-growth rank.
        sig do
          params(
            author: String,
            content_url: String,
            estimated_downvotes: Integer,
            estimated_upvotes: Integer,
            number_comments: Integer,
            score: Integer,
            selftext: String,
            source_format:
              XTwitterScraper::RadarItem::Metadata::SourceFormat::OrSymbol,
            subreddit: String,
            upvote_ratio: Float
          ).returns(T.attached_class)
        end
        def self.new(
          author: nil,
          content_url: nil,
          estimated_downvotes: nil,
          estimated_upvotes: nil,
          number_comments: nil,
          score: nil,
          selftext: nil,
          # Current items use html. json and rss are retained for legacy rows.
          source_format: nil,
          subreddit: nil,
          upvote_ratio: nil
        )
        end

        sig do
          override.returns(
            {
              author: String,
              content_url: String,
              estimated_downvotes: Integer,
              estimated_upvotes: Integer,
              number_comments: Integer,
              score: Integer,
              selftext: String,
              source_format:
                XTwitterScraper::RadarItem::Metadata::SourceFormat::TaggedSymbol,
              subreddit: String,
              upvote_ratio: Float
            }
          )
        end
        def to_hash
        end

        # Current items use html. json and rss are retained for legacy rows.
        module SourceFormat
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, XTwitterScraper::RadarItem::Metadata::SourceFormat)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HTML =
            T.let(
              :html,
              XTwitterScraper::RadarItem::Metadata::SourceFormat::TaggedSymbol
            )
          JSON =
            T.let(
              :json,
              XTwitterScraper::RadarItem::Metadata::SourceFormat::TaggedSymbol
            )
          RSS =
            T.let(
              :rss,
              XTwitterScraper::RadarItem::Metadata::SourceFormat::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::RadarItem::Metadata::SourceFormat::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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
