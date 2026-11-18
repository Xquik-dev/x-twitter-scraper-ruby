# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetGetSubtitlesResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetGetSubtitlesResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Holds the caption tracks of 1 tweet's videos.
        sig { returns(XTwitterScraper::Models::TweetSubtitles) }
        attr_reader :subtitles

        sig do
          params(
            subtitles: XTwitterScraper::Models::TweetSubtitles::OrHash
          ).void
        end
        attr_writer :subtitles

        sig do
          params(
            subtitles: XTwitterScraper::Models::TweetSubtitles::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Holds the caption tracks of 1 tweet's videos.
          subtitles:
        )
        end

        sig do
          override.returns(
            { subtitles: XTwitterScraper::Models::TweetSubtitles }
          )
        end
        def to_hash
        end
      end
    end
  end
end
