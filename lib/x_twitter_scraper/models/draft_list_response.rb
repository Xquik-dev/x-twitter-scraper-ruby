# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Drafts#list
    class DraftListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute drafts
      #
      #   @return [Array<XTwitterScraper::Models::DraftListResponse::Draft>]
      required :drafts,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::DraftListResponse::Draft] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(drafts:, has_more:, next_cursor: nil)
      #   @param drafts [Array<XTwitterScraper::Models::DraftListResponse::Draft>]
      #   @param has_more [Boolean]
      #   @param next_cursor [String]

      class Draft < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute goal
        #
        #   @return [String, nil]
        optional :goal, String

        # @!attribute topic
        #
        #   @return [String, nil]
        optional :topic, String

        # @!method initialize(id:, created_at:, text:, goal: nil, topic: nil)
        #   @param id [String]
        #   @param created_at [Time]
        #   @param text [String]
        #   @param goal [String]
        #   @param topic [String]
      end
    end
  end
end
