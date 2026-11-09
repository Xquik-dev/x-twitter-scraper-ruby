# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Monitors#create
    class MonitorCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute event_types
      #   Array of event types to subscribe to.
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::EventType>]
      required :event_types,
               -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType] },
               api_name: :eventTypes

      # @!attribute username
      #   X username (without @)
      #
      #   @return [String]
      required :username, String

      # @!attribute name
      #   Your label for the monitor. Its events carry it as monitorName. Xquik normalizes
      #   whitespace.
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(event_types:, username:, name: nil, request_options: {})
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
      #
      #   @param username [String] X username (without @)
      #
      #   @param name [String] Your label for the monitor. Its events carry it as monitorName. Xquik normalizes
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
