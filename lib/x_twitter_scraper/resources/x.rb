# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # X write actions (tweets, likes, follows, DMs)
      # @return [XTwitterScraper::Resources::X::WriteActions]
      attr_reader :write_actions

      # @return [XTwitterScraper::Resources::X::Tweets]
      attr_reader :tweets

      # @return [XTwitterScraper::Resources::X::Users]
      attr_reader :users

      # Look up, search, and explore user profiles and relationships
      # @return [XTwitterScraper::Resources::X::Followers]
      attr_reader :followers

      # @return [XTwitterScraper::Resources::X::Dm]
      attr_reader :dm

      # @return [XTwitterScraper::Resources::X::Media]
      attr_reader :media

      # X write actions (tweets, likes, follows, DMs)
      # @return [XTwitterScraper::Resources::X::Profile]
      attr_reader :profile

      # @return [XTwitterScraper::Resources::X::Communities]
      attr_reader :communities

      # Connected X account management
      # @return [XTwitterScraper::Resources::X::Accounts]
      attr_reader :accounts

      # Connected X account management
      # @return [XTwitterScraper::Resources::X::AccountConnectionChallenges]
      attr_reader :account_connection_challenges

      # Connected X account management
      # @return [XTwitterScraper::Resources::X::AccountConnectionAttempts]
      attr_reader :account_connection_attempts

      # Connected X account management
      # @return [XTwitterScraper::Resources::X::AccountConnectionLinks]
      attr_reader :account_connection_links

      # Look up, search, and analyze individual tweets
      # @return [XTwitterScraper::Resources::X::Bookmarks]
      attr_reader :bookmarks

      # X List followers, members, and tweets
      # @return [XTwitterScraper::Resources::X::Lists]
      attr_reader :lists

      # AI analysis of posts, at 2 credits per analyzed post
      # @return [XTwitterScraper::Resources::X::Analysis]
      attr_reader :analysis

      # @return [XTwitterScraper::Resources::X::Broadcasts]
      attr_reader :broadcasts

      # @return [XTwitterScraper::Resources::X::CommunityNotes]
      attr_reader :community_notes

      # @return [XTwitterScraper::Resources::X::Jobs]
      attr_reader :jobs

      # @return [XTwitterScraper::Resources::X::Spaces]
      attr_reader :spaces

      # @return [XTwitterScraper::Resources::X::Sports]
      attr_reader :sports

      # Retrieve the full content of an X Article (long-form post) by numeric tweet ID.
      # Returns article_not_found when the tweet is valid but is not an X Article.
      #
      # @overload get_article(tweet_id, fields: nil, omit: nil, request_options: {})
      #
      # @param tweet_id [String] Numeric tweet ID of the article, 15-20 digits. If you have a tweet URL, use the
      #
      # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
      #
      # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::XGetArticleResponse]
      #
      # @see XTwitterScraper::Models::XGetArticleParams
      def get_article(tweet_id, params = {})
        parsed, options = XTwitterScraper::XGetArticleParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["x/articles/%1$s", tweet_id],
          query: query,
          model: XTwitterScraper::Models::XGetArticleResponse,
          options: options
        )
      end

      # Get home timeline
      #
      # @overload get_home_timeline(cursor: nil, seen_tweet_ids: nil, page_size: nil, request_options: {})
      #
      # @param cursor [String] Pagination cursor for timeline
      #
      # @param seen_tweet_ids [String] Comma-separated tweet IDs to exclude from results. Empty entries are ignored.
      #
      # @param page_size [Integer] Items per page, 1 to 100, default 20. Source, filters or credits can return fewer. Follow next_cursor for more pages.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::PaginatedTweets]
      #
      # @see XTwitterScraper::Models::XGetHomeTimelineParams
      def get_home_timeline(params = {})
        parsed, options = XTwitterScraper::XGetHomeTimelineParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "x/timeline",
          query: query.transform_keys(page_size: "pageSize", seen_tweet_ids: "seenTweetIds"),
          model: XTwitterScraper::PaginatedTweets,
          options: options
        )
      end

      # Get notifications
      #
      # @overload get_notifications(cursor: nil, type: nil, request_options: {})
      #
      # @param cursor [String] Pagination cursor for notifications
      #
      # @param type [Symbol, XTwitterScraper::Models::XGetNotificationsParams::Type] Notification type filter. Unrecognized values fall back to All.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::XGetNotificationsResponse]
      #
      # @see XTwitterScraper::Models::XGetNotificationsParams
      def get_notifications(params = {})
        parsed, options = XTwitterScraper::XGetNotificationsParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "x/notifications",
          query: query,
          model: XTwitterScraper::Models::XGetNotificationsResponse,
          options: options
        )
      end

      # Get trending hashtags & topics from X by region
      #
      # @overload get_trends(at: nil, count: nil, country: nil, fields: nil, location: nil, omit: nil, woeid: nil, request_options: {})
      #
      # @param at [String] A past time, to read what was trending on Twitter then. Takes an ISO 8601 time,
      #
      # @param count [Integer] Number of trending topics to return (1-50, default 30)
      #
      # @param country [String] Country to read trends for, by name or 2-letter code, such as Turkey or TR. Case
      #
      # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
      #
      # @param location [String] Town or country to read trends for, by name, such as Istanbul. Case insensitive.
      #
      # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
      #
      # @param woeid [Integer] Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::XGetTrendsResponse]
      #
      # @see XTwitterScraper::Models::XGetTrendsParams
      def get_trends(params = {})
        parsed, options = XTwitterScraper::XGetTrendsParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "x/trends",
          query: query,
          model: XTwitterScraper::Models::XGetTrendsResponse,
          options: options
        )
      end

      # Returns X's hashflags, the custom emoji X shows after some hashtags. Lists the
      # ones running now unless activeOnly is false. Each returned hashflag costs 1
      # credit.
      #
      # @overload get_hashflags(q: nil, active_only: nil, limit: nil, fields: nil, omit: nil, request_options: {})
      #
      # @param q [String] Text the hashtag contains, such as football. Case insensitive. A leading hash sign is ignored. Alias query. A post holds at most 280 characters.
      #
      # @param active_only [Boolean] Keeps hashflags that run now. Send false to add ended & upcoming ones.
      #
      # @param limit [Integer] Maximum hashflags to return. Omit it for every match. A low credit balance can return fewer. Aliases pageSize, count, max_results, maxItems, max_items & per_page.
      #
      # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
      #
      # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::XGetHashflagsResponse]
      #
      # @see XTwitterScraper::Models::XGetHashflagsParams
      def get_hashflags(params = {})
        parsed, options = XTwitterScraper::Models::XGetHashflagsParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "x/hashflags",
          query: query,
          model: XTwitterScraper::Models::XGetHashflagsResponse,
          options: options
        )
      end

      # Returns each version X wrote of 1 AI news story. Each version has its time,
      # headline & text, oldest first, so you can see how the story changed. Each
      # request costs 1 credit.
      #
      # @overload get_news_story_versions(id, fields: nil, omit: nil, request_options: {})
      #
      # @param id [String] X news story ID, or the URL-encoded story link, such as x.com/i/trending/2110209733533598095.
      #
      # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
      #
      # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::XGetNewsStoryVersionsResponse]
      #
      # @see XTwitterScraper::Models::XGetNewsStoryVersionsParams
      def get_news_story_versions(id, params = {})
        parsed, options = XTwitterScraper::Models::XGetNewsStoryVersionsParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["x/news/%1$s/versions", id],
          query: query,
          model: XTwitterScraper::Models::XGetNewsStoryVersionsResponse,
          options: options
        )
      end

      # Finds places on X by name. Pass a place's id as place to /x/tweets/search to
      # read posts tagged there. X ranks the places, so their order can differ between
      # requests. Each returned place costs 1 credit. Place searches work with names in
      # 6 languages.
      #
      # @overload search_places(q:, limit: nil, fields: nil, omit: nil, request_options: {})
      #
      # @param q [String] Place name to search for, such as istanbul. Alias query. Xquik's cap is 4,096 characters.
      #
      # @param limit [Integer] Maximum places to return. Omit it for every place X finds. A low credit balance can return fewer. Aliases pageSize, count, max_results, maxItems, max_items & per_page.
      #
      # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
      #
      # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::XSearchPlacesResponse]
      #
      # @see XTwitterScraper::Models::XSearchPlacesParams
      def search_places(params)
        parsed, options = XTwitterScraper::Models::XSearchPlacesParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "x/places/search",
          query: query,
          model: XTwitterScraper::Models::XSearchPlacesResponse,
          options: options
        )
      end

      # Returns the accounts, topics, hashtags & cashtags X suggests while someone types
      # a search. X may rank them differently per request. Costs 1 credit per
      # suggestion.
      #
      # @overload autocomplete_search(q:, types: nil, limit: nil, fields: nil, omit: nil, request_options: {})
      #
      # @param q [String] Text typed so far. Start with # for hashtags or $ for cashtags. A # query returns hashtags & the accounts X suggests for it. Its alias is query. Xquik's cap is 4,096 characters.
      #
      # @param types [String] Comma-separated suggestion types from users, topics, hashtags & cashtags. Omit for all. With only hashtags or only cashtags, a query without # or $ still works. Any case works. It allows 66 characters for every choice once with spaces around commas.
      #
      # @param limit [Integer] Most suggestions to return, from 1 to 100. Default 20. Accounts fill it first, then topics, hashtags & cashtags. A low credit balance can return fewer. Its aliases are pageSize, count, max_results, maxItems, max_items & per_page.
      #
      # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
      #
      # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::SearchSuggestions]
      #
      # @see XTwitterScraper::Models::XAutocompleteSearchParams
      def autocomplete_search(params)
        parsed, options = XTwitterScraper::Models::XAutocompleteSearchParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "x/search/autocomplete",
          query: query,
          model: XTwitterScraper::Models::SearchSuggestions,
          options: options
        )
      end

      # Returns the Twitter trends archive of a place, as the lists X showed there over
      # a range of time. Use it for trending on Twitter yesterday, last week or any day
      # since 2026-10-13 02:20 UTC. Xquik stores 1 list per place every 5 minutes and
      # keeps it for 25 months. Pick the place by woeid, country or location name, the
      # range with from & to, and the step with every. from & to take a time or a span
      # back from now, such as 7d, so a schedule can read the last day on every run.
      # Each step returns the first list stored in it, with its own time. Each returned
      # list costs 1 credit, so 24 lists cost 24 credits. A step with no stored list
      # returns none. Empty trend history steps are free. 1 request returns 24 lists, or
      # up to 100 with limit. Trends can be read for any past moment since the archive
      # began.
      #
      # @overload get_trends_history(woeid: nil, country: nil, location: nil, from: nil, to: nil, every: nil, count: nil, limit: nil, cursor: nil, fields: nil, omit: nil, request_options: {})
      #
      # @param woeid [Integer] WOEID of the place, such as 1 for Worldwide or 23424969 for Turkey. It wins over country & location. /x/trends/locations lists every WOEID.
      #
      # @param country [String] Country to read trends history for, by name or 2-letter code, such as Turkey or TR. Case insensitive. X can add places, so Xquik takes up to 280 characters, the most a post holds.
      #
      # @param location [String] Town or country to read trends history for, by name, such as Istanbul. Case insensitive. Add country when 2 towns share a name. /x/trends/locations lists every name. X can add places, so Xquik takes up to 280 characters, the most a post holds.
      #
      # @param from [String] Start of the range. Takes an ISO 8601 time, a date such as 2026-10-13, or Unix seconds. A time without a zone reads as UTC. It also takes a span back from now, as a number & s, m, h or d, so from=7d reads the last 7 days. Defaults to 24 hours before to. History starts 2026-10-13 02:20 UTC, and a range that begins earlier returns the stored part. A range that ends before the first stored list answers 404 at no charge. Alias sinceTime.
      #
      # @param to [String] End of the range, which it leaves out. Takes the forms of from, so from=2d with to=1d reads the day before the last 24 hours. Defaults to now. Alias untilTime.
      #
      # @param every [String] Step between 2 returned lists, as a number & m, h or d, such as 15m, 1h or 1d. A step under 5m returns every stored list.
      #
      # @param count [Integer] Trends to return in each list.
      #
      # @param limit [Integer] Maximum lists 1 request returns & charges. A wider range gives a next_cursor for the next lists. A low credit balance can return fewer.
      #
      # @param cursor [String] The next_cursor of the page before, for the next lists. It keeps the time of the first request, so a range of spans stays the same on every page.
      #
      # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
      #
      # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::XGetTrendsHistoryResponse]
      #
      # @see XTwitterScraper::Models::XGetTrendsHistoryParams
      def get_trends_history(params = {})
        parsed, options = XTwitterScraper::Models::XGetTrendsHistoryParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "x/trends/history",
          query: query,
          model: XTwitterScraper::Models::XGetTrendsHistoryResponse,
          options: options
        )
      end

      # Returns the places X offers trends for. Pass a location's woeid to /x/trends.
      # Each returned location costs 1 credit.
      #
      # @overload get_trend_locations(country: nil, place_type: nil, q: nil, limit: nil, fields: nil, omit: nil, request_options: {})
      #
      # @param country [String] Country name or 2-letter code, such as Turkey or TR. Case insensitive. Returns the country & its towns. X can add places, so Xquik takes up to 280 characters, the most a post holds.
      #
      # @param place_type [Symbol, XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType] Kind of place. Case insensitive. X labels a few towns unknown.
      #
      # @param q [String] Text the location name contains, such as york. Case insensitive. Alias query. X can add places, so Xquik takes up to 280 characters, the most a post holds.
      #
      # @param limit [Integer] Maximum locations to return. Omit it for every match. A low credit balance can return fewer. Aliases pageSize, count, max_results, maxItems, max_items & per_page.
      #
      # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
      #
      # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::XGetTrendLocationsResponse]
      #
      # @see XTwitterScraper::Models::XGetTrendLocationsParams
      def get_trend_locations(params = {})
        parsed, options = XTwitterScraper::Models::XGetTrendLocationsParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "x/trends/locations",
          query: query,
          model: XTwitterScraper::Models::XGetTrendLocationsResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [XTwitterScraper::Client]
      def initialize(client:)
        @client = client
        @write_actions = XTwitterScraper::Resources::X::WriteActions.new(client: client)
        @tweets = XTwitterScraper::Resources::X::Tweets.new(client: client)
        @users = XTwitterScraper::Resources::X::Users.new(client: client)
        @followers = XTwitterScraper::Resources::X::Followers.new(client: client)
        @dm = XTwitterScraper::Resources::X::Dm.new(client: client)
        @media = XTwitterScraper::Resources::X::Media.new(client: client)
        @profile = XTwitterScraper::Resources::X::Profile.new(client: client)
        @communities = XTwitterScraper::Resources::X::Communities.new(client: client)
        @accounts = XTwitterScraper::Resources::X::Accounts.new(client: client)
        @account_connection_challenges =
          XTwitterScraper::Resources::X::AccountConnectionChallenges.new(client: client)
        @account_connection_attempts =
          XTwitterScraper::Resources::X::AccountConnectionAttempts.new(client: client)
        @account_connection_links = XTwitterScraper::Resources::X::AccountConnectionLinks.new(client: client)
        @bookmarks = XTwitterScraper::Resources::X::Bookmarks.new(client: client)
        @lists = XTwitterScraper::Resources::X::Lists.new(client: client)
        @analysis = XTwitterScraper::Resources::X::Analysis.new(client: client)
        @broadcasts = XTwitterScraper::Resources::X::Broadcasts.new(client: client)
        @community_notes = XTwitterScraper::Resources::X::CommunityNotes.new(client: client)
        @jobs = XTwitterScraper::Resources::X::Jobs.new(client: client)
        @spaces = XTwitterScraper::Resources::X::Spaces.new(client: client)
        @sports = XTwitterScraper::Resources::X::Sports.new(client: client)
      end
    end
  end
end
