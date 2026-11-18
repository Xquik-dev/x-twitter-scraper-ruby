# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class SpaceSharing < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::SpaceSharing,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X's ID of the sharing, not of the post
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # When the post was shared
      sig { returns(T.nilable(Time)) }
      attr_reader :shared_at

      sig { params(shared_at: Time).void }
      attr_writer :shared_at

      # When X last changed the sharing
      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      # Public X profile.
      sig { returns(T.nilable(XTwitterScraper::Models::UserProfile)) }
      attr_reader :shared_by

      sig do
        params(shared_by: XTwitterScraper::Models::UserProfile::OrHash).void
      end
      attr_writer :shared_by

      # Search tweet with author. Zero metrics may mean X omitted counts.
      sig { returns(T.nilable(XTwitterScraper::Models::SearchTweet)) }
      attr_reader :tweet

      sig { params(tweet: XTwitterScraper::Models::SearchTweet::OrHash).void }
      attr_writer :tweet

      sig do
        params(
          id: String,
          shared_at: Time,
          updated_at: Time,
          shared_by: XTwitterScraper::Models::UserProfile::OrHash,
          tweet: XTwitterScraper::Models::SearchTweet::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # X's ID of the sharing, not of the post
        id: nil,
        # When the post was shared
        shared_at: nil,
        # When X last changed the sharing
        updated_at: nil,
        # Public X profile.
        shared_by: nil,
        # Search tweet with author. Zero metrics may mean X omitted counts.
        tweet: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            shared_at: Time,
            updated_at: Time,
            shared_by: XTwitterScraper::Models::UserProfile,
            tweet: XTwitterScraper::Models::SearchTweet
          }
        )
      end
      def to_hash
      end
    end
  end
end
