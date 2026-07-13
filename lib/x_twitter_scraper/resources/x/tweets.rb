# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Tweets
        # X write actions (tweets, likes, follows, DMs)
        # @return [XTwitterScraper::Resources::X::Tweets::Like]
        attr_reader :like

        # X write actions (tweets, likes, follows, DMs)
        # @return [XTwitterScraper::Resources::X::Tweets::Retweet]
        attr_reader :retweet

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::TweetCreateParams} for more details.
        #
        # Create tweet
        #
        # @overload create(account:, attachment_url: nil, community_id: nil, is_note_tweet: nil, media: nil, reply_to_tweet_id: nil, text: nil, request_options: {})
        #
        # @param account [String] X account (@username or account ID)
        #
        # @param attachment_url [String]
        #
        # @param community_id [String]
        #
        # @param is_note_tweet [Boolean]
        #
        # @param media [Array<String>] Array of public media URLs to attach. Supports up to 4 images or exactly 1 MP4 v
        #
        # @param reply_to_tweet_id [String]
        #
        # @param text [String] Tweet text (optional when media is provided)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetCreateResponse]
        #
        # @see XTwitterScraper::Models::X::TweetCreateParams
        def create(params)
          parsed, options = XTwitterScraper::X::TweetCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/tweets",
            body: parsed,
            model: XTwitterScraper::Models::X::TweetCreateResponse,
            options: options
          )
        end

        # Get tweet with full text, author, metrics and media
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Numeric tweet ID, 15-20 digits
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetRetrieveResponse]
        #
        # @see XTwitterScraper::Models::X::TweetRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s", id],
            model: XTwitterScraper::Models::X::TweetRetrieveResponse,
            options: params[:request_options]
          )
        end

        # Get multiple tweets by IDs
        #
        # @overload list(ids:, request_options: {})
        #
        # @param ids [String] Comma-separated tweet IDs (max 100)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::TweetListParams
        def list(params)
          parsed, options = XTwitterScraper::X::TweetListParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/tweets",
            query: query,
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Delete tweet
        #
        # @overload delete(id, account:, request_options: {})
        #
        # @param id [String] Tweet ID to delete
        #
        # @param account [String] X account identifier (@username or account ID)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetDeleteResponse]
        #
        # @see XTwitterScraper::Models::X::TweetDeleteParams
        def delete(id, params)
          parsed, options = XTwitterScraper::X::TweetDeleteParams.dump_request(params)
          @client.request(
            method: :delete,
            path: ["x/tweets/%1$s", id],
            body: parsed,
            model: XTwitterScraper::Models::X::TweetDeleteResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::TweetGetFavoritersParams} for more details.
        #
        # List users who liked a tweet
        #
        # @overload get_favoriters(id, cursor: nil, page_size: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get favoriters
        #
        # @param cursor [String] Pagination cursor for favoriters
        #
        # @param page_size [Integer] Maximum user profiles requested from this page (20-200, default 200). The respon
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::TweetGetFavoritersParams
        def get_favoriters(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetFavoritersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/favoriters", id],
            query: query.transform_keys(page_size: "pageSize"),
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::TweetGetQuotesParams} for more details.
        #
        # List quote tweets of a tweet
        #
        # @overload get_quotes(id, any_words: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, from_user: nil, hashtags: nil, include_replies: nil, in_reply_to_tweet_id: nil, language: nil, media_type: nil, mentioning: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, since_time: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, request_options: {})
        #
        # @param id [String] Numeric tweet ID to get quotes, 15-20 digits
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor for quote tweets
        #
        # @param exact_phrase [String] Exact phrase to match.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param from_user [String] Filter by author username.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param include_replies [Boolean] Include reply quotes (default false)
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param language [String] Language code filter, e.g. en or tr.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::TweetGetQuotesParams::MediaType] Filter by media type.
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
        # @param quotes [Symbol, XTwitterScraper::Models::X::TweetGetQuotesParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::TweetGetQuotesParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::TweetGetQuotesParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param since_time [String] Unix timestamp - return quotes posted after this time
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param until_time [String] Unix timestamp - return quotes posted before this time
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::TweetGetQuotesParams
        def get_quotes(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetQuotesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/quotes", id],
            query: query.transform_keys(
              any_words: "anyWords",
              conversation_id: "conversationId",
              exact_phrase: "exactPhrase",
              exclude_words: "excludeWords",
              from_user: "fromUser",
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
        # {XTwitterScraper::Models::X::TweetGetRepliesParams} for more details.
        #
        # List replies to a tweet
        #
        # @overload get_replies(id, any_words: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, media_type: nil, mentioning: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, since_time: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get replies
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor for tweet replies
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
        # @param media_type [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::MediaType] Filter by media type.
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
        # @param quotes [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param since_time [String] Unix timestamp - return replies posted after this time
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param until_time [String] Unix timestamp - return replies posted before this time
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::TweetGetRepliesParams
        def get_replies(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetRepliesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/replies", id],
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
        # {XTwitterScraper::Models::X::TweetGetRetweetersParams} for more details.
        #
        # List users who retweeted a tweet
        #
        # @overload get_retweeters(id, cursor: nil, page_size: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get retweeters
        #
        # @param cursor [String] Pagination cursor for retweeters
        #
        # @param page_size [Integer] Maximum user profiles requested from this page (20-200, default 200). The respon
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::TweetGetRetweetersParams
        def get_retweeters(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetRetweetersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/retweeters", id],
            query: query.transform_keys(page_size: "pageSize"),
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::TweetGetThreadParams} for more details.
        #
        # Get full conversation thread for a tweet
        #
        # @overload get_thread(id, cursor: nil, page_size: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get thread context
        #
        # @param cursor [String] Pagination cursor for thread tweets
        #
        # @param page_size [Integer] Maximum items requested from this page (1-100, default 20). The response can con
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::TweetGetThreadParams
        def get_thread(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetThreadParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/thread", id],
            query: query.transform_keys(page_size: "pageSize"),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::TweetSearchParams} for more details.
        #
        # Search tweets by query, Tweet ID, X status URL, or account date window
        #
        # @overload search(q:, advanced_query: nil, any_words: nil, bounding_box: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, limit: nil, list_id: nil, media_type: nil, mentioning: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, place: nil, place_country: nil, point_radius: nil, query_type: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, since_time: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, request_options: {})
        #
        # @param q [String] Search query (keywords,
        #
        # @param advanced_query [String] Raw advanced search query appended as-is.
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param bounding_box [String] Geo bounding box, e.g. -74.1 40.6 -73.9 40.8.
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor from previous response
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
        # @param limit [Integer] Max tweets to return (server paginates internally). Omit for single page (~20).
        #
        # @param list_id [String] Search within a list ID.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::TweetSearchParams::MediaType] Filter by media type.
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
        # @param place [String] Search within a place ID.
        #
        # @param place_country [String] Search within a country code.
        #
        # @param point_radius [String] Geo point radius, e.g. -73.99 40.73 25mi.
        #
        # @param query_type [Symbol, XTwitterScraper::Models::X::TweetSearchParams::QueryType] Sort order - Latest (chronological) or Top (engagement-ranked)
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::TweetSearchParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::TweetSearchParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::TweetSearchParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param since_time [String] ISO 8601 timestamp - only return tweets after this time
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param until_time [String] ISO 8601 timestamp - only return tweets before this time
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::TweetSearchParams
        def search(params)
          parsed, options = XTwitterScraper::X::TweetSearchParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/tweets/search",
            query: query.transform_keys(
              advanced_query: "advancedQuery",
              any_words: "anyWords",
              bounding_box: "boundingBox",
              conversation_id: "conversationId",
              exact_phrase: "exactPhrase",
              exclude_words: "excludeWords",
              from_user: "fromUser",
              in_reply_to_tweet_id: "inReplyToTweetId",
              list_id: "listId",
              media_type: "mediaType",
              min_faves: "minFaves",
              min_quotes: "minQuotes",
              min_replies: "minReplies",
              min_retweets: "minRetweets",
              place_country: "placeCountry",
              point_radius: "pointRadius",
              query_type: "queryType",
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

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
          @like = XTwitterScraper::Resources::X::Tweets::Like.new(client: client)
          @retweet = XTwitterScraper::Resources::X::Tweets::Retweet.new(client: client)
        end
      end
    end
  end
end
