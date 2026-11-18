# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class SpaceSharing < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   X's ID of the sharing, not of the post
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute shared_at
      #   When the post was shared
      #
      #   @return [Time, nil]
      optional :shared_at, Time, api_name: :sharedAt

      # @!attribute updated_at
      #   When X last changed the sharing
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!attribute shared_by
      #   Public X profile.
      #
      #   @return [XTwitterScraper::Models::UserProfile, nil]
      optional :shared_by, -> { XTwitterScraper::Models::UserProfile }, api_name: :sharedBy

      # @!attribute tweet
      #   Search tweet with author. Zero metrics may mean X omitted counts.
      #
      #   @return [XTwitterScraper::Models::SearchTweet, nil]
      optional :tweet, -> { XTwitterScraper::Models::SearchTweet }

      # @!method initialize(id: nil, shared_at: nil, updated_at: nil, shared_by: nil, tweet: nil)
      #   A post shared in a Space, & the account that shared it.
      #
      #   @param id [String] X's ID of the sharing, not of the post
      #
      #   @param shared_at [Time] When the post was shared
      #
      #   @param updated_at [Time] When X last changed the sharing
      #
      #   @param shared_by [XTwitterScraper::Models::UserProfile] Public X profile.
      #
      #   @param tweet [XTwitterScraper::Models::SearchTweet] Search tweet with author. Zero metrics may mean X omitted counts.
    end
  end
end
