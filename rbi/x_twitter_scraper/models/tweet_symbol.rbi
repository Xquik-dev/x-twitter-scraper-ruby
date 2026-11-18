# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetSymbol < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::TweetSymbol,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[Integer])) }
      attr_reader :indices

      sig { params(indices: T::Array[Integer]).void }
      attr_writer :indices

      sig { returns(T.nilable(Float)) }
      attr_reader :seconds

      sig { params(seconds: Float).void }
      attr_writer :seconds

      sig { returns(T.nilable(String)) }
      attr_reader :text

      sig { params(text: String).void }
      attr_writer :text

      # X's SmartTag for a cashtag, smarttag or hashtag.
      sig { returns(T.nilable(XTwitterScraper::Models::TweetSmartTag)) }
      attr_reader :tag

      sig { params(tag: XTwitterScraper::Models::TweetSmartTag::OrHash).void }
      attr_writer :tag

      sig do
        params(
          indices: T::Array[Integer],
          seconds: Float,
          text: String,
          tag: XTwitterScraper::Models::TweetSmartTag::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        indices: nil,
        seconds: nil,
        text: nil,
        # X's SmartTag for a cashtag, smarttag or hashtag.
        tag: nil
      )
      end

      sig do
        override.returns(
          {
            indices: T::Array[Integer],
            seconds: Float,
            text: String,
            tag: XTwitterScraper::Models::TweetSmartTag
          }
        )
      end
      def to_hash
      end
    end
  end
end
