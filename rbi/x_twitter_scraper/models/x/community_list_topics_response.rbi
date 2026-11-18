# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class CommunityListTopicsResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::CommunityListTopicsResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Topics in X's order
        sig { returns(T::Array[XTwitterScraper::Models::CommunityTopic]) }
        attr_reader :topics

        sig do
          params(
            topics: T::Array[XTwitterScraper::Models::CommunityTopic::OrHash]
          ).void
        end
        attr_writer :topics

        # Top-level topics returned & charged
        sig { returns(Integer) }
        attr_accessor :count

        # What to do next. Present only when X lists no topic.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        sig do
          params(
            topics: T::Array[XTwitterScraper::Models::CommunityTopic::OrHash],
            count: Integer,
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Topics in X's order
          topics:,
          # Top-level topics returned & charged
          count:,
          # What to do next. Present only when X lists no topic.
          message: nil
        )
        end

        sig do
          override.returns(
            {
              topics: T::Array[XTwitterScraper::Models::CommunityTopic],
              count: Integer,
              message: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
