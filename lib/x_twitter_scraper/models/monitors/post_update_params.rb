# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Monitors
      # @see XTwitterScraper::Resources::Monitors::Posts#update
      class PostUpdateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #   Resource ID returned by the matching create or list endpoint.
        #
        #   @return [String]
        required :id, String

        # @!attribute event_types
        #   Post event types to send. Without it, a monitor sends new replies, new quotes,
        #   like & retweet changes, edits & deletion.
        #
        #   @return [Array<Symbol, XTwitterScraper::Models::PostEventType>, nil]
        optional :event_types, -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::PostEventType] }, api_name: :eventTypes

        # @!attribute is_active
        #
        #   @return [Boolean, nil]
        optional :is_active, XTwitterScraper::Internal::Type::Boolean, api_name: :isActive

        # @!attribute name
        #   New label for the post monitor. Send null to remove it.
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!method initialize(id:, event_types: nil, is_active: nil, name: nil, request_options: {})
        #   @param id [String] Resource ID returned by the matching create or list endpoint.
        #
        #   @param event_types [Array<Symbol, XTwitterScraper::Models::PostEventType>] Post event types to send. Without it, a monitor sends new replies, new quotes, like & retweet changes, edits & deletion.
        #
        #   @param is_active [Boolean]
        #
        #   @param name [String, nil] New label for the post monitor. Send null to remove it.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
