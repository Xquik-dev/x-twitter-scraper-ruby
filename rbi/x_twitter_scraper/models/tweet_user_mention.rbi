# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetUserMention < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::TweetUserMention,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :id_str

      sig { params(id_str: String).void }
      attr_writer :id_str

      sig { returns(T.nilable(T::Array[Integer])) }
      attr_reader :indices

      sig { params(indices: T::Array[Integer]).void }
      attr_writer :indices

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(String) }
      attr_accessor :screen_name

      sig do
        params(
          screen_name: String,
          id_str: String,
          indices: T::Array[Integer],
          name: String
        ).returns(T.attached_class)
      end
      def self.new(screen_name:, id_str: nil, indices: nil, name: nil)
      end

      sig do
        override.returns(
          {
            id_str: String,
            indices: T::Array[Integer],
            name: String,
            screen_name: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
