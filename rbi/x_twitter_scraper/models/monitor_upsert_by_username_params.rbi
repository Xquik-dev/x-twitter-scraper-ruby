# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class MonitorUpsertByUsernameParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::MonitorUpsertByUsernameParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The account's X username, with or without @, or its numeric user ID. A number is
      # a user ID, so this call matches the account even after a rename.
      sig { returns(String) }
      attr_accessor :username

      # Array of event types to subscribe to.
      sig do
        returns(T::Array[XTwitterScraper::Models::EventType::TaggedSymbol])
      end
      attr_reader :event_types

      sig do
        params(
          event_types: T::Array[XTwitterScraper::Models::EventType::OrSymbol]
        ).void
      end
      attr_writer :event_types

      # Your label for the monitor. Its events carry it as monitorName. Leave it out to
      # keep the current label, or send null to remove it.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: T.nilable(String)).void }
      attr_writer :name

      sig do
        params(
          username: String,
          event_types: T::Array[XTwitterScraper::Models::EventType::OrSymbol],
          name: T.nilable(String),
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The account's X username, with or without @, or its numeric user ID. A number is
        # a user ID, so this call matches the account even after a rename.
        username:,
        # Array of event types to subscribe to.
        event_types:,
        # Your label for the monitor. Its events carry it as monitorName. Leave it out to
        # keep the current label, or send null to remove it.
        name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            username: String,
            event_types:
              T::Array[XTwitterScraper::Models::EventType::TaggedSymbol],
            name: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
