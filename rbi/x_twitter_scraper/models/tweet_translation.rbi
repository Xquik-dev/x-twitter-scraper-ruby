# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetTranslation < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::TweetTranslation,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # ID of the translated tweet.
      sig { returns(String) }
      attr_accessor :tweet_id

      # Language code of the translated text, in lower case.
      sig { returns(String) }
      attr_accessor :language

      # Language code X detects in the tweet, when it names one.
      sig { returns(T.nilable(String)) }
      attr_reader :source_language

      sig { params(source_language: String).void }
      attr_writer :source_language

      # Translated tweet text.
      sig { returns(String) }
      attr_accessor :text

      # Lists hashtags, symbols, links, and mentions from tweet text.
      sig { returns(XTwitterScraper::Models::TweetEntities) }
      attr_reader :entities

      sig do
        params(entities: XTwitterScraper::Models::TweetEntities::OrHash).void
      end
      attr_writer :entities

      sig do
        params(
          tweet_id: String,
          language: String,
          text: String,
          entities: XTwitterScraper::Models::TweetEntities::OrHash,
          source_language: String
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the translated tweet.
        tweet_id:,
        # Language code of the translated text, in lower case.
        language:,
        # Translated tweet text.
        text:,
        # Lists hashtags, symbols, links, and mentions from tweet text.
        entities:,
        # Language code X detects in the tweet, when it names one.
        source_language: nil
      )
      end

      sig do
        override.returns(
          {
            tweet_id: String,
            language: String,
            source_language: String,
            text: String,
            entities: XTwitterScraper::Models::TweetEntities
          }
        )
      end
      def to_hash
      end
    end
  end
end
