# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Drafts#list
    class DraftListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute drafts
      #
      #   @return [Array<XTwitterScraper::Models::Draft>]
      required :drafts, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Draft] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(drafts:, has_more:, next_cursor: nil)
      #   @param drafts [Array<XTwitterScraper::Models::Draft>]
      #   @param has_more [Boolean]
      #   @param next_cursor [String]
    end
  end
end
