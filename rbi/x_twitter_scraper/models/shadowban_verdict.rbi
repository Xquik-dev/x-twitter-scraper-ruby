# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    # Pass means X shows the account there, and fail means it doesn't. Unknown means
    # the check had nothing to test or X didn't answer.
    module ShadowbanVerdict
      extend XTwitterScraper::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias do
          T.all(Symbol, XTwitterScraper::Models::ShadowbanVerdict)
        end
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PASS =
        T.let(:pass, XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol)
      FAIL =
        T.let(:fail, XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol)
      UNKNOWN =
        T.let(:unknown, XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol)

      sig do
        override.returns(
          T::Array[XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
