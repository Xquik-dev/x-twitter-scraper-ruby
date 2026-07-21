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
            idempotency_key: String,
            community_id: String,
            is_note_tweet: T::Boolean,
            media: T::Array[String],
            reply_to_tweet_id: String,
            text: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetCreateResponse)
        end
        def create(
          # Body param: X account (@username or account ID)
          account:,
          # Header param: Generate one unique value for each intended write. Reuse it only
          # when retrying the exact same account, action, target, and payload. A reused key
          # returns the original action. Reusing it with different input returns 409. Replay
          # protection remains active for at least 90 days.
          idempotency_key:,
          # Body param
          community_id: nil,
          # Body param
          is_note_tweet: nil,
          # Body param: Array of public media URLs to attach. Supports up to 4 images or
          # exactly 1 MP4 video up to 100 MB. Each URL must be publicly reachable. Attached
          # media adds 2 credits per started MB across all files.
          media: nil,
          # Body param
          reply_to_tweet_id: nil,
          # Body param: Tweet text (optional when media is provided)
          text: nil,
          request_options: {}
        )
        end

        # Get tweet with full text, author, metrics & media
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetRetrieveResponse)
        end
        def retrieve(
          # Numeric tweet ID, 15-20 digits
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
            idempotency_key: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::TweetDeleteResponse)
        end
        def delete(
          # Path param: Tweet ID to delete
          id,
          # Body param: X account identifier (@username or account ID)
          account:,
          # Header param: Generate one unique value for each intended write. Reuse it only
          # when retrying the exact same account, action, target, and payload. A reused key
          # returns the original action. Reusing it with different input returns 409. Replay
          # protection remains active for at least 90 days.
          idempotency_key:,
          request_options: {}
        )
        end

        # Returns liker profiles that X makes visible for the post. X can withhold liker
        # identities even when the post reports likes. In that case this endpoint returns
        # 424 `favoriters_unavailable` instead of a misleading empty success.
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def get_favoriters(
          # Tweet ID to get favoriters
          id,
          # Pagination cursor for favoriters
          cursor: nil,
          # Maximum user profiles requested from this page (20-200, default 200). The
          # response can contain fewer profiles because the source returned fewer or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true. The deprecated limit and count aliases remain accepted.
          page_size: nil,
          request_options: {}
        )
        end

        # List quote tweets of a tweet
        sig do
          params(
            id: String,
            any_words: String,
            cashtags: String,
            conversation_id: String,
            cursor: String,
            exact_phrase: String,
            exclude_words: String,
            from_user: String,
            hashtags: String,
            include_replies: T::Boolean,
            in_reply_to_tweet_id: String,
            language: String,
            media_type:
              XTwitterScraper::X::TweetGetQuotesParams::MediaType::OrSymbol,
            mentioning: String,
            min_faves: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            page_size: Integer,
            quotes: XTwitterScraper::X::TweetGetQuotesParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::TweetGetQuotesParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::TweetGetQuotesParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            since_date: Date,
            since_time: String,
            to_user: String,
            until_date: Date,
            until_time: String,
            url: String,
            verified_only: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def get_quotes(
          # Numeric tweet ID to get quotes, 15-20 digits
          id,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor for quote tweets
          cursor: nil,
          # Exact phrase to match.
          exact_phrase: nil,
          # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          exclude_words: nil,
          # Filter by author username.
          from_user: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Include reply quotes (default false)
          include_replies: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Language code filter, e.g. en or tr.
          language: nil,
          # Filter by media type.
          media_type: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Minimum likes threshold.
          min_faves: nil,
          # Minimum quote count threshold.
          min_quotes: nil,
          # Minimum replies threshold.
          min_replies: nil,
          # Minimum retweets threshold.
          min_retweets: nil,
          # Maximum items requested from this page (1-100, default 20). The response can
          # contain fewer items because the source returned fewer, filters removed items, or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true, even when a page is empty. The deprecated limit and count
          # aliases remain accepted.
          page_size: nil,
          # Quote mode.
          quotes: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Reply mode.
          replies: nil,
          # Retweet mode.
          retweets: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Start date in YYYY-MM-DD format.
          since_date: nil,
          # Unix timestamp - return quotes posted after this time
          since_time: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # Unix timestamp - return quotes posted before this time
          until_time: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          request_options: {}
        )
        end

        # Returns visible replies. For an unfiltered first page, Xquik compares a terminal
        # page with the post's reported reply count. If the page is visibly incomplete,
        # the endpoint returns 424 `replies_incomplete` instead of presenting partial
        # coverage as complete. Use tweet search with a `conversation_id:{id}` query as
        # the broader fallback.
        sig do
          params(
            id: String,
            any_words: String,
            cashtags: String,
            conversation_id: String,
            cursor: String,
            exact_phrase: String,
            exclude_words: String,
            from_user: String,
            hashtags: String,
            in_reply_to_tweet_id: String,
            language: String,
            media_type:
              XTwitterScraper::X::TweetGetRepliesParams::MediaType::OrSymbol,
            mentioning: String,
            min_faves: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            page_size: Integer,
            quotes: XTwitterScraper::X::TweetGetRepliesParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::TweetGetRepliesParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::TweetGetRepliesParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            since_date: Date,
            since_time: String,
            to_user: String,
            until_date: Date,
            until_time: String,
            url: String,
            verified_only: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def get_replies(
          # Tweet ID to get replies
          id,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor for tweet replies
          cursor: nil,
          # Exact phrase to match.
          exact_phrase: nil,
          # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          exclude_words: nil,
          # Filter by author username.
          from_user: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Language code filter, e.g. en or tr.
          language: nil,
          # Filter by media type.
          media_type: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Minimum likes threshold.
          min_faves: nil,
          # Minimum quote count threshold.
          min_quotes: nil,
          # Minimum replies threshold.
          min_replies: nil,
          # Minimum retweets threshold.
          min_retweets: nil,
          # Maximum items requested from this page (1-100, default 20). The response can
          # contain fewer items because the source returned fewer, filters removed items, or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true, even when a page is empty. The deprecated limit and count
          # aliases remain accepted.
          page_size: nil,
          # Quote mode.
          quotes: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Reply mode.
          replies: nil,
          # Retweet mode.
          retweets: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Start date in YYYY-MM-DD format.
          since_date: nil,
          # Unix timestamp - return replies posted after this time
          since_time: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # Unix timestamp - return replies posted before this time
          until_time: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          request_options: {}
        )
        end

        # List users who retweeted a tweet
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def get_retweeters(
          # Tweet ID to get retweeters
          id,
          # Pagination cursor for retweeters
          cursor: nil,
          # Maximum user profiles requested from this page (20-200, default 200). The
          # response can contain fewer profiles because the source returned fewer or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true. The deprecated limit and count aliases remain accepted.
          page_size: nil,
          request_options: {}
        )
        end

        # Get full conversation thread for a tweet
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def get_thread(
          # Tweet ID to get thread context
          id,
          # Pagination cursor for thread tweets
          cursor: nil,
          # Maximum items requested from this page (1-100, default 20). The response can
          # contain fewer items because the source returned fewer, filters removed items, or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true, even when a page is empty. The deprecated limit and count
          # aliases remain accepted.
          page_size: nil,
          request_options: {}
        )
        end

        # Search tweets by query, Tweet ID, X status URL, or account date window
        sig do
          params(
            q: String,
            advanced_query: String,
            any_words: String,
            bounding_box: String,
            cashtags: String,
            conversation_id: String,
            cursor: String,
            exact_phrase: String,
            exclude_words: String,
            from_user: String,
            hashtags: String,
            in_reply_to_tweet_id: String,
            language: String,
            limit: Integer,
            list_id: String,
            media_type:
              XTwitterScraper::X::TweetSearchParams::MediaType::OrSymbol,
            mentioning: String,
            min_faves: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            place: String,
            place_country: String,
            point_radius: String,
            query_type:
              XTwitterScraper::X::TweetSearchParams::QueryType::OrSymbol,
            quotes: XTwitterScraper::X::TweetSearchParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies: XTwitterScraper::X::TweetSearchParams::Replies::OrSymbol,
            retweets: XTwitterScraper::X::TweetSearchParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            since_date: Date,
            since_time: String,
            to_user: String,
            until_date: Date,
            until_time: String,
            url: String,
            verified_only: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def search(
          # Search query (keywords,
          q:,
          # Raw advanced search query appended as-is.
          advanced_query: nil,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Geo bounding box, e.g. -74.1 40.6 -73.9 40.8.
          bounding_box: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor from previous response
          cursor: nil,
          # Exact phrase to match.
          exact_phrase: nil,
          # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          exclude_words: nil,
          # Filter by author username.
          from_user: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Language code filter, e.g. en or tr.
          language: nil,
          # Max tweets to return (server paginates internally). Omit for single page (~20).
          # This is an upper bound for paid authenticated calls: remaining credits can
          # reduce the returned page size, and zero affordable results returns 402
          # insufficient_credits.
          limit: nil,
          # Search within a list ID.
          list_id: nil,
          # Filter by media type.
          media_type: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Minimum likes threshold.
          min_faves: nil,
          # Minimum quote count threshold.
          min_quotes: nil,
          # Minimum replies threshold.
          min_replies: nil,
          # Minimum retweets threshold.
          min_retweets: nil,
          # Search within a place ID.
          place: nil,
          # Search within a country code.
          place_country: nil,
          # Geo point radius, e.g. -73.99 40.73 25mi.
          point_radius: nil,
          # Sort order - Latest (chronological) or Top (engagement-ranked)
          query_type: nil,
          # Quote mode.
          quotes: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Reply mode.
          replies: nil,
          # Retweet mode.
          retweets: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Start date in YYYY-MM-DD format.
          since_date: nil,
          # ISO 8601 timestamp - only return tweets after this time
          since_time: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # ISO 8601 timestamp - only return tweets before this time
          until_time: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
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
