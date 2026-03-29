# typed: strong

module XTwitterScraper
  module Resources
    # Telegram bot service endpoints
    class Bot
      # Telegram bot service endpoints
      sig { returns(XTwitterScraper::Resources::Bot::PlatformLinks) }
      attr_reader :platform_links

      # Track bot token usage
      sig do
        params(
          input_tokens: Integer,
          output_tokens: Integer,
          platform_user_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::BotTrackUsageResponse)
      end
      def track_usage(
        input_tokens:,
        output_tokens:,
        platform_user_id:,
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
