# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Telegram bot service endpoints
    class Bot
      # Telegram bot service endpoints
      # @return [XTwitterScraper::Resources::Bot::PlatformLinks]
      attr_reader :platform_links

      # Track bot token usage
      #
      # @overload track_usage(input_tokens:, output_tokens:, platform_user_id:, request_options: {})
      #
      # @param input_tokens [Integer]
      # @param output_tokens [Integer]
      # @param platform_user_id [String]
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::BotTrackUsageResponse]
      #
      # @see XTwitterScraper::Models::BotTrackUsageParams
      def track_usage(params)
        parsed, options = XTwitterScraper::BotTrackUsageParams.dump_request(params)
        @client.request(
          method: :post,
          path: "bot/usage",
          body: parsed,
          model: XTwitterScraper::Models::BotTrackUsageResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [XTwitterScraper::Client]
      def initialize(client:)
        @client = client
        @platform_links = XTwitterScraper::Resources::Bot::PlatformLinks.new(client: client)
      end
    end
  end
end
