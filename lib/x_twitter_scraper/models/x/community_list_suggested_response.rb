# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Communities#list_suggested
      class CommunityListSuggestedResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute communities
        #   Suggested communities in X's order
        #
        #   @return [Array<XTwitterScraper::Models::Community>]
        required :communities, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Community] }

        # @!attribute count
        #   Communities returned & charged
        #
        #   @return [Integer]
        required :count, Integer

        # @!attribute message
        #   What to do next. Present only when X suggests none.
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(communities:, count:, message: nil)
        #   @param communities [Array<XTwitterScraper::Models::Community>] Suggested communities in X's order
        #
        #   @param count [Integer] Communities returned & charged
        #
        #   @param message [String] What to do next. Present only when X suggests none.
      end
    end
  end
end
