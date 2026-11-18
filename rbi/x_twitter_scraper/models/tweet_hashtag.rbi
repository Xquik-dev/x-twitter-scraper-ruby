# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetHashtag < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::TweetHashtag,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[Integer])) }
      attr_reader :indices

      sig { params(indices: T::Array[Integer]).void }
      attr_writer :indices

      # X's SmartTag for a cashtag, smarttag or hashtag.
      sig { returns(T.nilable(XTwitterScraper::Models::TweetSmartTag)) }
      attr_reader :tag

      sig { params(tag: XTwitterScraper::Models::TweetSmartTag::OrHash).void }
      attr_writer :tag

      sig { returns(String) }
      attr_accessor :text

      sig do
        params(
          text: String,
          indices: T::Array[Integer],
          tag: XTwitterScraper::Models::TweetSmartTag::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        text:,
        indices: nil,
        # X's SmartTag for a cashtag, smarttag or hashtag.
        tag: nil
      )
      end

      sig do
        override.returns(
          {
            indices: T::Array[Integer],
            tag: XTwitterScraper::Models::TweetSmartTag,
            text: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
