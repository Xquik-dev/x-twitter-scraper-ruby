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
        # Draw public ID returned by create and list draw responses.
        id,
        request_options: {}
      )
      end

      # List draws
      sig do
        params(
          cursor: String,
          limit: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::DrawListResponse)
      end
      def list(
        # Cursor for keyset pagination from prior response next_cursor
        cursor: nil,
        # Maximum number of items to return (1-100, default 50). For paid per-result
        # endpoints, the returned count may be lower when remaining credits cannot cover
        # the requested page. If zero paid results are affordable, the endpoint returns
        # 402 insufficient_credits.
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
        # Draw public ID returned by create and list draw responses.
        id,
        # Export output format
        format_:,
        # Export winners or all entries
        type: nil,
        request_options: {}
      )
      end

      # Runs a giveaway draw from a source tweet. The draw first checks the minimum
      # credits needed to inspect the source tweet and at least one candidate. Remaining
      # credits cap how many replies and retweeters can be inspected before filters and
      # winner selection run.
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
