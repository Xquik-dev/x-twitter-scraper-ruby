# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    # What 1 follower looks like from its public profile.
    module FollowerClass
      extend XTwitterScraper::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, XTwitterScraper::Models::FollowerClass) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      AUTOMATED =
        T.let(:automated, XTwitterScraper::Models::FollowerClass::TaggedSymbol)
      INACTIVE =
        T.let(:inactive, XTwitterScraper::Models::FollowerClass::TaggedSymbol)
      LIKELYFAKE =
        T.let(:likelyFake, XTwitterScraper::Models::FollowerClass::TaggedSymbol)
      LIKELYREAL =
        T.let(:likelyReal, XTwitterScraper::Models::FollowerClass::TaggedSymbol)
      TOONEW =
        T.let(:tooNew, XTwitterScraper::Models::FollowerClass::TaggedSymbol)

      sig do
        override.returns(
          T::Array[XTwitterScraper::Models::FollowerClass::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
