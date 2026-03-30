# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class Bot
      # @return [XTwitterScraper::Resources::Bot::PlatformLinks]
      attr_reader :platform_links

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
