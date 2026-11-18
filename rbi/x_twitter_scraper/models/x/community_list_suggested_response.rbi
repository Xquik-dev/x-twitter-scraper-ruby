# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class CommunityListSuggestedResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::CommunityListSuggestedResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Suggested communities in X's order
        sig { returns(T::Array[XTwitterScraper::Models::Community]) }
        attr_reader :communities

        sig do
          params(
            communities: T::Array[XTwitterScraper::Models::Community::OrHash]
          ).void
        end
        attr_writer :communities

        # Communities returned & charged
        sig { returns(Integer) }
        attr_accessor :count

        # What to do next. Present only when X suggests none.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        sig do
          params(
            communities: T::Array[XTwitterScraper::Models::Community::OrHash],
            count: Integer,
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Suggested communities in X's order
          communities:,
          # Communities returned & charged
          count:,
          # What to do next. Present only when X suggests none.
          message: nil
        )
        end

        sig do
          override.returns(
            {
              communities: T::Array[XTwitterScraper::Models::Community],
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
