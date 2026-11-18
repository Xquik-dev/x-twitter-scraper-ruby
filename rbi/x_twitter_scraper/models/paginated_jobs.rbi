# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class PaginatedJobs < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::PaginatedJobs,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::Models::Job]) }
      attr_reader :jobs

      sig { params(jobs: T::Array[XTwitterScraper::Models::Job::OrHash]).void }
      attr_writer :jobs

      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      # Cursor for the next page. Send it unchanged. Each next page arrives fast.
      sig { returns(String) }
      attr_accessor :next_cursor

      sig do
        params(
          jobs: T::Array[XTwitterScraper::Models::Job::OrHash],
          has_next_page: T::Boolean,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(
        jobs:,
        has_next_page:,
        # Cursor for the next page. Send it unchanged. Each next page arrives fast.
        next_cursor:
      )
      end

      sig do
        override.returns(
          {
            jobs: T::Array[XTwitterScraper::Models::Job],
            has_next_page: T::Boolean,
            next_cursor: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
