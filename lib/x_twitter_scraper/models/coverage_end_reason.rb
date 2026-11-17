# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # Present on a last page that X cut short. `stalled` means X returned no new
    # results 2 times in a row, 30 s apart. The list may hold more. Read it again
    # later without cursor.
    module CoverageEndReason
      extend XTwitterScraper::Internal::Type::Enum

      STALLED = :stalled

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
