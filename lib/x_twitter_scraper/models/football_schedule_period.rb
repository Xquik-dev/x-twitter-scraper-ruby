# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballSchedulePeriod < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute type
      #   X's name for the period, such as Quarter.
      #
      #   @return [String, nil]
      required :type, String, nil?: true

      # @!method initialize(type:)
      #   A period of a listed game.
      #
      #   @param type [String, nil] X's name for the period, such as Quarter.
    end
  end
end
