# typed: strong

module XTwitterScraper
  module Models
    class RadarRetrieveTrendingTopicsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::RadarRetrieveTrendingTopicsParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Cursor for pagination (from prior response nextCursor).
      sig { returns(T.nilable(String)) }
      attr_reader :after

      sig { params(after: String).void }
      attr_writer :after

      # Filter by category.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category::OrSymbol
          )
        )
      end
      attr_reader :category

      sig do
        params(
          category:
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category::OrSymbol
        ).void
      end
      attr_writer :category

      # Lookback window in hours (1-168, default 24).
      sig { returns(T.nilable(Integer)) }
      attr_reader :hours

      sig { params(hours: Integer).void }
      attr_writer :hours

      # Number of items to return (1-100, default 50).
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Region filter (us, global, etc.)
      sig { returns(T.nilable(String)) }
      attr_reader :region

      sig { params(region: String).void }
      attr_writer :region

      # Source filter. One of: github, google_trends, hacker_news, polymarket, reddit,
      # trustmrr, wikipedia
      sig do
        returns(
          T.nilable(
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::OrSymbol
          )
        )
      end
      attr_reader :source

      sig do
        params(
          source:
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::OrSymbol
        ).void
      end
      attr_writer :source

      sig do
        params(
          after: String,
          category:
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category::OrSymbol,
          hours: Integer,
          limit: Integer,
          region: String,
          source:
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor for pagination (from prior response nextCursor).
        after: nil,
        # Filter by category.
        category: nil,
        # Lookback window in hours (1-168, default 24).
        hours: nil,
        # Number of items to return (1-100, default 50).
        limit: nil,
        # Region filter (us, global, etc.)
        region: nil,
        # Source filter. One of: github, google_trends, hacker_news, polymarket, reddit,
        # trustmrr, wikipedia
        source: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            after: String,
            category:
              XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category::OrSymbol,
            hours: Integer,
            limit: Integer,
            region: String,
            source:
              XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::OrSymbol,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by category.
      module Category
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        GENERAL =
          T.let(
            :general,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category::TaggedSymbol
          )
        TECH =
          T.let(
            :tech,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category::TaggedSymbol
          )
        DEV =
          T.let(
            :dev,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category::TaggedSymbol
          )
        SCIENCE =
          T.let(
            :science,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category::TaggedSymbol
          )
        CULTURE =
          T.let(
            :culture,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category::TaggedSymbol
          )
        POLITICS =
          T.let(
            :politics,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category::TaggedSymbol
          )
        BUSINESS =
          T.let(
            :business,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category::TaggedSymbol
          )
        ENTERTAINMENT =
          T.let(
            :entertainment,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Source filter. One of: github, google_trends, hacker_news, polymarket, reddit,
      # trustmrr, wikipedia
      module Source
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        GITHUB =
          T.let(
            :github,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::TaggedSymbol
          )
        GOOGLE_TRENDS =
          T.let(
            :google_trends,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::TaggedSymbol
          )
        HACKER_NEWS =
          T.let(
            :hacker_news,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::TaggedSymbol
          )
        POLYMARKET =
          T.let(
            :polymarket,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::TaggedSymbol
          )
        REDDIT =
          T.let(
            :reddit,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::TaggedSymbol
          )
        TRUSTMRR =
          T.let(
            :trustmrr,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::TaggedSymbol
          )
        WIKIPEDIA =
          T.let(
            :wikipedia,
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
