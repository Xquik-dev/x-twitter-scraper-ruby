# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetUserMention < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id_str
      #
      #   @return [String, nil]
      optional :id_str, String

      # @!attribute indices
      #
      #   @return [Array<Integer>, nil]
      optional :indices, XTwitterScraper::Internal::Type::ArrayOf[Integer]

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute screen_name
      #
      #   @return [String]
      required :screen_name, String

      # @!method initialize(screen_name:, id_str: nil, indices: nil, name: nil)
      #   Profile identity and source offsets of a mention.
      #
      #   @param screen_name [String]
      #
      #   @param id_str [String]
      #
      #   @param indices [Array<Integer>]
      #
      #   @param name [String]
    end
  end
end
