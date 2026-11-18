# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class AuditedFollower < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute class_
      #   What 1 follower looks like from its public profile.
      #
      #   @return [Symbol, XTwitterScraper::Models::FollowerClass]
      required :class_, enum: -> { XTwitterScraper::Models::FollowerClass }, api_name: :class

      # @!attribute followers
      #
      #   @return [Integer]
      required :followers, Integer

      # @!attribute following
      #
      #   @return [Integer]
      required :following, Integer

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute joined_at_ms
      #
      #   @return [Integer, nil]
      optional :joined_at_ms, Integer, api_name: :joinedAtMs

      # @!attribute likes
      #
      #   @return [Integer]
      required :likes, Integer

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute owner
      #   Account that runs an automated follower, when X names it.
      #
      #   @return [String, nil]
      optional :owner, String

      # @!attribute picture_url
      #
      #   @return [String, nil]
      optional :picture_url, String, api_name: :pictureUrl

      # @!attribute position
      #
      #   @return [Integer]
      required :position, Integer

      # @!attribute posts
      #
      #   @return [Integer]
      required :posts, Integer

      # @!attribute score
      #
      #   @return [Integer]
      required :score, Integer

      # @!attribute signals
      #
      #   @return [Array<String>]
      required :signals, XTwitterScraper::Internal::Type::ArrayOf[String]

      # @!attribute user_name
      #
      #   @return [String]
      required :user_name, String, api_name: :userName

      # @!method initialize(class_:, followers:, following:, id:, likes:, name:, position:, posts:, score:, signals:, user_name:, joined_at_ms: nil, owner: nil, picture_url: nil)
      #   1 follower the audit read, with its class, score & signals.
      #
      #   @param class_ [Symbol, XTwitterScraper::Models::FollowerClass] What 1 follower looks like from its public profile.
      #
      #   @param followers [Integer]
      #
      #   @param following [Integer]
      #
      #   @param id [String]
      #
      #   @param likes [Integer]
      #
      #   @param name [String]
      #
      #   @param position [Integer]
      #
      #   @param posts [Integer]
      #
      #   @param score [Integer]
      #
      #   @param signals [Array<String>]
      #
      #   @param user_name [String]
      #
      #   @param joined_at_ms [Integer]
      #
      #   @param owner [String] Account that runs an automated follower, when X names it.
      #
      #   @param picture_url [String]
    end
  end
end
