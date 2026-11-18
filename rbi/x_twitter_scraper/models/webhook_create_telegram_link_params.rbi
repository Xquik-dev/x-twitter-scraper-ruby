# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class WebhookCreateTelegramLinkParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::WebhookCreateTelegramLinkParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Array of event types to subscribe to.
      sig do
        returns(
          T.nilable(T::Array[XTwitterScraper::Models::EventType::TaggedSymbol])
        )
      end
      attr_reader :event_types

      sig do
        params(
          event_types: T::Array[XTwitterScraper::Models::EventType::OrSymbol]
        ).void
      end
      attr_writer :event_types

      sig do
        params(
          event_types: T::Array[XTwitterScraper::Models::EventType::OrSymbol],
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of event types to subscribe to.
        event_types: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            event_types:
              T::Array[XTwitterScraper::Models::EventType::TaggedSymbol],
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
