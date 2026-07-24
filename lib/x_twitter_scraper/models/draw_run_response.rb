# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Draws#run
    class DrawRunResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute total_entries
      #   Candidate entries inspected for this draw after the credit-derived cap. This may
      #   be lower than the source tweet's full reply count.
      #
      #   @return [Integer]
      required :total_entries, Integer, api_name: :totalEntries

      # @!attribute tweet_id
      #
      #   @return [String]
      required :tweet_id, String, api_name: :tweetId

      # @!attribute valid_entries
      #   Entries from the inspected candidate set that passed all filters. This is not
      #   necessarily every valid reply on the source tweet when credits cap inspection.
      #
      #   @return [Integer]
      required :valid_entries, Integer, api_name: :validEntries

      # @!attribute winners
      #
      #   @return [Array<XTwitterScraper::Models::Winner>]
      required :winners, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Winner] }

      # @!method initialize(id:, total_entries:, tweet_id:, valid_entries:, winners:)
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::DrawRunResponse} for more details.
      #
      #   @param id [String]
      #
      #   @param total_entries [Integer] Candidate entries inspected for this draw after the credit-derived cap. This may
      #
      #   @param tweet_id [String]
      #
      #   @param valid_entries [Integer] Entries from the inspected candidate set that passed all filters. This is not ne
      #
      #   @param winners [Array<XTwitterScraper::Models::Winner>]
    end
  end
end
