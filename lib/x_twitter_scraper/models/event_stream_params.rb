# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Events#stream
    class EventStreamParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute include
      #   Set to post_metrics to also get each post monitor's saved numbers. Any other
      #   value is refused.
      #
      #   @return [Symbol, XTwitterScraper::Models::EventStreamParams::Include, nil]
      optional :include, enum: -> { XTwitterScraper::Models::EventStreamParams::Include }

      # @!attribute look_back
      #   Set to true to resume 30 seconds before Last-Event-ID. Events saved late then
      #   still arrive. Events you have can arrive again, so skip IDs you've seen. An ID
      #   the stream can't find starts 5 minutes back, not 30 days.
      #
      #   @return [Boolean, nil]
      optional :look_back, XTwitterScraper::Internal::Type::Boolean, api_name: :lookBack

      # @!attribute last_event_id
      #   The last event ID the client got. The stream first sends every event after it. A
      #   value that is not an event ID counts as no header.
      #
      #   @return [String, nil]
      optional :last_event_id, String

      # @!method initialize(include: nil, look_back: nil, last_event_id: nil, request_options: {})
      #   @param include [Symbol, XTwitterScraper::Models::EventStreamParams::Include] Set to post_metrics to also get each post monitor's saved numbers. Any other value is refused.
      #
      #   @param look_back [Boolean] Set to true to resume 30 seconds before Last-Event-ID. Events saved late then still arrive. Events you have can arrive again, so skip IDs you've seen. An ID the stream can't find starts 5 minutes back, not 30 days.
      #
      #   @param last_event_id [String] The last event ID the client got. The stream first sends every event after it. A value that is not an event ID counts as no header.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      module Include
        extend XTwitterScraper::Internal::Type::Enum

        POST_METRICS = :post_metrics

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
