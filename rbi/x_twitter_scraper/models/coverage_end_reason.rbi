# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    # Present on a last page that X cut short. `stalled` means X returned no new
    # results 2 times in a row, 30 s apart. The list may hold more. Read it again
    # later without cursor.
    module CoverageEndReason
      extend XTwitterScraper::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, XTwitterScraper::Models::CoverageEndReason) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      STALLED =
        T.let(:stalled, XTwitterScraper::Models::CoverageEndReason::TaggedSymbol)

      sig do
        override.returns(
          T::Array[XTwitterScraper::Models::CoverageEndReason::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
