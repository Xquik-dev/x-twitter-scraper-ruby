# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Draws#list
    class DrawListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute draws
      #
      #   @return [Array<XTwitterScraper::Models::DrawListResponse::Draw>]
      required :draws,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::DrawListResponse::Draw] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(draws:, has_more:, next_cursor: nil)
      #   @param draws [Array<XTwitterScraper::Models::DrawListResponse::Draw>]
      #   @param has_more [Boolean]
      #   @param next_cursor [String]

      class Draw < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute status
        #
        #   @return [String]
        required :status, String

        # @!attribute total_entries
        #
        #   @return [Integer]
        required :total_entries, Integer, api_name: :totalEntries

        # @!attribute tweet_url
        #
        #   @return [String]
        required :tweet_url, String, api_name: :tweetUrl

        # @!attribute valid_entries
        #
        #   @return [Integer]
        required :valid_entries, Integer, api_name: :validEntries

        # @!attribute drawn_at
        #
        #   @return [Time, nil]
        optional :drawn_at, Time, api_name: :drawnAt

        # @!method initialize(id:, created_at:, status:, total_entries:, tweet_url:, valid_entries:, drawn_at: nil)
        #   Giveaway draw summary with entry counts and status.
        #
        #   @param id [String]
        #   @param created_at [Time]
        #   @param status [String]
        #   @param total_entries [Integer]
        #   @param tweet_url [String]
        #   @param valid_entries [Integer]
        #   @param drawn_at [Time]
      end
    end
  end
end
