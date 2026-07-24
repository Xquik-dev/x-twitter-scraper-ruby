# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class Draft < XTwitterScraper::Internal::Type::BaseModel
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

      # @!attribute goal
      #
      #   @return [String, nil]
      optional :goal, String

      # @!attribute topic
      #
      #   @return [String, nil]
      optional :topic, String

      # @!method initialize(id:, created_at:, text:, goal: nil, topic: nil)
      #   Saved tweet draft with optional topic and goal.
      #
      #   @param id [String]
      #   @param created_at [Time]
      #   @param text [String]
      #   @param goal [String]
      #   @param topic [String]
    end
  end
end
