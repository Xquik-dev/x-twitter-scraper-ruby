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
        ).returns(XTwitterScraper::EventDetail)
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
          event_type: XTwitterScraper::EventType::OrSymbol,
          limit: Integer,
          monitor_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::EventListResponse)
      end
      def list(
        # Cursor for keyset pagination
        after: nil,
        # Filter events by type
        event_type: nil,
        # Maximum number of items to return (1-100, default 50)
        limit: nil,
        # Filter events by monitor ID
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
