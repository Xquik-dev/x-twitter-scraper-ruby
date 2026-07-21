# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Communities
        # @see XTwitterScraper::Resources::X::Communities::Tweets#list
        class TweetListParams < XTwitterScraper::Internal::Type::BaseModel
          extend XTwitterScraper::Internal::Type::RequestParameters::Converter
          include XTwitterScraper::Internal::Type::RequestParameters

          # @!attribute community_id
          #   Numeric ID of the community to search
          #
          #   @return [String]
          required :community_id, String

          # @!attribute q
          #   Keyword query within the selected community
          #
          #   @return [String]
          required :q, String

          # @!attribute cursor
          #   Pagination cursor for community results
          #
          #   @return [String, nil]
          optional :cursor, String

          # @!attribute page_size
          #   Maximum items requested from this page (1-100, default 20). The response can
          #   contain fewer items because the source returned fewer, filters removed items, or
          #   remaining credits cover fewer results. Keep requesting next_cursor while
          #   has_next_page is true, even when a page is empty. The deprecated limit and count
          #   aliases remain accepted.
          #
          #   @return [Integer, nil]
          optional :page_size, Integer

          # @!attribute query_type
          #   Sort order for community results (Latest or Top)
          #
          #   @return [Symbol, XTwitterScraper::Models::X::Communities::TweetListParams::QueryType, nil]
          optional :query_type, enum: -> { XTwitterScraper::X::Communities::TweetListParams::QueryType }

          # @!method initialize(community_id:, q:, cursor: nil, page_size: nil, query_type: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {XTwitterScraper::Models::X::Communities::TweetListParams} for more details.
          #
          #   @param community_id [String] Numeric ID of the community to search
          #
          #   @param q [String] Keyword query within the selected community
          #
          #   @param cursor [String] Pagination cursor for community results
          #
          #   @param page_size [Integer] Maximum items requested from this page (1-100, default 20). The response can con
          #
          #   @param query_type [Symbol, XTwitterScraper::Models::X::Communities::TweetListParams::QueryType] Sort order for community results (Latest or Top)
          #
          #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

          # Sort order for community results (Latest or Top)
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
end
