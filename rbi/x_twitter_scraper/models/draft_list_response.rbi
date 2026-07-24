# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class DraftListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::DraftListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::Draft]) }
      attr_accessor :drafts

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      sig do
        params(
          drafts: T::Array[XTwitterScraper::Draft::OrHash],
          has_more: T::Boolean,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(drafts:, has_more:, next_cursor: nil)
      end

      sig do
        override.returns(
          {
            drafts: T::Array[XTwitterScraper::Draft],
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
