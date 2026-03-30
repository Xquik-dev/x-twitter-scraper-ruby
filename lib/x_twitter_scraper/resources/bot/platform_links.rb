# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class Bot
      class PlatformLinks
        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
