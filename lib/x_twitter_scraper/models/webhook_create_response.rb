# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#create
    class WebhookCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute event_types
      #   Array of event types to subscribe to.
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::StreamEventType>]
      required :event_types,
               -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::StreamEventType] },
               api_name: :eventTypes

      # @!attribute secret
      #   Plaintext HMAC signing secret returned only at creation.
      #
      #   @return [String]
      required :secret, String

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!attribute ignored_fields
      #
      #   @return [Array<String>, nil]
      optional :ignored_fields, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :ignoredFields

      # @!method initialize(id:, created_at:, event_types:, secret:, url:, ignored_fields: nil)
      #   @param id [String]
      #
      #   @param created_at [Time]
      #
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::StreamEventType>] Array of event types to subscribe to.
      #
      #   @param secret [String] Plaintext HMAC signing secret returned only at creation.
      #
      #   @param url [String]
      #
      #   @param ignored_fields [Array<String>]
    end
  end
end
