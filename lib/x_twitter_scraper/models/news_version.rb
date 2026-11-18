# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class NewsVersion < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   The version's ID.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   When X wrote the version, in UTC, from its ID.
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute headline
      #   The story's headline in this version.
      #
      #   @return [String]
      required :headline, String

      # @!attribute text
      #   The story's text in this version, without its time line.
      #
      #   @return [String]
      required :text, String

      # @!method initialize(id:, created_at:, headline:, text:)
      #   1 version X wrote of a news story.
      #
      #   @param id [String] The version's ID.
      #
      #   @param created_at [Time] When X wrote the version, in UTC, from its ID.
      #
      #   @param headline [String] The story's headline in this version.
      #
      #   @param text [String] The story's text in this version, without its time line.
    end
  end
end
