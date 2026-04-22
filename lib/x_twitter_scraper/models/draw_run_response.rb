# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Draws#run
    class DrawRunResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute total_entries
      #
      #   @return [Integer]
      required :total_entries, Integer, api_name: :totalEntries

      # @!attribute tweet_id
      #
      #   @return [String]
      required :tweet_id, String, api_name: :tweetId

      # @!attribute valid_entries
      #
      #   @return [Integer]
      required :valid_entries, Integer, api_name: :validEntries

      # @!attribute winners
      #
      #   @return [Array<XTwitterScraper::Models::Winner>]
      required :winners, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Winner] }

      # @!method initialize(id:, total_entries:, tweet_id:, valid_entries:, winners:)
      #   @param id [String]
      #   @param total_entries [Integer]
      #   @param tweet_id [String]
      #   @param valid_entries [Integer]
      #   @param winners [Array<XTwitterScraper::Models::Winner>]
    end
  end
end
