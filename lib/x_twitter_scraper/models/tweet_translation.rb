# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetTranslation < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute tweet_id
      #   ID of the translated tweet.
      #
      #   @return [String]
      required :tweet_id, String, api_name: :tweetId

      # @!attribute language
      #   Language code of the translated text, in lower case.
      #
      #   @return [String]
      required :language, String

      # @!attribute source_language
      #   Language code X detects in the tweet, when it names one.
      #
      #   @return [String, nil]
      optional :source_language, String, api_name: :sourceLanguage

      # @!attribute text
      #   Translated tweet text.
      #
      #   @return [String]
      required :text, String

      # @!attribute entities
      #   Lists hashtags, symbols, links, and mentions from tweet text.
      #
      #   @return [XTwitterScraper::Models::TweetEntities]
      required :entities, -> { XTwitterScraper::Models::TweetEntities }

      # @!method initialize(tweet_id:, language:, text:, entities:, source_language: nil)
      #   Holds X's translation of 1 tweet into the requested language. `entities` holds
      #   the links, mentions, and tags with their offsets in the translated text, and is
      #   empty when the text has none.
      #
      #   @param tweet_id [String] ID of the translated tweet.
      #
      #   @param language [String] Language code of the translated text, in lower case.
      #
      #   @param text [String] Translated tweet text.
      #
      #   @param entities [XTwitterScraper::Models::TweetEntities] Lists hashtags, symbols, links, and mentions from tweet text.
      #
      #   @param source_language [String] Language code X detects in the tweet, when it names one.
    end
  end
end
