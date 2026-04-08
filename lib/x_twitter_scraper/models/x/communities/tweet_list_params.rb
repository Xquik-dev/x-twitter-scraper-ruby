# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Communities
        # @see XTwitterScraper::Resources::X::Communities::Tweets#list
        class TweetListParams < XTwitterScraper::Internal::Type::BaseModel
          extend XTwitterScraper::Internal::Type::RequestParameters::Converter
          include XTwitterScraper::Internal::Type::RequestParameters

          # @!attribute q
          #   Search query for cross-community tweets
          #
          #   @return [String]
          required :q, String

          # @!attribute cursor
          #   Pagination cursor for cross-community results
          #
          #   @return [String, nil]
          optional :cursor, String

          # @!attribute query_type
          #   Sort order for cross-community results (Latest or Top)
          #
          #   @return [String, nil]
          optional :query_type, String

          # @!method initialize(q:, cursor: nil, query_type: nil, request_options: {})
          #   @param q [String] Search query for cross-community tweets
          #
          #   @param cursor [String] Pagination cursor for cross-community results
          #
          #   @param query_type [String] Sort order for cross-community results (Latest or Top)
          #
          #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
