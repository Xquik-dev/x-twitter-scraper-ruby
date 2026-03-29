# typed: strong

module XTwitterScraper
  module Resources
    # Trending topics by region
    class Trends
      # Get trending topics
      sig do
        params(
          count: Integer,
          woeid: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::TrendListResponse)
      end
      def list(
        count: nil,
        # Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
        woeid: nil,
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
