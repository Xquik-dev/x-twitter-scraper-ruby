# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetSubtitles < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::TweetSubtitles,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # ID of the tweet.
      sig { returns(String) }
      attr_accessor :tweet_id

      # Caption tracks, empty when no video has captions.
      sig { returns(T::Array[XTwitterScraper::Models::SubtitleTrack]) }
      attr_reader :tracks

      sig do
        params(
          tracks: T::Array[XTwitterScraper::Models::SubtitleTrack::OrHash]
        ).void
      end
      attr_writer :tracks

      sig do
        params(
          tweet_id: String,
          tracks: T::Array[XTwitterScraper::Models::SubtitleTrack::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the tweet.
        tweet_id:,
        # Caption tracks, empty when no video has captions.
        tracks:
      )
      end

      sig do
        override.returns(
          {
            tweet_id: String,
            tracks: T::Array[XTwitterScraper::Models::SubtitleTrack]
          }
        )
      end
      def to_hash
      end
    end
  end
end
