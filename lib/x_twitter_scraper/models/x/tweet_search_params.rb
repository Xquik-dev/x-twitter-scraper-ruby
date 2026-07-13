# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#search
      class TweetSearchParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute q
        #   Search query (keywords,
        #
        #   @return [String]
        required :q, String

        # @!attribute cursor
        #   Pagination cursor from previous response
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #   Max tweets to return (server paginates internally). Omit for single page (~20).
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute query_type
        #   Sort order - Latest (chronological) or Top (engagement-ranked)
        #
        #   @return [Symbol, XTwitterScraper::Models::X::TweetSearchParams::QueryType, nil]
        optional :query_type, enum: -> { XTwitterScraper::X::TweetSearchParams::QueryType }

        # @!attribute since_time
        #   ISO 8601 timestamp - only return tweets after this time
        #
        #   @return [String, nil]
        optional :since_time, String

        # @!attribute until_time
        #   ISO 8601 timestamp - only return tweets before this time
        #
        #   @return [String, nil]
        optional :until_time, String

        # @!method initialize(q:, cursor: nil, limit: nil, query_type: nil, since_time: nil, until_time: nil, request_options: {})
        #   @param q [String] Search query (keywords,
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param limit [Integer] Max tweets to return (server paginates internally). Omit for single page (~20).
        #
        #   @param query_type [Symbol, XTwitterScraper::Models::X::TweetSearchParams::QueryType] Sort order - Latest (chronological) or Top (engagement-ranked)
        #
        #   @param since_time [String] ISO 8601 timestamp - only return tweets after this time
        #
        #   @param until_time [String] ISO 8601 timestamp - only return tweets before this time
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

        # Sort order - Latest (chronological) or Top (engagement-ranked)
        module QueryType
          extend XTwitterScraper::Internal::Type::Enum

          LATEST = :Latest
          TOP = :Top

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
