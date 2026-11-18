# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class EventStreamParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::EventStreamParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Set to post_metrics to also get each post monitor's saved numbers. Any other
      # value is refused.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::EventStreamParams::Include::TaggedSymbol
          )
        )
      end
      attr_reader :include

      sig do
        params(
          include: XTwitterScraper::Models::EventStreamParams::Include::OrSymbol
        ).void
      end
      attr_writer :include

      # Set to true to resume 30 seconds before Last-Event-ID. Events saved late then
      # still arrive. Events you have can arrive again, so skip IDs you've seen. An ID
      # the stream can't find starts 5 minutes back, not 30 days.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :look_back

      sig { params(look_back: T::Boolean).void }
      attr_writer :look_back

      # The last event ID the client got. The stream first sends every event after it. A
      # value that is not an event ID counts as no header.
      sig { returns(T.nilable(String)) }
      attr_reader :last_event_id

      sig { params(last_event_id: String).void }
      attr_writer :last_event_id

      sig do
        params(
          include:
            XTwitterScraper::Models::EventStreamParams::Include::OrSymbol,
          look_back: T::Boolean,
          last_event_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Set to post_metrics to also get each post monitor's saved numbers. Any other
        # value is refused.
        include: nil,
        # Set to true to resume 30 seconds before Last-Event-ID. Events saved late then
        # still arrive. Events you have can arrive again, so skip IDs you've seen. An ID
        # the stream can't find starts 5 minutes back, not 30 days.
        look_back: nil,
        # The last event ID the client got. The stream first sends every event after it. A
        # value that is not an event ID counts as no header.
        last_event_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            include:
              XTwitterScraper::Models::EventStreamParams::Include::TaggedSymbol,
            look_back: T::Boolean,
            last_event_id: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Include
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::EventStreamParams::Include)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        POST_METRICS =
          T.let(
            :post_metrics,
            XTwitterScraper::Models::EventStreamParams::Include::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::EventStreamParams::Include::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
