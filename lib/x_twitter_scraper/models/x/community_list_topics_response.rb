# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Communities#list_topics
      class CommunityListTopicsResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute topics
        #   Topics in X's order
        #
        #   @return [Array<XTwitterScraper::Models::CommunityTopic>]
        required :topics, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::CommunityTopic] }

        # @!attribute count
        #   Top-level topics returned & charged
        #
        #   @return [Integer]
        required :count, Integer

        # @!attribute message
        #   What to do next. Present only when X lists no topic.
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(topics:, count:, message: nil)
        #   @param topics [Array<XTwitterScraper::Models::CommunityTopic>] Topics in X's order
        #
        #   @param count [Integer] Top-level topics returned & charged
        #
        #   @param message [String] What to do next. Present only when X lists no topic.
      end
    end
  end
end
