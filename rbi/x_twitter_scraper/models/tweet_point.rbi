# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetPoint < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::TweetPoint, XTwitterScraper::Internal::AnyHash)
        end

      sig { returns(T::Array[Float]) }
      attr_accessor :coordinates

      sig { returns(XTwitterScraper::TweetPoint::Type::TaggedSymbol) }
      attr_accessor :type

      # Author-published geographic point with 2 numeric coordinates.
      sig do
        params(
          coordinates: T::Array[Float],
          type: XTwitterScraper::TweetPoint::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(coordinates:, type:)
      end

      sig do
        override.returns(
          {
            coordinates: T::Array[Float],
            type: XTwitterScraper::TweetPoint::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::TweetPoint::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        POINT = T.let(:Point, XTwitterScraper::TweetPoint::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[XTwitterScraper::TweetPoint::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
