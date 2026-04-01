# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Compose#create
    class ComposeCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute feedback
      #   AI feedback on the draft
      #
      #   @return [String, nil]
      optional :feedback, String

      # @!attribute score
      #   Engagement score (0-100)
      #
      #   @return [Float, nil]
      optional :score, Float

      # @!attribute suggestions
      #   Improvement suggestions
      #
      #   @return [Array<String>, nil]
      optional :suggestions, XTwitterScraper::Internal::Type::ArrayOf[String]

      # @!attribute text
      #   Generated or refined tweet text
      #
      #   @return [String, nil]
      optional :text, String

      # @!method initialize(feedback: nil, score: nil, suggestions: nil, text: nil)
      #   @param feedback [String] AI feedback on the draft
      #
      #   @param score [Float] Engagement score (0-100)
      #
      #   @param suggestions [Array<String>] Improvement suggestions
      #
      #   @param text [String] Generated or refined tweet text
    end
  end
end
