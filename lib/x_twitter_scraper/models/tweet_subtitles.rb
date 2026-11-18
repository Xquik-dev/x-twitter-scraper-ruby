# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetSubtitles < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute tweet_id
      #   ID of the tweet.
      #
      #   @return [String]
      required :tweet_id, String, api_name: :tweetId

      # @!attribute tracks
      #   Caption tracks, empty when no video has captions.
      #
      #   @return [Array<XTwitterScraper::Models::SubtitleTrack>]
      required :tracks, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SubtitleTrack] }

      # @!method initialize(tweet_id:, tracks:)
      #   Holds the caption tracks of 1 tweet's videos.
      #
      #   @param tweet_id [String] ID of the tweet.
      #
      #   @param tracks [Array<XTwitterScraper::Models::SubtitleTrack>] Caption tracks, empty when no video has captions.
    end
  end
end
