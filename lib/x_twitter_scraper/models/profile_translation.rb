# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class ProfileTranslation < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute user_id
      #   ID of the account whose bio X translated.
      #
      #   @return [String]
      required :user_id, String, api_name: :userId

      # @!attribute user_name
      #   Username of that account.
      #
      #   @return [String]
      required :user_name, String, api_name: :userName

      # @!attribute language
      #   Language code of the translated bio, in lower case.
      #
      #   @return [String]
      required :language, String

      # @!attribute source_language
      #   Language code X detects in the bio, when it names one.
      #
      #   @return [String, nil]
      optional :source_language, String, api_name: :sourceLanguage

      # @!attribute text
      #   Translated bio.
      #
      #   @return [String]
      required :text, String

      # @!attribute entities
      #   Lists hashtags, symbols, links, and mentions from tweet text.
      #
      #   @return [XTwitterScraper::Models::TweetEntities]
      required :entities, -> { XTwitterScraper::Models::TweetEntities }

      # @!method initialize(user_id:, user_name:, language:, text:, entities:, source_language: nil)
      #   Holds X's translation of 1 profile's bio into the requested language. `entities`
      #   holds the links, mentions, and tags with their offsets in the translated text,
      #   and is empty when the text has none.
      #
      #   @param user_id [String] ID of the account whose bio X translated.
      #
      #   @param user_name [String] Username of that account.
      #
      #   @param language [String] Language code of the translated bio, in lower case.
      #
      #   @param text [String] Translated bio.
      #
      #   @param entities [XTwitterScraper::Models::TweetEntities] Lists hashtags, symbols, links, and mentions from tweet text.
      #
      #   @param source_language [String] Language code X detects in the bio, when it names one.
    end
  end
end
