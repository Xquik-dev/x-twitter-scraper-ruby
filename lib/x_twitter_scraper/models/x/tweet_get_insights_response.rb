# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#get_insights
      class TweetGetInsightsResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute insights
        #   Engagement insights of 1 tweet. Engagements are likes, replies, reposts and
        #   quotes. A rate is null when nothing divides it, such as a tweet without views.
        #
        #   @return [XTwitterScraper::Models::TweetInsights]
        required :insights, -> { XTwitterScraper::Models::TweetInsights }

        # @!method initialize(insights:)
        #   @param insights [XTwitterScraper::Models::TweetInsights] Engagement insights of 1 tweet. Engagements are likes, replies, reposts and quotes. A rate is null when nothing divides it, such as a tweet without views.
      end
    end
  end
end
