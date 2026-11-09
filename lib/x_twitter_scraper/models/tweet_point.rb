# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetPoint < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute coordinates
      #
      #   @return [Array<Float>]
      required :coordinates, XTwitterScraper::Internal::Type::ArrayOf[Float]

      # @!attribute type
      #
      #   @return [Symbol, XTwitterScraper::Models::TweetPoint::Type]
      required :type, enum: -> { XTwitterScraper::TweetPoint::Type }

      # @!method initialize(coordinates:, type:)
      #   Author-published geographic point with 2 numeric coordinates.
      #
      #   @param coordinates [Array<Float>]
      #   @param type [Symbol, XTwitterScraper::Models::TweetPoint::Type]

      # @see XTwitterScraper::Models::TweetPoint#type
      module Type
        extend XTwitterScraper::Internal::Type::Enum

        POINT = :Point

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
