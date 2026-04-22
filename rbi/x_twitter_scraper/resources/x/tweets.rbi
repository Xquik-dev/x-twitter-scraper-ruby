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
            attachment_url: String,
            community_id: String,
            is_note_tweet: T::Boolean,
            media: T::Array[String],
            media_ids: T::Array[String],
            reply_to_tweet_id: String,
            text: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetCreateResponse)
        end
        def create(
          # X account (@username or account ID)
          account:,
          attachment_url: nil,
          community_id: nil,
          is_note_tweet: nil,
          # Array of media URLs to attach (mutually exclusive with media_ids)
          media: nil,
          # Array of media IDs to attach (mutually exclusive with media)
          media_ids: nil,
          reply_to_tweet_id: nil,
          # Tweet text (optional when media is provided)
          text: nil,
          request_options: {}
        )
        end

        # Get tweet with full text, author, metrics and media
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetRetrieveResponse)
        end
        def retrieve(
          # Tweet ID
          id,
          request_options: {}
        )
        end

        # Get multiple tweets by IDs
        sig do
          params(
            ids: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
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
            id: String,
            account: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetDeleteResponse)
        end
        def delete(
          # Tweet ID to delete
          id,
          # X account identifier (@username or account ID)
          account:,
          request_options: {}
        )
        end

        # List users who liked a tweet
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def get_favoriters(
          # Tweet ID to get favoriters
          id,
          # Pagination cursor for favoriters
          cursor: nil,
          request_options: {}
        )
        end

        # List quote tweets of a tweet
        sig do
          params(
            id: String,
            cursor: String,
            include_replies: T::Boolean,
            since_time: String,
            until_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
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

        # List replies to a tweet
        sig do
          params(
            id: String,
            cursor: String,
            since_time: String,
            until_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
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

        # List users who retweeted a tweet
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def get_retweeters(
          # Tweet ID to get retweeters
          id,
          # Pagination cursor for retweeters
          cursor: nil,
          request_options: {}
        )
        end

        # Get full conversation thread for a tweet
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def get_thread(
          # Tweet ID to get thread context
          id,
          # Pagination cursor for thread tweets
          cursor: nil,
          request_options: {}
        )
        end

        # Search tweets with X query operators and pagination
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
          ).returns(XTwitterScraper::PaginatedTweets)
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
