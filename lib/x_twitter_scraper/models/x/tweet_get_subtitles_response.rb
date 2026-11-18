# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#get_subtitles
      class TweetGetSubtitlesResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute subtitles
        #   Holds the caption tracks of 1 tweet's videos.
        #
        #   @return [XTwitterScraper::Models::TweetSubtitles]
        required :subtitles, -> { XTwitterScraper::Models::TweetSubtitles }

        # @!method initialize(subtitles:)
        #   @param subtitles [XTwitterScraper::Models::TweetSubtitles] Holds the caption tracks of 1 tweet's videos.
      end
    end
  end
end
