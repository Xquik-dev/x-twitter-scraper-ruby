# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetEntities < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::TweetEntities,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig do
        returns(T.nilable(T::Array[XTwitterScraper::Models::TweetHashtag]))
      end
      attr_reader :hashtags

      sig do
        params(
          hashtags: T::Array[XTwitterScraper::Models::TweetHashtag::OrHash]
        ).void
      end
      attr_writer :hashtags

      sig { returns(T.nilable(T::Array[XTwitterScraper::Models::TweetSymbol])) }
      attr_reader :smarttags

      sig do
        params(
          smarttags: T::Array[XTwitterScraper::Models::TweetSymbol::OrHash]
        ).void
      end
      attr_writer :smarttags

      sig { returns(T.nilable(T::Array[XTwitterScraper::Models::TweetSymbol])) }
      attr_reader :symbols

      sig do
        params(
          symbols: T::Array[XTwitterScraper::Models::TweetSymbol::OrHash]
        ).void
      end
      attr_writer :symbols

      sig { returns(T.nilable(T::Array[XTwitterScraper::Models::TweetSymbol])) }
      attr_reader :timestamps

      sig do
        params(
          timestamps: T::Array[XTwitterScraper::Models::TweetSymbol::OrHash]
        ).void
      end
      attr_writer :timestamps

      sig do
        returns(T.nilable(T::Array[XTwitterScraper::Models::TweetUrlEntity]))
      end
      attr_reader :urls

      sig do
        params(
          urls: T::Array[XTwitterScraper::Models::TweetUrlEntity::OrHash]
        ).void
      end
      attr_writer :urls

      sig do
        returns(T.nilable(T::Array[XTwitterScraper::Models::TweetUserMention]))
      end
      attr_reader :user_mentions

      sig do
        params(
          user_mentions:
            T::Array[XTwitterScraper::Models::TweetUserMention::OrHash]
        ).void
      end
      attr_writer :user_mentions

      sig do
        params(
          hashtags: T::Array[XTwitterScraper::Models::TweetHashtag::OrHash],
          smarttags: T::Array[XTwitterScraper::Models::TweetSymbol::OrHash],
          symbols: T::Array[XTwitterScraper::Models::TweetSymbol::OrHash],
          timestamps: T::Array[XTwitterScraper::Models::TweetSymbol::OrHash],
          urls: T::Array[XTwitterScraper::Models::TweetUrlEntity::OrHash],
          user_mentions:
            T::Array[XTwitterScraper::Models::TweetUserMention::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        hashtags: nil,
        smarttags: nil,
        symbols: nil,
        timestamps: nil,
        urls: nil,
        user_mentions: nil
      )
      end

      sig do
        override.returns(
          {
            hashtags: T::Array[XTwitterScraper::Models::TweetHashtag],
            smarttags: T::Array[XTwitterScraper::Models::TweetSymbol],
            symbols: T::Array[XTwitterScraper::Models::TweetSymbol],
            timestamps: T::Array[XTwitterScraper::Models::TweetSymbol],
            urls: T::Array[XTwitterScraper::Models::TweetUrlEntity],
            user_mentions: T::Array[XTwitterScraper::Models::TweetUserMention]
          }
        )
      end
      def to_hash
      end
    end
  end
end
