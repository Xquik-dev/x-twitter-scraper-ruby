# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#create_telegram_link
    class WebhookCreateTelegramLinkParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute event_types
      #   Array of event types to subscribe to.
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::EventType>, nil]
      optional :event_types, -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::EventType] }, api_name: :eventTypes

      # @!method initialize(event_types: nil, request_options: {})
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
