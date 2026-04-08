# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Tweets
        sig { returns(XTwitterScraper::Resources::X::Tweets::Like) }
        attr_reader :like

        sig { returns(XTwitterScraper::Resources::X::Tweets::Retweet) }
        attr_reader :retweet

        # Create tweet
        sig do
          params(
            account: String,
            text: String,
            attachment_url: String,
            community_id: String,
            is_note_tweet: T::Boolean,
            media_ids: T::Array[String],
            reply_to_tweet_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetCreateResponse)
        end
        def create(
          # X account (@username or account ID)
          account:,
          text:,
          attachment_url: nil,
          community_id: nil,
          is_note_tweet: nil,
          media_ids: nil,
          reply_to_tweet_id: nil,
          request_options: {}
        )
        end

        # Get multiple tweets by IDs
        sig do
          params(
            ids: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetListResponse)
        end
        def list(
          # Comma-separated tweet IDs (max 100)
          ids:,
          request_options: {}
        )
        end

        # Get users who liked a tweet
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetGetFavoritersResponse)
        end
        def get_favoriters(
          # Tweet ID to get favoriters
          id,
          # Pagination cursor for favoriters
          cursor: nil,
          request_options: {}
        )
        end

        # Get quote tweets of a tweet
        sig do
          params(
            id: String,
            cursor: String,
            include_replies: T::Boolean,
            since_time: String,
            until_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetGetQuotesResponse)
        end
        def get_quotes(
          # Tweet ID to get quotes
          id,
          # Pagination cursor for quote tweets
          cursor: nil,
          # Include reply quotes (default false)
          include_replies: nil,
          # Unix timestamp - return quotes posted after this time
          since_time: nil,
          # Unix timestamp - return quotes posted before this time
          until_time: nil,
          request_options: {}
        )
        end

        # Get replies to a tweet
        sig do
          params(
            id: String,
            cursor: String,
            since_time: String,
            until_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetGetRepliesResponse)
        end
        def get_replies(
          # Tweet ID to get replies
          id,
          # Pagination cursor for tweet replies
          cursor: nil,
          # Unix timestamp - return replies posted after this time
          since_time: nil,
          # Unix timestamp - return replies posted before this time
          until_time: nil,
          request_options: {}
        )
        end

        # Get users who retweeted a tweet
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetGetRetweetersResponse)
        end
        def get_retweeters(
          # Tweet ID to get retweeters
          id,
          # Pagination cursor for retweeters
          cursor: nil,
          request_options: {}
        )
        end

        # Get thread context for a tweet
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetGetThreadResponse)
        end
        def get_thread(
          # Tweet ID to get thread context
          id,
          # Pagination cursor for thread tweets
          cursor: nil,
          request_options: {}
        )
        end

        # Search tweets
        sig do
          params(
            q: String,
            cursor: String,
            limit: Integer,
            query_type:
              XTwitterScraper::X::TweetSearchParams::QueryType::OrSymbol,
            since_time: String,
            until_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetSearchResponse)
        end
        def search(
          # Search query (keywords,
          q:,
          # Pagination cursor from previous response
          cursor: nil,
          # Max tweets to return (server paginates internally). Omit for single page (~20).
          limit: nil,
          # Sort order — Latest (chronological) or Top (engagement-ranked)
          query_type: nil,
          # ISO 8601 timestamp — only return tweets after this time
          since_time: nil,
          # ISO 8601 timestamp — only return tweets before this time
          until_time: nil,
          request_options: {}
        )
        end

        # @api private
        sig do
          params(client: XTwitterScraper::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
