# typed: strong

module XTwitterScraper
  module Resources
    # Tweet composition, drafts, writing styles & radar
    class Styles
      # Get cached style profile
      sig do
        params(
          username: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::StyleProfile)
      end
      def retrieve(
        # X username of cached style
        username,
        request_options: {}
      )
      end

      # Save style profile with custom tweets
      sig do
        params(
          username: String,
          label: String,
          tweets: T::Array[XTwitterScraper::StyleUpdateParams::Tweet::OrHash],
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::StyleProfile)
      end
      def update(
        # X username of cached style
        username,
        # Display label for the style
        label:,
        # Array of tweet objects
        tweets:,
        request_options: {}
      )
      end

      # List cached style profiles
      sig do
        params(
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::StyleListResponse)
      end
      def list(request_options: {})
      end

      # Delete a style profile
      sig do
        params(
          username: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).void
      end
      def delete(
        # X username of cached style
        username,
        request_options: {}
      )
      end

      # Analyze writing style from recent tweets
      sig do
        params(
          username: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::StyleProfile)
      end
      def analyze(
        # X username to analyze
        username:,
        request_options: {}
      )
      end

      # Compare two style profiles
      sig do
        params(
          username1: String,
          username2: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::StyleCompareResponse)
      end
      def compare(
        # First username to compare
        username1:,
        # Second username to compare
        username2:,
        request_options: {}
      )
      end

      # Get engagement metrics for style tweets
      sig do
        params(
          username: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::StyleGetPerformanceResponse)
      end
      def get_performance(
        # X username of cached style
        username,
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
