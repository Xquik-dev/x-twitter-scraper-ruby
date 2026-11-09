# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TopicFilterSummary < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute topic
      #   The topic you sent.
      #
      #   @return [String]
      required :topic, String

      # @!attribute question
      #   The question asked of each post.
      #
      #   @return [String]
      required :question, String

      # @!attribute cutoff
      #   The lowest topicScore a kept post has.
      #
      #   @return [Float]
      required :cutoff, Float

      # @!attribute checked
      #   Posts checked. Only kept posts are billed.
      #
      #   @return [Integer]
      required :checked, Integer

      # @!attribute kept
      #   Posts about the topic, all returned & billed at 2 credits each.
      #
      #   @return [Integer]
      required :kept, Integer

      # @!attribute unchecked
      #   Posts the check couldn't answer. They aren't billed or returned.
      #
      #   @return [Array<XTwitterScraper::Models::TopicFilterSummary::Unchecked>]
      required :unchecked,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TopicFilterSummary::Unchecked] }

      # @!method initialize(topic:, question:, cutoff:, checked:, kept:, unchecked:)
      #   What the topic filter asked & how many posts it kept.
      #
      #   @param topic [String] The topic you sent.
      #
      #   @param question [String] The question asked of each post.
      #
      #   @param cutoff [Float] The lowest topicScore a kept post has.
      #
      #   @param checked [Integer] Posts checked. Only kept posts are billed.
      #
      #   @param kept [Integer] Posts about the topic, all returned & billed at 2 credits each.
      #
      #   @param unchecked [Array<XTwitterScraper::Models::TopicFilterSummary::Unchecked>] Posts the check couldn't answer. They aren't billed or returned.

      # @see XTwitterScraper::Models::TopicFilterSummary#unchecked
      class Unchecked < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute reason
        #
        #   @return [String]
        required :reason, String

        # @!method initialize(id:, reason:)
        #   @param id [String]
        #   @param reason [String]
      end
    end
  end
end
