# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Styles#compare
    class StyleCompareResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute style1
      #   Full style profile with sampled tweets used for tone analysis.
      #
      #   @return [XTwitterScraper::Models::StyleProfile]
      required :style1, -> { XTwitterScraper::StyleProfile }

      # @!attribute style2
      #   Full style profile with sampled tweets used for tone analysis.
      #
      #   @return [XTwitterScraper::Models::StyleProfile]
      required :style2, -> { XTwitterScraper::StyleProfile }

      # @!method initialize(style1:, style2:)
      #   @param style1 [XTwitterScraper::Models::StyleProfile] Full style profile with sampled tweets used for tone analysis.
      #
      #   @param style2 [XTwitterScraper::Models::StyleProfile] Full style profile with sampled tweets used for tone analysis.
    end
  end
end
