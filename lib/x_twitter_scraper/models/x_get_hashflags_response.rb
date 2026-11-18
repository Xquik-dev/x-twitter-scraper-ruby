# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_hashflags
    class XGetHashflagsResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute hashflags
      #
      #   @return [Array<XTwitterScraper::Models::Hashflag>]
      required :hashflags, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Hashflag] }

      # @!attribute count
      #   Hashflags returned & charged.
      #
      #   @return [Integer]
      required :count, Integer

      # @!attribute total
      #   Hashflags that match the filters, before limit.
      #
      #   @return [Integer]
      required :total, Integer

      # @!attribute message
      #   What to send instead. Present only when no hashflag matches.
      #
      #   @return [String, nil]
      optional :message, String

      # @!method initialize(hashflags:, count:, total:, message: nil)
      #   @param hashflags [Array<XTwitterScraper::Models::Hashflag>]
      #
      #   @param count [Integer] Hashflags returned & charged.
      #
      #   @param total [Integer] Hashflags that match the filters, before limit.
      #
      #   @param message [String] What to send instead. Present only when no hashflag matches.
    end
  end
end
