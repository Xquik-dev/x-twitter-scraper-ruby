# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetUrlEntity < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::TweetUrlEntity,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :display_url

      sig { params(display_url: String).void }
      attr_writer :display_url

      sig { returns(T.nilable(String)) }
      attr_reader :expanded_url

      sig { params(expanded_url: String).void }
      attr_writer :expanded_url

      sig { returns(T.nilable(T::Array[Integer])) }
      attr_reader :indices

      sig { params(indices: T::Array[Integer]).void }
      attr_writer :indices

      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig do
        params(
          display_url: String,
          expanded_url: String,
          indices: T::Array[Integer],
          url: String
        ).returns(T.attached_class)
      end
      def self.new(display_url: nil, expanded_url: nil, indices: nil, url: nil)
      end

      sig do
        override.returns(
          {
            display_url: String,
            expanded_url: String,
            indices: T::Array[Integer],
            url: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
