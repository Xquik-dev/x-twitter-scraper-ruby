# typed: strong

module XTwitterScraper
  module Resources
    # Activity events from monitored accounts
    class Events
      # Get event
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::EventRetrieveResponse)
      end
      def retrieve(
        # Resource ID (stringified bigint)
        id,
        request_options: {}
      )
      end

      # List events
      sig do
        params(
          after: String,
          event_type: XTwitterScraper::EventListParams::EventType::OrSymbol,
          limit: Integer,
          monitor_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::EventListResponse)
      end
      def list(
        # Cursor for pagination
        after: nil,
        event_type: nil,
        limit: nil,
        monitor_id: nil,
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
