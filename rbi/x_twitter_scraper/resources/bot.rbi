# typed: strong

module XTwitterScraper
  module Resources
    class Bot
      sig { returns(XTwitterScraper::Resources::Bot::PlatformLinks) }
      attr_reader :platform_links

      # @api private
      sig { params(client: XTwitterScraper::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
