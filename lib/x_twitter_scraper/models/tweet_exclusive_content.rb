# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetExclusiveContent < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute creator_user_name
      #   Username of the creator whose subscription unlocks the post.
      #
      #   @return [String]
      required :creator_user_name, String, api_name: :creatorUserName

      # @!attribute subscribe_url
      #   Subscribe link X shows non-subscribers. Omitted when X serves the full post.
      #
      #   @return [String, nil]
      optional :subscribe_url, String, api_name: :subscribeUrl

      # @!method initialize(creator_user_name:, subscribe_url: nil)
      #   Marks a subscriber-only post with the creator whose subscription unlocks it.
      #   Non-subscribers get the preview text & the subscribe link. Omitted on public
      #   posts.
      #
      #   @param creator_user_name [String] Username of the creator whose subscription unlocks the post.
      #
      #   @param subscribe_url [String] Subscribe link X shows non-subscribers. Omitted when X serves the full post.
    end
  end
end
