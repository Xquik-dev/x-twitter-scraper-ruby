# typed: strong

module XTwitterScraper
  module Resources
    # Giveaway draws from tweet replies
    class Draws
      # Get draw details
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::DrawRetrieveResponse)
      end
      def retrieve(
        # Resource ID (stringified bigint)
        id,
        request_options: {}
      )
      end

      # List draws
      sig do
        params(
          after: String,
          limit: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::DrawListResponse)
      end
      def list(
        # Cursor for keyset pagination
        after: nil,
        # Maximum number of items to return (1-100, default 50)
        limit: nil,
        request_options: {}
      )
      end

      # Export draw data
      sig do
        params(
          id: String,
          format_: XTwitterScraper::DrawExportParams::Format::OrSymbol,
          type: XTwitterScraper::DrawExportParams::Type::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def export(
        # Resource ID (stringified bigint)
        id,
        # Export output format
        format_: nil,
        # Export winners or all entries
        type: nil,
        request_options: {}
      )
      end

      # Run giveaway draw
      sig do
        params(
          tweet_url: String,
          backup_count: Integer,
          filter_account_age_days: Integer,
          filter_language: String,
          filter_min_followers: Integer,
          must_follow_username: String,
          must_retweet: T::Boolean,
          required_hashtags: T::Array[String],
          required_keywords: T::Array[String],
          required_mentions: T::Array[String],
          unique_authors_only: T::Boolean,
          winner_count: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::DrawRunResponse)
      end
      def run(
        tweet_url:,
        backup_count: nil,
        filter_account_age_days: nil,
        filter_language: nil,
        filter_min_followers: nil,
        must_follow_username: nil,
        must_retweet: nil,
        required_hashtags: nil,
        required_keywords: nil,
        required_mentions: nil,
        unique_authors_only: nil,
        winner_count: nil,
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
