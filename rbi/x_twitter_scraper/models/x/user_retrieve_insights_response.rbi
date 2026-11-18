# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class UserRetrieveInsightsResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::UserRetrieveInsightsResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Engagement insights of 1 profile. Engagements are likes, replies, reposts and
        # quotes. A rate is null when nothing divides it, such as a profile without posts
        # of its own.
        sig { returns(XTwitterScraper::Models::UserInsights) }
        attr_reader :insights

        sig do
          params(insights: XTwitterScraper::Models::UserInsights::OrHash).void
        end
        attr_writer :insights

        # Says why the report has counts only. Sent only when postsPrivate is true.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        sig do
          params(
            insights: XTwitterScraper::Models::UserInsights::OrHash,
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Engagement insights of 1 profile. Engagements are likes, replies, reposts and
          # quotes. A rate is null when nothing divides it, such as a profile without posts
          # of its own.
          insights:,
          # Says why the report has counts only. Sent only when postsPrivate is true.
          message: nil
        )
        end

        sig do
          override.returns(
            { insights: XTwitterScraper::Models::UserInsights, message: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
