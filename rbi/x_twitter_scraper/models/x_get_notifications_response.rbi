# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XGetNotificationsResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XGetNotificationsResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      sig { returns(String) }
      attr_accessor :next_cursor

      sig do
        returns(
          T::Array[
            XTwitterScraper::Models::XGetNotificationsResponse::Notification
          ]
        )
      end
      attr_accessor :notifications

      sig do
        params(
          has_next_page: T::Boolean,
          next_cursor: String,
          notifications:
            T::Array[
              XTwitterScraper::Models::XGetNotificationsResponse::Notification::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(has_next_page:, next_cursor:, notifications:)
      end

      sig do
        override.returns(
          {
            has_next_page: T::Boolean,
            next_cursor: String,
            notifications:
              T::Array[
                XTwitterScraper::Models::XGetNotificationsResponse::Notification
              ]
          }
        )
      end
      def to_hash
      end

      class Notification < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::XGetNotificationsResponse::Notification,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        sig { returns(T.nilable(String)) }
        attr_reader :timestamp

        sig { params(timestamp: String).void }
        attr_writer :timestamp

        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        sig do
          params(
            id: String,
            message: String,
            timestamp: String,
            type: String
          ).returns(T.attached_class)
        end
        def self.new(id:, message: nil, timestamp: nil, type: nil)
        end

        sig do
          override.returns(
            { id: String, message: String, timestamp: String, type: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
