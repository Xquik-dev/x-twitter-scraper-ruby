# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Users
        # X write actions (tweets, likes, follows, DMs)
        # @return [XTwitterScraper::Resources::X::Users::Follow]
        attr_reader :follow

        # Get user profile with follower counts & verification
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] X username (without @) or user ID
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::UserProfile]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["x/users/%1$s", id],
            model: XTwitterScraper::UserProfile,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::UserRemoveFollowerParams} for more details.
        #
        # Remove follower
        #
        # @overload remove_follower(id, account:, idempotency_key:, request_options: {})
        #
        # @param id [String] Path param: User ID to remove from your followers
        #
        # @param account [String] Body param: X account identifier (@username or account ID)
        #
        # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::UserRemoveFollowerResponse]
        #
        # @see XTwitterScraper::Models::X::UserRemoveFollowerParams
        def remove_follower(id, params)
          parsed, options = XTwitterScraper::X::UserRemoveFollowerParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :post,
            path: ["x/users/%1$s/remove-follower", id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: XTwitterScraper::Models::X::UserRemoveFollowerResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::UserRetrieveBatchParams} for more details.
        #
        # Look up multiple users by IDs in one call
        #
        # @overload retrieve_batch(ids:, request_options: {})
        #
        # @param ids [String] Comma-separated numeric user IDs (1-100 values). Duplicate IDs are ignored while
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::UserRetrieveBatchResponse]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveBatchParams
        def retrieve_batch(params)
          parsed, options = XTwitterScraper::X::UserRetrieveBatchParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/users/batch",
            query: query,
            model: XTwitterScraper::Models::X::UserRetrieveBatchResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::UserRetrieveFollowersParams} for more details.
        #
        # List followers of a user
        #
        # @overload retrieve_followers(id, after: nil, cursor: nil, limit: nil, page_size: nil, request_options: {})
        #
        # @param id [String] Target user ID or username for follower lookup.
        #
        # @param after [String] Legacy cursor alias. Prefer cursor.
        #
        # @param cursor [String] Pagination cursor for followers list
        #
        # @param limit [Integer] Legacy integer page size alias for following lists. Prefer pageSize.
        #
        # @param page_size [Integer] Maximum user profiles requested from this page (20-200, default 200). The respon
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveFollowersParams
        def retrieve_followers(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveFollowersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/followers", id],
            query: query.transform_keys(page_size: "pageSize"),
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::UserRetrieveFollowersYouKnowParams} for more
        # details.
        #
        # List mutual followers between you and a user
        #
        # @overload retrieve_followers_you_know(id, cursor: nil, page_size: nil, request_options: {})
        #
        # @param id [String] User ID for followers-you-know lookup
        #
        # @param cursor [String] Pagination cursor for followers-you-know
        #
        # @param page_size [Integer] Maximum user profiles requested from this page (20-200, default 200). The respon
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveFollowersYouKnowParams
        def retrieve_followers_you_know(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveFollowersYouKnowParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/followers-you-know", id],
            query: query.transform_keys(page_size: "pageSize"),
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::UserRetrieveFollowingParams} for more details.
        #
        # List accounts a user follows
        #
        # @overload retrieve_following(id, after: nil, cursor: nil, limit: nil, page_size: nil, request_options: {})
        #
        # @param id [String] User ID or username for following lookup
        #
        # @param after [String] Deprecated following cursor alias. Prefer cursor.
        #
        # @param cursor [String] Pagination cursor for following list
        #
        # @param limit [Integer] Legacy page size alias. Prefer pageSize.
        #
        # @param page_size [Integer] Maximum user profiles requested from this page (20-200, default 200). The respon
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveFollowingParams
        def retrieve_following(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveFollowingParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/following", id],
            query: query.transform_keys(page_size: "pageSize"),
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::UserRetrieveLikesParams} for more details.
        #
        # List tweets liked by a user
        #
        # @overload retrieve_likes(id, any_words: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, media_type: nil, mentioning: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, to_user: nil, until_date: nil, url: nil, verified_only: nil, request_options: {})
        #
        # @param id [String] User ID or username
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor for liked tweets
        #
        # @param exact_phrase [String] Exact phrase to match.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param from_user [String] Filter by author username.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param language [String] Language code filter, e.g. en or tr.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveLikesParams::MediaType] Filter by media type.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param min_faves [Integer] Minimum likes threshold.
        #
        # @param min_quotes [Integer] Minimum quote count threshold.
        #
        # @param min_replies [Integer] Minimum replies threshold.
        #
        # @param min_retweets [Integer] Minimum retweets threshold.
        #
        # @param page_size [Integer] Maximum items requested from this page (1-100, default 20). The response can con
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveLikesParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveLikesParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveLikesParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveLikesParams
        def retrieve_likes(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveLikesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/likes", id],
            query: query.transform_keys(
              any_words: "anyWords",
              conversation_id: "conversationId",
              exact_phrase: "exactPhrase",
              exclude_words: "excludeWords",
              from_user: "fromUser",
              in_reply_to_tweet_id: "inReplyToTweetId",
              media_type: "mediaType",
              min_faves: "minFaves",
              min_quotes: "minQuotes",
              min_replies: "minReplies",
              min_retweets: "minRetweets",
              page_size: "pageSize",
              quotes_of_tweet_id: "quotesOfTweetId",
              retweets_of_tweet_id: "retweetsOfTweetId",
              since_date: "sinceDate",
              to_user: "toUser",
              until_date: "untilDate",
              verified_only: "verifiedOnly"
            ),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::UserRetrieveMediaParams} for more details.
        #
        # List media tweets posted by a user
        #
        # @overload retrieve_media(id, any_words: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, media_type: nil, mentioning: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, to_user: nil, until_date: nil, url: nil, verified_only: nil, request_options: {})
        #
        # @param id [String] User ID or username for media lookup
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor for media tweets
        #
        # @param exact_phrase [String] Exact phrase to match.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param from_user [String] Filter by author username.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param language [String] Language code filter, e.g. en or tr.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveMediaParams::MediaType] Filter by media type.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param min_faves [Integer] Minimum likes threshold.
        #
        # @param min_quotes [Integer] Minimum quote count threshold.
        #
        # @param min_replies [Integer] Minimum replies threshold.
        #
        # @param min_retweets [Integer] Minimum retweets threshold.
        #
        # @param page_size [Integer] Maximum items requested from this page (1-100, default 20). The response can con
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveMediaParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveMediaParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveMediaParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveMediaParams
        def retrieve_media(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveMediaParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/media", id],
            query: query.transform_keys(
              any_words: "anyWords",
              conversation_id: "conversationId",
              exact_phrase: "exactPhrase",
              exclude_words: "excludeWords",
              from_user: "fromUser",
              in_reply_to_tweet_id: "inReplyToTweetId",
              media_type: "mediaType",
              min_faves: "minFaves",
              min_quotes: "minQuotes",
              min_replies: "minReplies",
              min_retweets: "minRetweets",
              page_size: "pageSize",
              quotes_of_tweet_id: "quotesOfTweetId",
              retweets_of_tweet_id: "retweetsOfTweetId",
              since_date: "sinceDate",
              to_user: "toUser",
              until_date: "untilDate",
              verified_only: "verifiedOnly"
            ),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::UserRetrieveMentionsParams} for more details.
        #
        # List tweets mentioning a user
        #
        # @overload retrieve_mentions(id, any_words: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, media_type: nil, mentioning: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, since_time: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, request_options: {})
        #
        # @param id [String] User ID or username for mentions lookup
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor for mentions
        #
        # @param exact_phrase [String] Exact phrase to match.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param from_user [String] Filter by author username.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param language [String] Language code filter, e.g. en or tr.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::MediaType] Filter by media type.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param min_faves [Integer] Minimum likes threshold.
        #
        # @param min_quotes [Integer] Minimum quote count threshold.
        #
        # @param min_replies [Integer] Minimum replies threshold.
        #
        # @param min_retweets [Integer] Minimum retweets threshold.
        #
        # @param page_size [Integer] Maximum items requested from this page (1-100, default 20). The response can con
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param since_time [String] Unix timestamp - return mentions after this time
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param until_time [String] Unix timestamp - return mentions before this time
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveMentionsParams
        def retrieve_mentions(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveMentionsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/mentions", id],
            query: query.transform_keys(
              any_words: "anyWords",
              conversation_id: "conversationId",
              exact_phrase: "exactPhrase",
              exclude_words: "excludeWords",
              from_user: "fromUser",
              in_reply_to_tweet_id: "inReplyToTweetId",
              media_type: "mediaType",
              min_faves: "minFaves",
              min_quotes: "minQuotes",
              min_replies: "minReplies",
              min_retweets: "minRetweets",
              page_size: "pageSize",
              quotes_of_tweet_id: "quotesOfTweetId",
              retweets_of_tweet_id: "retweetsOfTweetId",
              since_date: "sinceDate",
              since_time: "sinceTime",
              to_user: "toUser",
              until_date: "untilDate",
              until_time: "untilTime",
              verified_only: "verifiedOnly"
            ),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::UserRetrieveRepliesParams} for more details.
        #
        # Returns the user's timeline with replies included by default.
        #
        # @overload retrieve_replies(id, any_words: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, from_user: nil, hashtags: nil, include_parent_tweet: nil, in_reply_to_tweet_id: nil, language: nil, media_type: nil, mentioning: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, to_user: nil, until_date: nil, url: nil, verified_only: nil, request_options: {})
        #
        # @param id [String] Target user ID or username for the replies timeline.
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor for user replies
        #
        # @param exact_phrase [String] Exact phrase to match.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param from_user [String] Filter by author username.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param include_parent_tweet [Boolean] Include each reply's parent tweet.
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param language [String] Language code filter, e.g. en or tr.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::MediaType] Filter by media type.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param min_faves [Integer] Minimum likes threshold.
        #
        # @param min_quotes [Integer] Minimum quote count threshold.
        #
        # @param min_replies [Integer] Minimum replies threshold.
        #
        # @param min_retweets [Integer] Minimum retweets threshold.
        #
        # @param page_size [Integer] Maximum items requested from this page (1-100, default 20). The response can con
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveRepliesParams
        def retrieve_replies(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveRepliesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/replies", id],
            query: query.transform_keys(
              any_words: "anyWords",
              conversation_id: "conversationId",
              exact_phrase: "exactPhrase",
              exclude_words: "excludeWords",
              from_user: "fromUser",
              include_parent_tweet: "includeParentTweet",
              in_reply_to_tweet_id: "inReplyToTweetId",
              media_type: "mediaType",
              min_faves: "minFaves",
              min_quotes: "minQuotes",
              min_replies: "minReplies",
              min_retweets: "minRetweets",
              page_size: "pageSize",
              quotes_of_tweet_id: "quotesOfTweetId",
              retweets_of_tweet_id: "retweetsOfTweetId",
              since_date: "sinceDate",
              to_user: "toUser",
              until_date: "untilDate",
              verified_only: "verifiedOnly"
            ),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Search users by name or username
        #
        # @overload retrieve_search(q:, cursor: nil, request_options: {})
        #
        # @param q [String] User search query
        #
        # @param cursor [String] Pagination cursor for user search
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveSearchParams
        def retrieve_search(params)
          parsed, options = XTwitterScraper::X::UserRetrieveSearchParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/users/search",
            query: query,
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::UserRetrieveTweetsParams} for more details.
        #
        # List recent tweets posted by a user
        #
        # @overload retrieve_tweets(id, any_words: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, from_user: nil, hashtags: nil, include_parent_tweet: nil, include_replies: nil, in_reply_to_tweet_id: nil, language: nil, media_type: nil, mentioning: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, to_user: nil, until_date: nil, url: nil, verified_only: nil, request_options: {})
        #
        # @param id [String] X user ID or username
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor for user tweets
        #
        # @param exact_phrase [String] Exact phrase to match.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param from_user [String] Filter by author username.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param include_parent_tweet [Boolean] Include parent tweet for replies
        #
        # @param include_replies [Boolean] Include reply tweets
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param language [String] Language code filter, e.g. en or tr.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveTweetsParams::MediaType] Filter by media type.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param min_faves [Integer] Minimum likes threshold.
        #
        # @param min_quotes [Integer] Minimum quote count threshold.
        #
        # @param min_replies [Integer] Minimum replies threshold.
        #
        # @param min_retweets [Integer] Minimum retweets threshold.
        #
        # @param page_size [Integer] Maximum items requested from this page (1-100, default 20). The response can con
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveTweetsParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveTweetsParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveTweetsParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveTweetsParams
        def retrieve_tweets(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveTweetsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/tweets", id],
            query: query.transform_keys(
              any_words: "anyWords",
              conversation_id: "conversationId",
              exact_phrase: "exactPhrase",
              exclude_words: "excludeWords",
              from_user: "fromUser",
              include_parent_tweet: "includeParentTweet",
              include_replies: "includeReplies",
              in_reply_to_tweet_id: "inReplyToTweetId",
              media_type: "mediaType",
              min_faves: "minFaves",
              min_quotes: "minQuotes",
              min_replies: "minReplies",
              min_retweets: "minRetweets",
              page_size: "pageSize",
              quotes_of_tweet_id: "quotesOfTweetId",
              retweets_of_tweet_id: "retweetsOfTweetId",
              since_date: "sinceDate",
              to_user: "toUser",
              until_date: "untilDate",
              verified_only: "verifiedOnly"
            ),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::UserRetrieveVerifiedFollowersParams} for more
        # details.
        #
        # List verified followers of a user
        #
        # @overload retrieve_verified_followers(id, cursor: nil, page_size: nil, request_options: {})
        #
        # @param id [String] User ID or username for verified followers
        #
        # @param cursor [String] Pagination cursor for verified followers
        #
        # @param page_size [Integer] Maximum user profiles requested from this page (20-200, default 200). The respon
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveVerifiedFollowersParams
        def retrieve_verified_followers(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveVerifiedFollowersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/verified-followers", id],
            query: query.transform_keys(page_size: "pageSize"),
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
          @follow = XTwitterScraper::Resources::X::Users::Follow.new(client: client)
        end
      end
    end
  end
end
