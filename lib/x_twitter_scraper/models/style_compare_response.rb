# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Styles#compare
    class StyleCompareResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute style1
      #
      #   @return [XTwitterScraper::Models::StyleProfile]
      required :style1, -> { XTwitterScraper::StyleProfile }

      # @!attribute style2
      #
      #   @return [XTwitterScraper::Models::StyleProfile]
      required :style2, -> { XTwitterScraper::StyleProfile }

      # @!method initialize(style1:, style2:)
      #   @param style1 [XTwitterScraper::Models::StyleProfile]
      #   @param style2 [XTwitterScraper::Models::StyleProfile]
    end
  end
end
