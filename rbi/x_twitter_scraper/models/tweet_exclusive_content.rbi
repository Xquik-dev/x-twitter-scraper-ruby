# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetExclusiveContent < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::TweetExclusiveContent,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Username of the creator whose subscription unlocks the post.
      sig { returns(String) }
      attr_accessor :creator_user_name

      # Subscribe link X shows non-subscribers. Omitted when X serves the full post.
      sig { returns(T.nilable(String)) }
      attr_reader :subscribe_url

      sig { params(subscribe_url: String).void }
      attr_writer :subscribe_url

      # Marks a subscriber-only post with the creator whose subscription unlocks it.
      # Non-subscribers get the preview text & the subscribe link. Omitted on public
      # posts.
      sig do
        params(creator_user_name: String, subscribe_url: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # Username of the creator whose subscription unlocks the post.
        creator_user_name:,
        # Subscribe link X shows non-subscribers. Omitted when X serves the full post.
        subscribe_url: nil
      )
      end

      sig do
        override.returns({ creator_user_name: String, subscribe_url: String })
      end
      def to_hash
      end
    end
  end
end
