# typed: strong

module XTwitterScraper
  module Resources
    # Push notification integrations (Telegram)
    class Integrations
      # Create integration
      sig do
        params(
          config: XTwitterScraper::IntegrationCreateParams::Config::OrHash,
          event_types:
            T::Array[
              XTwitterScraper::IntegrationCreateParams::EventType::OrSymbol
            ],
          name: String,
          type: XTwitterScraper::IntegrationCreateParams::Type::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::IntegrationCreateResponse)
      end
      def create(
        # Integration config (e.g. Telegram chatId)
        config:,
        event_types:,
        name:,
        type:,
        request_options: {}
      )
      end

      # Get integration details
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::IntegrationRetrieveResponse)
      end
      def retrieve(
        # Resource ID (stringified bigint)
        id,
        request_options: {}
      )
      end

      # Update integration
      sig do
        params(
          id: String,
          event_types:
            T::Array[
              XTwitterScraper::IntegrationUpdateParams::EventType::OrSymbol
            ],
          filters: T::Hash[Symbol, T.anything],
          is_active: T::Boolean,
          message_template: T::Hash[Symbol, T.anything],
          name: String,
          scope_all_monitors: T::Boolean,
          silent_push: T::Boolean,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::IntegrationUpdateResponse)
      end
      def update(
        # Resource ID (stringified bigint)
        id,
        event_types: nil,
        filters: nil,
        is_active: nil,
        message_template: nil,
        name: nil,
        scope_all_monitors: nil,
        silent_push: nil,
        request_options: {}
      )
      end

      # List integrations
      sig do
        params(
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::IntegrationListResponse)
      end
      def list(request_options: {})
      end

      # Delete integration
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::IntegrationDeleteResponse)
      end
      def delete(
        # Resource ID (stringified bigint)
        id,
        request_options: {}
      )
      end

      # List integration delivery history
      sig do
        params(
          id: String,
          limit: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::IntegrationListDeliveriesResponse)
      end
      def list_deliveries(
        # Resource ID (stringified bigint)
        id,
        limit: nil,
        request_options: {}
      )
      end

      # Send test delivery
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::IntegrationSendTestResponse)
      end
      def send_test(
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
