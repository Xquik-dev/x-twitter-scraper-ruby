# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Tweets
        # X write actions (tweets, likes, follows, DMs)
        sig { returns(XTwitterScraper::Resources::X::Tweets::Like) }
        attr_reader :like

        # X write actions (tweets, likes, follows, DMs)
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

        # Look up tweet
        sig do
          params(
            tweet_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetRetrieveResponse)
        end
        def retrieve(tweet_id, request_options: {})
        end

        # Get multiple tweets by IDs
        sig do
          params(
            ids: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).void
        end
        def list(
          # Comma-separated tweet IDs (max 100)
          ids:,
          request_options: {}
        )
        end

        # Delete tweet
        sig do
          params(
            tweet_id: String,
            account: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetDeleteResponse)
        end
        def delete(
          tweet_id,
          # X account (@username or account ID)
          account:,
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
          # Tweet ID
          id,
          # Pagination cursor from previous response
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
          # Tweet ID
          id,
          # Pagination cursor
          cursor: nil,
          # Include replies (default false)
          include_replies: nil,
          # Unix timestamp - filter after
          since_time: nil,
          # Unix timestamp - filter before
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
          # Tweet ID
          id,
          # Pagination cursor
          cursor: nil,
          # Unix timestamp - filter after
          since_time: nil,
          # Unix timestamp - filter before
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
          # Tweet ID
          id,
          # Pagination cursor
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
          # Tweet ID
          id,
          # Pagination cursor
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
          # Deprecated — use cursor-based pagination instead
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
