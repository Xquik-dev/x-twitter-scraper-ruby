# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetGetInsightsResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetGetInsightsResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Engagement insights of 1 tweet. Engagements are likes, replies, reposts and
        # quotes. A rate is null when nothing divides it, such as a tweet without views.
        sig { returns(XTwitterScraper::Models::TweetInsights) }
        attr_reader :insights

        sig do
          params(insights: XTwitterScraper::Models::TweetInsights::OrHash).void
        end
        attr_writer :insights

        sig do
          params(
            insights: XTwitterScraper::Models::TweetInsights::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Engagement insights of 1 tweet. Engagements are likes, replies, reposts and
          # quotes. A rate is null when nothing divides it, such as a tweet without views.
          insights:
        )
        end

        sig do
          override.returns({ insights: XTwitterScraper::Models::TweetInsights })
        end
        def to_hash
        end
      end
    end
  end
end
