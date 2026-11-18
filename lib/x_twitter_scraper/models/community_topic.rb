# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class CommunityTopic < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   Topic ID. Pass it as topicId to /x/communities/popular.
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Topic name, which topic on /x/communities/popular takes
      #
      #   @return [String]
      required :name, String

      # @!attribute subtopics
      #   Narrower topics inside this topic
      #
      #   @return [Array<XTwitterScraper::Models::CommunityTopic::Subtopic>]
      required :subtopics, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::CommunityTopic::Subtopic] }

      # @!method initialize(id:, name:, subtopics:)
      #   A topic X groups communities under, with its subtopics.
      #
      #   @param id [String] Topic ID. Pass it as topicId to /x/communities/popular.
      #
      #   @param name [String] Topic name, which topic on /x/communities/popular takes
      #
      #   @param subtopics [Array<XTwitterScraper::Models::CommunityTopic::Subtopic>] Narrower topics inside this topic

      class Subtopic < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #   Subtopic ID, which topicId also takes
        #
        #   @return [String]
        required :id, String

        # @!attribute name
        #   Subtopic name, which topic also takes
        #
        #   @return [String]
        required :name, String

        # @!method initialize(id:, name:)
        #   @param id [String] Subtopic ID, which topicId also takes
        #
        #   @param name [String] Subtopic name, which topic also takes
      end
    end
  end
end
