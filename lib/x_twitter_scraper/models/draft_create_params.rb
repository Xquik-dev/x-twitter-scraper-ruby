# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Drafts#create
    class DraftCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute text
      #
      #   @return [String]
      required :text, String

      # @!attribute goal
      #
      #   @return [Symbol, XTwitterScraper::Models::DraftCreateParams::Goal, nil]
      optional :goal, enum: -> { XTwitterScraper::DraftCreateParams::Goal }

      # @!attribute topic
      #
      #   @return [String, nil]
      optional :topic, String

      # @!method initialize(text:, goal: nil, topic: nil, request_options: {})
      #   @param text [String]
      #   @param goal [Symbol, XTwitterScraper::Models::DraftCreateParams::Goal]
      #   @param topic [String]
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      module Goal
        extend XTwitterScraper::Internal::Type::Enum

        ENGAGEMENT = :engagement
        FOLLOWERS = :followers
        AUTHORITY = :authority
        CONVERSATION = :conversation

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
