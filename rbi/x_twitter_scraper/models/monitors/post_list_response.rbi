# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module Monitors
      class PostListResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Monitors::PostListResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T::Array[XTwitterScraper::Models::PostMonitor]) }
        attr_reader :monitors

        sig do
          params(
            monitors: T::Array[XTwitterScraper::Models::PostMonitor::OrHash]
          ).void
        end
        attr_writer :monitors

        # Post monitors on this page.
        sig { returns(Integer) }
        attr_accessor :total

        sig { returns(T::Boolean) }
        attr_accessor :has_more

        sig { returns(T.nilable(String)) }
        attr_reader :next_cursor

        sig { params(next_cursor: String).void }
        attr_writer :next_cursor

        sig do
          params(
            monitors: T::Array[XTwitterScraper::Models::PostMonitor::OrHash],
            total: Integer,
            has_more: T::Boolean,
            next_cursor: String
          ).returns(T.attached_class)
        end
        def self.new(
          monitors:,
          # Post monitors on this page.
          total:,
          has_more:,
          next_cursor: nil
        )
        end

        sig do
          override.returns(
            {
              monitors: T::Array[XTwitterScraper::Models::PostMonitor],
              total: Integer,
              has_more: T::Boolean,
              next_cursor: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
