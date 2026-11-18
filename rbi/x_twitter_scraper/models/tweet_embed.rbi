# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetEmbed < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::TweetEmbed,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # ID of the embedded tweet.
      sig { returns(String) }
      attr_accessor :tweet_id

      # Link to the tweet with its author's username.
      sig { returns(String) }
      attr_accessor :url

      # Display name of the tweet's author.
      sig { returns(String) }
      attr_accessor :author_name

      # Link to the author's profile.
      sig { returns(String) }
      attr_accessor :author_url

      # Markup to place on a page. It loads X's widget script unless `omitScript` is
      # `true`.
      sig { returns(String) }
      attr_accessor :html

      # Width of the embed in pixels.
      sig { returns(T.nilable(Integer)) }
      attr_reader :width

      sig { params(width: Integer).void }
      attr_writer :width

      # Height in pixels, when X fixes it.
      sig { returns(T.nilable(Integer)) }
      attr_reader :height

      sig { params(height: Integer).void }
      attr_writer :height

      sig do
        params(
          tweet_id: String,
          url: String,
          author_name: String,
          author_url: String,
          html: String,
          width: Integer,
          height: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the embedded tweet.
        tweet_id:,
        # Link to the tweet with its author's username.
        url:,
        # Display name of the tweet's author.
        author_name:,
        # Link to the author's profile.
        author_url:,
        # Markup to place on a page. It loads X's widget script unless `omitScript` is
        # `true`.
        html:,
        # Width of the embed in pixels.
        width: nil,
        # Height in pixels, when X fixes it.
        height: nil
      )
      end

      sig do
        override.returns(
          {
            tweet_id: String,
            url: String,
            author_name: String,
            author_url: String,
            html: String,
            width: Integer,
            height: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
