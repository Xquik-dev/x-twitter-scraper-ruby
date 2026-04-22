# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Communities
        # @see XTwitterScraper::Resources::X::Communities::Tweets#list_by_community
        class TweetListByCommunityParams < XTwitterScraper::Internal::Type::BaseModel
          extend XTwitterScraper::Internal::Type::RequestParameters::Converter
          include XTwitterScraper::Internal::Type::RequestParameters

          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute cursor
          #   Pagination cursor for community tweets
          #
          #   @return [String, nil]
          optional :cursor, String

          # @!method initialize(id:, cursor: nil, request_options: {})
          #   @param id [String]
          #
          #   @param cursor [String] Pagination cursor for community tweets
          #
          #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
