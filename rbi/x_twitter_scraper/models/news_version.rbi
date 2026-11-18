# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class NewsVersion < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::NewsVersion,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The version's ID.
      sig { returns(String) }
      attr_accessor :id

      # When X wrote the version, in UTC, from its ID.
      sig { returns(Time) }
      attr_accessor :created_at

      # The story's headline in this version.
      sig { returns(String) }
      attr_accessor :headline

      # The story's text in this version, without its time line.
      sig { returns(String) }
      attr_accessor :text

      sig do
        params(
          id: String,
          created_at: Time,
          headline: String,
          text: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The version's ID.
        id:,
        # When X wrote the version, in UTC, from its ID.
        created_at:,
        # The story's headline in this version.
        headline:,
        # The story's text in this version, without its time line.
        text:
      )
      end

      sig do
        override.returns(
          { id: String, created_at: Time, headline: String, text: String }
        )
      end
      def to_hash
      end
    end
  end
end
