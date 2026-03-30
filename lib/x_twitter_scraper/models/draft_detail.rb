# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Drafts#create
    class DraftDetail < XTwitterScraper::Internal::Type::BaseModel
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

      # @!attribute updated_at
      #
      #   @return [Time]
      required :updated_at, Time, api_name: :updatedAt

      # @!attribute goal
      #
      #   @return [String, nil]
      optional :goal, String

      # @!attribute topic
      #
      #   @return [String, nil]
      optional :topic, String

      # @!method initialize(id:, created_at:, text:, updated_at:, goal: nil, topic: nil)
      #   @param id [String]
      #   @param created_at [Time]
      #   @param text [String]
      #   @param updated_at [Time]
      #   @param goal [String]
      #   @param topic [String]
    end
  end
end
