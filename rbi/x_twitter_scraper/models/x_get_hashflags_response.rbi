# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XGetHashflagsResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XGetHashflagsResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::Models::Hashflag]) }
      attr_reader :hashflags

      sig do
        params(
          hashflags: T::Array[XTwitterScraper::Models::Hashflag::OrHash]
        ).void
      end
      attr_writer :hashflags

      # Hashflags returned & charged.
      sig { returns(Integer) }
      attr_accessor :count

      # Hashflags that match the filters, before limit.
      sig { returns(Integer) }
      attr_accessor :total

      # What to send instead. Present only when no hashflag matches.
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      sig do
        params(
          hashflags: T::Array[XTwitterScraper::Models::Hashflag::OrHash],
          count: Integer,
          total: Integer,
          message: String
        ).returns(T.attached_class)
      end
      def self.new(
        hashflags:,
        # Hashflags returned & charged.
        count:,
        # Hashflags that match the filters, before limit.
        total:,
        # What to send instead. Present only when no hashflag matches.
        message: nil
      )
      end

      sig do
        override.returns(
          {
            hashflags: T::Array[XTwitterScraper::Models::Hashflag],
            count: Integer,
            total: Integer,
            message: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
