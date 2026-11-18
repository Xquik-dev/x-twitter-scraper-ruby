# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XGetNewsStoryVersionsResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XGetNewsStoryVersionsResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The story's ID, as the request named it.
      sig { returns(String) }
      attr_accessor :id

      # Versions returned.
      sig { returns(Integer) }
      attr_accessor :count

      sig { returns(T::Array[XTwitterScraper::Models::NewsVersion]) }
      attr_reader :versions

      sig do
        params(
          versions: T::Array[XTwitterScraper::Models::NewsVersion::OrHash]
        ).void
      end
      attr_writer :versions

      sig do
        params(
          id: String,
          count: Integer,
          versions: T::Array[XTwitterScraper::Models::NewsVersion::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # The story's ID, as the request named it.
        id:,
        # Versions returned.
        count:,
        versions:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            count: Integer,
            versions: T::Array[XTwitterScraper::Models::NewsVersion]
          }
        )
      end
      def to_hash
      end
    end
  end
end
