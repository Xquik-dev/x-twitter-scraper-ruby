# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Monitors#upsert_by_username
    class MonitorUpsertByUsernameParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute username
      #   The account's X username, with or without @, or its numeric user ID. A number is
      #   a user ID, so this call matches the account even after a rename.
      #
      #   @return [String]
      required :username, String

      # @!attribute event_types
      #   Array of event types to subscribe to.
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::EventType>]
      required :event_types, -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::EventType] }, api_name: :eventTypes

      # @!attribute name
      #   Your label for the monitor. Its events carry it as monitorName. Leave it out to
      #   keep the current label, or send null to remove it.
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!method initialize(username:, event_types:, name: nil, request_options: {})
      #   @param username [String] The account's X username, with or without @, or its numeric user ID. A number is a user ID, so this call matches the account even after a rename.
      #
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
      #
      #   @param name [String, nil] Your label for the monitor. Its events carry it as monitorName. Leave it out to keep the current label, or send null to remove it.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
