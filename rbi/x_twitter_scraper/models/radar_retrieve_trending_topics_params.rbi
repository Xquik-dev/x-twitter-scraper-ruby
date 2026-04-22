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

      # Filter by category (general, tech, dev, etc.)
      sig { returns(T.nilable(String)) }
      attr_reader :category

      sig { params(category: String).void }
      attr_writer :category

      # Number of items to return
      sig { returns(T.nilable(Integer)) }
      attr_reader :count

      sig { params(count: Integer).void }
      attr_writer :count

      # Lookback window in hours
      sig { returns(T.nilable(Integer)) }
      attr_reader :hours

      sig { params(hours: Integer).void }
      attr_writer :hours

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
          category: String,
          count: Integer,
          hours: Integer,
          region: String,
          source:
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter by category (general, tech, dev, etc.)
        category: nil,
        # Number of items to return
        count: nil,
        # Lookback window in hours
        hours: nil,
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
            category: String,
            count: Integer,
            hours: Integer,
            region: String,
            source:
              XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::OrSymbol,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
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
