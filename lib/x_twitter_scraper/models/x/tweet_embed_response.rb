# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#embed
      class TweetEmbedResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute embed
        #   Holds the HTML that embeds 1 tweet on a website.
        #
        #   @return [XTwitterScraper::Models::TweetEmbed]
        required :embed, -> { XTwitterScraper::Models::TweetEmbed }

        # @!method initialize(embed:)
        #   @param embed [XTwitterScraper::Models::TweetEmbed] Holds the HTML that embeds 1 tweet on a website.
      end
    end
  end
end
