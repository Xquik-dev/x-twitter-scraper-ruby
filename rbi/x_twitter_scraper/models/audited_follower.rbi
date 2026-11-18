# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class AuditedFollower < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::AuditedFollower,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # What 1 follower looks like from its public profile.
      sig { returns(XTwitterScraper::Models::FollowerClass::TaggedSymbol) }
      attr_reader :class_

      sig do
        params(class_: XTwitterScraper::Models::FollowerClass::OrSymbol).void
      end
      attr_writer :class_

      sig { returns(Integer) }
      attr_accessor :followers

      sig { returns(Integer) }
      attr_accessor :following

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T.nilable(Integer)) }
      attr_reader :joined_at_ms

      sig { params(joined_at_ms: Integer).void }
      attr_writer :joined_at_ms

      sig { returns(Integer) }
      attr_accessor :likes

      sig { returns(String) }
      attr_accessor :name

      # Account that runs an automated follower, when X names it.
      sig { returns(T.nilable(String)) }
      attr_reader :owner

      sig { params(owner: String).void }
      attr_writer :owner

      sig { returns(T.nilable(String)) }
      attr_reader :picture_url

      sig { params(picture_url: String).void }
      attr_writer :picture_url

      sig { returns(Integer) }
      attr_accessor :position

      sig { returns(Integer) }
      attr_accessor :posts

      sig { returns(Integer) }
      attr_accessor :score

      sig { returns(T::Array[String]) }
      attr_accessor :signals

      sig { returns(String) }
      attr_accessor :user_name

      sig do
        params(
          class_: XTwitterScraper::Models::FollowerClass::OrSymbol,
          followers: Integer,
          following: Integer,
          id: String,
          likes: Integer,
          name: String,
          position: Integer,
          posts: Integer,
          score: Integer,
          signals: T::Array[String],
          user_name: String,
          joined_at_ms: Integer,
          owner: String,
          picture_url: String
        ).returns(T.attached_class)
      end
      def self.new(
        # What 1 follower looks like from its public profile.
        class_:,
        followers:,
        following:,
        id:,
        likes:,
        name:,
        position:,
        posts:,
        score:,
        signals:,
        user_name:,
        joined_at_ms: nil,
        # Account that runs an automated follower, when X names it.
        owner: nil,
        picture_url: nil
      )
      end

      sig do
        override.returns(
          {
            class_: XTwitterScraper::Models::FollowerClass::TaggedSymbol,
            followers: Integer,
            following: Integer,
            id: String,
            joined_at_ms: Integer,
            likes: Integer,
            name: String,
            owner: String,
            picture_url: String,
            position: Integer,
            posts: Integer,
            score: Integer,
            signals: T::Array[String],
            user_name: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
