# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetEmbed < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute tweet_id
      #   ID of the embedded tweet.
      #
      #   @return [String]
      required :tweet_id, String, api_name: :tweetId

      # @!attribute url
      #   Link to the tweet with its author's username.
      #
      #   @return [String]
      required :url, String

      # @!attribute author_name
      #   Display name of the tweet's author.
      #
      #   @return [String]
      required :author_name, String, api_name: :authorName

      # @!attribute author_url
      #   Link to the author's profile.
      #
      #   @return [String]
      required :author_url, String, api_name: :authorUrl

      # @!attribute html
      #   Markup to place on a page. It loads X's widget script unless `omitScript` is
      #   `true`.
      #
      #   @return [String]
      required :html, String

      # @!attribute width
      #   Width of the embed in pixels.
      #
      #   @return [Integer, nil]
      optional :width, Integer

      # @!attribute height
      #   Height in pixels, when X fixes it.
      #
      #   @return [Integer, nil]
      optional :height, Integer

      # @!method initialize(tweet_id:, url:, author_name:, author_url:, html:, width: nil, height: nil)
      #   Holds the HTML that embeds 1 tweet on a website.
      #
      #   @param tweet_id [String] ID of the embedded tweet.
      #
      #   @param url [String] Link to the tweet with its author's username.
      #
      #   @param author_name [String] Display name of the tweet's author.
      #
      #   @param author_url [String] Link to the author's profile.
      #
      #   @param html [String] Markup to place on a page. It loads X's widget script unless `omitScript` is `true`.
      #
      #   @param width [Integer] Width of the embed in pixels.
      #
      #   @param height [Integer] Height in pixels, when X fixes it.
    end
  end
end
