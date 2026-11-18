# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballQuarter < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   X's ID for the quarter within the game.
      #
      #   @return [String, nil]
      required :id, String, nil?: true

      # @!attribute number
      #   The quarter's number.
      #
      #   @return [Integer, nil]
      required :number, Integer, nil?: true

      # @!attribute sequence
      #   The quarter's place in the game, from 1.
      #
      #   @return [Integer, nil]
      required :sequence, Integer, nil?: true

      # @!attribute drives
      #   The quarter's drives, in order.
      #
      #   @return [Array<XTwitterScraper::Models::FootballDrive>]
      required :drives, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FootballDrive] }

      # @!method initialize(id:, number:, sequence:, drives:)
      #   A quarter & its drives.
      #
      #   @param id [String, nil] X's ID for the quarter within the game.
      #
      #   @param number [Integer, nil] The quarter's number.
      #
      #   @param sequence [Integer, nil] The quarter's place in the game, from 1.
      #
      #   @param drives [Array<XTwitterScraper::Models::FootballDrive>] The quarter's drives, in order.
    end
  end
end
