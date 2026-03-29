# typed: strong

module XTwitterScraper
  module Resources
    # Subscription & billing
    class Subscribe
      # Get checkout or billing URL
      sig do
        params(
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::SubscribeCreateResponse)
      end
      def create(request_options: {})
      end

      # @api private
      sig { params(client: XTwitterScraper::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
