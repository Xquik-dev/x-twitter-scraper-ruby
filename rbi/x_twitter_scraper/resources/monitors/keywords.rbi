# typed: strong

module XTwitterScraper
  module Resources
    class Monitors
      # Real-time X account monitoring
      class Keywords
        # Creates an instant keyword monitor. Keyword monitors are unlimited. Active
        # monitors check every 1 second and cost 21 credits per hour. Events and webhook
        # deliveries are included. Creation requires available credits for the first
        # hourly charge.
        sig do
          params(
            event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
            query: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Monitors::KeywordCreateResponse)
        end
        def create(
          # Array of event types to subscribe to.
          event_types:,
          # X search query to monitor. Whitespace is normalized.
          query:,
          request_options: {}
        )
        end

        # Get keyword monitor
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Monitors::KeywordRetrieveResponse)
        end
        def retrieve(
          # Resource ID returned by the matching create or list endpoint.
          id,
          request_options: {}
        )
        end

        # Update keyword monitor
        sig do
          params(
            id: String,
            event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
            is_active: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Monitors::KeywordUpdateResponse)
        end
        def update(
          # Resource ID returned by the matching create or list endpoint.
          id,
          # Array of event types to subscribe to.
          event_types: nil,
          is_active: nil,
          request_options: {}
        )
        end

        # List keyword monitors
        sig do
          params(
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Monitors::KeywordListResponse)
        end
        def list(request_options: {})
        end

        # Delete keyword monitor
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(
            XTwitterScraper::Models::Monitors::KeywordDeactivateResponse
          )
        end
        def deactivate(
          # Resource ID returned by the matching create or list endpoint.
          id,
          request_options: {}
        )
        end

        # @api private
        sig do
          params(client: XTwitterScraper::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
