# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class ActivityLogRow < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute time
      #   ISO 8601 time in UTC to the millisecond. Empty on the notice row.
      #
      #   @return [String]
      required :time, String

      # @!attribute category
      #
      #   @return [String]
      required :category, String

      # @!attribute type
      #
      #   @return [String]
      required :type, String

      # @!attribute activity
      #
      #   @return [String]
      required :activity, String

      # @!attribute status
      #
      #   @return [String]
      required :status, String

      # @!attribute source
      #
      #   @return [String]
      required :source, String

      # @!attribute target
      #
      #   @return [String]
      required :target, String

      # @!attribute results
      #
      #   @return [Integer, String]
      required :results, union: -> { XTwitterScraper::Models::ActivityLogRow::Results }

      # @!attribute credits
      #
      #   @return [Integer, String]
      required :credits, union: -> { XTwitterScraper::Models::ActivityLogRow::Credits }

      # @!attribute details
      #
      #   @return [String]
      required :details, String

      # @!attribute id
      #   Activity ID. GET /activity/{id} returns its full record.
      #
      #   @return [String]
      required :id, String

      # @!attribute link
      #
      #   @return [String]
      required :link, String

      # @!method initialize(time:, category:, type:, activity:, status:, source:, target:, results:, credits:, details:, id:, link:)
      #   1 Activity log row. A cut list ends with a row whose category is notice and
      #   whose activity says where it stopped.
      #
      #   @param time [String] ISO 8601 time in UTC to the millisecond. Empty on the notice row.
      #
      #   @param category [String]
      #
      #   @param type [String]
      #
      #   @param activity [String]
      #
      #   @param status [String]
      #
      #   @param source [String]
      #
      #   @param target [String]
      #
      #   @param results [Integer, String]
      #
      #   @param credits [Integer, String]
      #
      #   @param details [String]
      #
      #   @param id [String] Activity ID. GET /activity/{id} returns its full record.
      #
      #   @param link [String]

      module Results
        extend XTwitterScraper::Internal::Type::Union

        variant Integer

        variant String

        # @!method self.variants
        #   @return [Array(Integer, String)]
      end

      module Credits
        extend XTwitterScraper::Internal::Type::Union

        variant Integer

        variant String

        # @!method self.variants
        #   @return [Array(Integer, String)]
      end
    end
  end
end
