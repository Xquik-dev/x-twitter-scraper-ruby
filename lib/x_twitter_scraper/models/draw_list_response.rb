# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Draws#list
    class DrawListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute draws
      #
      #   @return [Array<XTwitterScraper::Models::DrawListItem>]
      required :draws, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::DrawListItem] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(draws:, has_more:, next_cursor: nil)
      #   @param draws [Array<XTwitterScraper::Models::DrawListItem>]
      #   @param has_more [Boolean]
      #   @param next_cursor [String]
    end
  end
end
