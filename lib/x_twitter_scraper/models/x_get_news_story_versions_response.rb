# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_news_story_versions
    class XGetNewsStoryVersionsResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   The story's ID, as the request named it.
      #
      #   @return [String]
      required :id, String

      # @!attribute count
      #   Versions returned.
      #
      #   @return [Integer]
      required :count, Integer

      # @!attribute versions
      #
      #   @return [Array<XTwitterScraper::Models::NewsVersion>]
      required :versions, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::NewsVersion] }

      # @!method initialize(id:, count:, versions:)
      #   @param id [String] The story's ID, as the request named it.
      #
      #   @param count [Integer] Versions returned.
      #
      #   @param versions [Array<XTwitterScraper::Models::NewsVersion>]
    end
  end
end
