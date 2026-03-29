# typed: strong

module XTwitterScraper
  module Resources
    # Real-time X account monitoring
    class Monitors
      # Create monitor
      sig do
        params(
          event_types:
            T::Array[XTwitterScraper::MonitorCreateParams::EventType::OrSymbol],
          username: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::MonitorCreateResponse)
      end
      def create(
        event_types:,
        # X username (without @)
        username:,
        request_options: {}
      )
      end

      # Get monitor
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::MonitorRetrieveResponse)
      end
      def retrieve(
        # Resource ID (stringified bigint)
        id,
        request_options: {}
      )
      end

      # Update monitor
      sig do
        params(
          id: String,
          event_types:
            T::Array[XTwitterScraper::MonitorUpdateParams::EventType::OrSymbol],
          is_active: T::Boolean,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::MonitorUpdateResponse)
      end
      def update(
        # Resource ID (stringified bigint)
        id,
        event_types: nil,
        is_active: nil,
        request_options: {}
      )
      end

      # List monitors
      sig do
        params(
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::MonitorListResponse)
      end
      def list(request_options: {})
      end

      # Deactivate monitor
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::MonitorDeactivateResponse)
      end
      def deactivate(
        # Resource ID (stringified bigint)
        id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: XTwitterScraper::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
