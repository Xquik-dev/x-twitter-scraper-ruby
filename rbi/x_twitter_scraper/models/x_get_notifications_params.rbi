# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XGetNotificationsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::XGetNotificationsParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Pagination cursor for notifications
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Notification type filter. Unrecognized values fall back to All.
      sig do
        returns(
          T.nilable(XTwitterScraper::XGetNotificationsParams::Type::OrSymbol)
        )
      end
      attr_reader :type

      sig do
        params(
          type: XTwitterScraper::XGetNotificationsParams::Type::OrSymbol
        ).void
      end
      attr_writer :type

      sig do
        params(
          cursor: String,
          type: XTwitterScraper::XGetNotificationsParams::Type::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Pagination cursor for notifications
        cursor: nil,
        # Notification type filter. Unrecognized values fall back to All.
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            type: XTwitterScraper::XGetNotificationsParams::Type::OrSymbol,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Notification type filter. Unrecognized values fall back to All.
      module Type
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::XGetNotificationsParams::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ALL =
          T.let(
            :All,
            XTwitterScraper::XGetNotificationsParams::Type::TaggedSymbol
          )
        VERIFIED =
          T.let(
            :Verified,
            XTwitterScraper::XGetNotificationsParams::Type::TaggedSymbol
          )
        MENTIONS =
          T.let(
            :Mentions,
            XTwitterScraper::XGetNotificationsParams::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::XGetNotificationsParams::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
