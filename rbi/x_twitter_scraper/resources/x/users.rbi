# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Users
        # X write actions (tweets, likes, follows, DMs)
        sig { returns(XTwitterScraper::Resources::X::Users::Follow) }
        attr_reader :follow

        # Get user profile with follower counts & verification
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::UserProfile)
        end
        def retrieve(
          # X username (without @) or user ID
          id,
          request_options: {}
        )
        end

        # Remove follower
        sig do
          params(
            id: String,
            account: String,
            idempotency_key: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::UserRemoveFollowerResponse)
        end
        def remove_follower(
          # Path param: User ID to remove from your followers
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

        # Look up multiple users by IDs in one call
        sig do
          params(
            ids: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::UserRetrieveBatchResponse)
        end
        def retrieve_batch(
          # Comma-separated numeric user IDs (1-100 values). Duplicate IDs are ignored while
          # preserving first-seen order.
          ids:,
          request_options: {}
        )
        end

        # List followers of a user
        sig do
          params(
            id: String,
            after: String,
            cursor: String,
            limit: Integer,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_followers(
          # Target user ID or username for follower lookup.
          id,
          # Legacy cursor alias. Prefer cursor.
          after: nil,
          # Pagination cursor for followers list
          cursor: nil,
          # Legacy integer page size alias for following lists. Prefer pageSize.
          limit: nil,
          # Maximum user profiles requested from this page (20-200, default 200). The
          # response can contain fewer profiles because the source returned fewer or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true. The deprecated limit and count aliases remain accepted.
          page_size: nil,
          request_options: {}
        )
        end

        # List mutual followers between you and a user
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_followers_you_know(
          # User ID for followers-you-know lookup
          id,
          # Pagination cursor for followers-you-know
          cursor: nil,
          # Maximum user profiles requested from this page (20-200, default 200). The
          # response can contain fewer profiles because the source returned fewer or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true. The deprecated limit and count aliases remain accepted.
          page_size: nil,
          request_options: {}
        )
        end

        # List accounts a user follows
        sig do
          params(
            id: String,
            after: String,
            cursor: String,
            limit: Integer,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_following(
          # User ID or username for following lookup
          id,
          # Deprecated following cursor alias. Prefer cursor.
          after: nil,
          # Pagination cursor for following list
          cursor: nil,
          # Legacy page size alias. Prefer pageSize.
          limit: nil,
          # Maximum user profiles requested from this page (20-200, default 200). The
          # response can contain fewer profiles because the source returned fewer or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true. The deprecated limit and count aliases remain accepted.
          page_size: nil,
          request_options: {}
        )
        end

        # List tweets liked by a user
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
              XTwitterScraper::X::UserRetrieveLikesParams::MediaType::OrSymbol,
            mentioning: String,
            min_faves: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            page_size: Integer,
            quotes:
              XTwitterScraper::X::UserRetrieveLikesParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::UserRetrieveLikesParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::UserRetrieveLikesParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            since_date: Date,
            to_user: String,
            until_date: Date,
            url: String,
            verified_only: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def retrieve_likes(
          # User ID or username
          id,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor for liked tweets
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
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          request_options: {}
        )
        end

        # List media tweets posted by a user
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
              XTwitterScraper::X::UserRetrieveMediaParams::MediaType::OrSymbol,
            mentioning: String,
            min_faves: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            page_size: Integer,
            quotes:
              XTwitterScraper::X::UserRetrieveMediaParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::UserRetrieveMediaParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::UserRetrieveMediaParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            since_date: Date,
            to_user: String,
            until_date: Date,
            url: String,
            verified_only: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def retrieve_media(
          # User ID or username for media lookup
          id,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor for media tweets
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
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          request_options: {}
        )
        end

        # List tweets mentioning a user
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
              XTwitterScraper::X::UserRetrieveMentionsParams::MediaType::OrSymbol,
            mentioning: String,
            min_faves: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            page_size: Integer,
            quotes:
              XTwitterScraper::X::UserRetrieveMentionsParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::UserRetrieveMentionsParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::UserRetrieveMentionsParams::Retweets::OrSymbol,
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
        def retrieve_mentions(
          # User ID or username for mentions lookup
          id,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor for mentions
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
          # Unix timestamp - return mentions after this time
          since_time: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # Unix timestamp - return mentions before this time
          until_time: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          request_options: {}
        )
        end

        # Returns the user's timeline with replies included by default.
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
            include_parent_tweet: T::Boolean,
            in_reply_to_tweet_id: String,
            language: String,
            media_type:
              XTwitterScraper::X::UserRetrieveRepliesParams::MediaType::OrSymbol,
            mentioning: String,
            min_faves: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            page_size: Integer,
            quotes:
              XTwitterScraper::X::UserRetrieveRepliesParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::UserRetrieveRepliesParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::UserRetrieveRepliesParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            since_date: Date,
            to_user: String,
            until_date: Date,
            url: String,
            verified_only: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def retrieve_replies(
          # Target user ID or username for the replies timeline.
          id,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor for user replies
          cursor: nil,
          # Exact phrase to match.
          exact_phrase: nil,
          # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          exclude_words: nil,
          # Filter by author username.
          from_user: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Include each reply's parent tweet.
          include_parent_tweet: nil,
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
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          request_options: {}
        )
        end

        # Search users by name or username
        sig do
          params(
            q: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_search(
          # User search query
          q:,
          # Pagination cursor for user search
          cursor: nil,
          request_options: {}
        )
        end

        # List recent tweets posted by a user
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
            include_parent_tweet: T::Boolean,
            include_replies: T::Boolean,
            in_reply_to_tweet_id: String,
            language: String,
            media_type:
              XTwitterScraper::X::UserRetrieveTweetsParams::MediaType::OrSymbol,
            mentioning: String,
            min_faves: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            page_size: Integer,
            quotes:
              XTwitterScraper::X::UserRetrieveTweetsParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::UserRetrieveTweetsParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::UserRetrieveTweetsParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            since_date: Date,
            to_user: String,
            until_date: Date,
            url: String,
            verified_only: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def retrieve_tweets(
          # X user ID or username
          id,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor for user tweets
          cursor: nil,
          # Exact phrase to match.
          exact_phrase: nil,
          # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          exclude_words: nil,
          # Filter by author username.
          from_user: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Include parent tweet for replies
          include_parent_tweet: nil,
          # Include reply tweets
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
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          request_options: {}
        )
        end

        # List verified followers of a user
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_verified_followers(
          # User ID or username for verified followers
          id,
          # Pagination cursor for verified followers
          cursor: nil,
          # Maximum user profiles requested from this page (20-200, default 200). The
          # response can contain fewer profiles because the source returned fewer or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true. The deprecated limit and count aliases remain accepted.
          page_size: nil,
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
