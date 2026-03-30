# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Draws#retrieve
    class DrawRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute draw
      #
      #   @return [XTwitterScraper::Models::DrawDetail]
      required :draw, -> { XTwitterScraper::DrawDetail }

      # @!attribute winners
      #
      #   @return [Array<XTwitterScraper::Models::Winner>]
      required :winners, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Winner] }

      # @!method initialize(draw:, winners:)
      #   @param draw [XTwitterScraper::Models::DrawDetail]
      #   @param winners [Array<XTwitterScraper::Models::Winner>]
    end
  end
end
