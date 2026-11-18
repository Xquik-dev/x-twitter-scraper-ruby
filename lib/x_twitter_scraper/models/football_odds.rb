# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballOdds < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute money_line
      #   The money line. X sends it for the away team only.
      #
      #   @return [String, nil]
      required :money_line, String, api_name: :moneyLine, nil?: true

      # @!attribute spread
      #   The point spread.
      #
      #   @return [String, nil]
      required :spread, String, nil?: true

      # @!attribute total
      #   The over or under total.
      #
      #   @return [String, nil]
      required :total, String, nil?: true

      # @!method initialize(money_line:, spread:, total:)
      #   Betting odds titles for 1 team, as X shows them.
      #
      #   @param money_line [String, nil] The money line. X sends it for the away team only.
      #
      #   @param spread [String, nil] The point spread.
      #
      #   @param total [String, nil] The over or under total.
    end
  end
end
