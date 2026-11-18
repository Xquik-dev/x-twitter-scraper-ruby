# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_insights
      class UserRetrieveInsightsResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute insights
        #   Engagement insights of 1 profile. Engagements are likes, replies, reposts and
        #   quotes. A rate is null when nothing divides it, such as a profile without posts
        #   of its own.
        #
        #   @return [XTwitterScraper::Models::UserInsights]
        required :insights, -> { XTwitterScraper::Models::UserInsights }

        # @!attribute message
        #   Says why the report has counts only. Sent only when postsPrivate is true.
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(insights:, message: nil)
        #   @param insights [XTwitterScraper::Models::UserInsights] Engagement insights of 1 profile. Engagements are likes, replies, reposts and quotes. A rate is null when nothing divides it, such as a profile without posts of its own.
        #
        #   @param message [String] Says why the report has counts only. Sent only when postsPrivate is true.
      end
    end
  end
end
