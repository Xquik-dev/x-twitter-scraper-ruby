# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      # X write actions (tweets, likes, follows, DMs)
      sig { returns(XTwitterScraper::Resources::X::WriteActions) }
      attr_reader :write_actions

      sig { returns(XTwitterScraper::Resources::X::Tweets) }
      attr_reader :tweets

      sig { returns(XTwitterScraper::Resources::X::Users) }
      attr_reader :users

      # Look up, search, and explore user profiles and relationships
      sig { returns(XTwitterScraper::Resources::X::Followers) }
      attr_reader :followers

      sig { returns(XTwitterScraper::Resources::X::Dm) }
      attr_reader :dm

      sig { returns(XTwitterScraper::Resources::X::Media) }
      attr_reader :media

      # X write actions (tweets, likes, follows, DMs)
      sig { returns(XTwitterScraper::Resources::X::Profile) }
      attr_reader :profile

      sig { returns(XTwitterScraper::Resources::X::Communities) }
      attr_reader :communities

      # Connected X account management
      sig { returns(XTwitterScraper::Resources::X::Accounts) }
      attr_reader :accounts

      # Connected X account management
      sig do
        returns(XTwitterScraper::Resources::X::AccountConnectionChallenges)
      end
      attr_reader :account_connection_challenges

      # Connected X account management
      sig { returns(XTwitterScraper::Resources::X::AccountConnectionAttempts) }
      attr_reader :account_connection_attempts

      # Connected X account management
      sig { returns(XTwitterScraper::Resources::X::AccountConnectionLinks) }
      attr_reader :account_connection_links

      # Look up, search, and analyze individual tweets
      sig { returns(XTwitterScraper::Resources::X::Bookmarks) }
      attr_reader :bookmarks

      # X List followers, members, and tweets
      sig { returns(XTwitterScraper::Resources::X::Lists) }
      attr_reader :lists

      # AI analysis of posts, at 2 credits per analyzed post
      sig { returns(XTwitterScraper::Resources::X::Analysis) }
      attr_reader :analysis

      sig { returns(XTwitterScraper::Resources::X::Broadcasts) }
      attr_reader :broadcasts

      sig { returns(XTwitterScraper::Resources::X::CommunityNotes) }
      attr_reader :community_notes

      sig { returns(XTwitterScraper::Resources::X::Jobs) }
      attr_reader :jobs

      sig { returns(XTwitterScraper::Resources::X::Spaces) }
      attr_reader :spaces

      sig { returns(XTwitterScraper::Resources::X::Sports) }
      attr_reader :sports

      # Retrieve the full content of an X Article (long-form post) by numeric tweet ID.
      # Returns article_not_found when the tweet is valid but is not an X Article.
      sig do
        params(
          tweet_id: String,
          fields: String,
          omit: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XGetArticleResponse)
      end
      def get_article(
        # Numeric tweet ID of the article, 15-20 digits. If you have a tweet URL, use the
        # final status ID.
        tweet_id,
        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        fields: nil,
        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        omit: nil,
        request_options: {}
      )
      end

      # Get home timeline
      sig do
        params(
          cursor: String,
          seen_tweet_ids: String,
          page_size: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::PaginatedTweets)
      end
      def get_home_timeline(
        # Pagination cursor for timeline
        cursor: nil,
        # Comma-separated tweet IDs to exclude from results. Empty entries are ignored.
        seen_tweet_ids: nil,
        # Items per page, 1 to 100, default 20. Source, filters or credits can return fewer. Follow next_cursor for more pages.
        page_size: nil,
        request_options: {}
      )
      end

      # Get notifications
      sig do
        params(
          cursor: String,
          type: XTwitterScraper::XGetNotificationsParams::Type::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XGetNotificationsResponse)
      end
      def get_notifications(
        # Pagination cursor for notifications
        cursor: nil,
        # Notification type filter. Unrecognized values fall back to All.
        type: nil,
        request_options: {}
      )
      end

      # Get trending hashtags & topics from X by region
      sig do
        params(
          at: String,
          count: Integer,
          country: String,
          fields: String,
          location: String,
          omit: String,
          woeid: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XGetTrendsResponse)
      end
      def get_trends(
        # A past time, to read what was trending on Twitter then. Takes an ISO 8601 time,
        # a date such as 2026-10-13, or Unix seconds. A time without a zone reads as UTC.
        # It also takes a span back from now, as a number & s, m, h or d. So at=24h reads
        # what was trending on Twitter yesterday at this hour, on every run of a schedule.
        # The answer is the stored list nearest that time, with its own time in
        # capturedAt. History starts 2026-10-13 02:20 UTC. A time over 24 hours from every
        # stored list answers 400 at no charge.
        at: nil,
        # Number of trending topics to return (1-50, default 30)
        count: nil,
        # Country to read trends for, by name or 2-letter code, such as Turkey or TR. Case
        # insensitive. X can add places, so Xquik takes up to 280 characters, the most a
        # post holds.
        country: nil,
        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        fields: nil,
        # Town or country to read trends for, by name, such as Istanbul. Case insensitive.
        # Add country when 2 towns share a name. /x/trends/locations lists every name. X
        # can add places, so Xquik takes up to 280 characters, the most a post holds.
        location: nil,
        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        omit: nil,
        # Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
        woeid: nil,
        request_options: {}
      )
      end

      # Returns X's hashflags, the custom emoji X shows after some hashtags. Lists the
      # ones running now unless activeOnly is false. Each returned hashflag costs 1
      # credit.
      sig do
        params(
          q: String,
          active_only: T::Boolean,
          limit: Integer,
          fields: String,
          omit: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XGetHashflagsResponse)
      end
      def get_hashflags(
        # Text the hashtag contains, such as football. Case insensitive. A leading hash
        # sign is ignored. Alias query. A post holds at most 280 characters.
        q: nil,
        # Keeps hashflags that run now. Send false to add ended & upcoming ones.
        active_only: nil,
        # Maximum hashflags to return. Omit it for every match. A low credit balance can
        # return fewer. Aliases pageSize, count, max_results, maxItems, max_items &
        # per_page.
        limit: nil,
        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        fields: nil,
        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        omit: nil,
        request_options: {}
      )
      end

      # Returns each version X wrote of 1 AI news story. Each version has its time,
      # headline & text, oldest first, so you can see how the story changed. Each
      # request costs 1 credit.
      sig do
        params(
          id: String,
          fields: String,
          omit: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XGetNewsStoryVersionsResponse)
      end
      def get_news_story_versions(
        # X news story ID, or the URL-encoded story link, such as
        # x.com/i/trending/2110209733533598095.
        id,
        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        fields: nil,
        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        omit: nil,
        request_options: {}
      )
      end

      # Finds places on X by name. Pass a place's id as place to /x/tweets/search to
      # read posts tagged there. X ranks the places, so their order can differ between
      # requests. Each returned place costs 1 credit. Place searches work with names in
      # 6 languages.
      sig do
        params(
          q: String,
          limit: Integer,
          fields: String,
          omit: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XSearchPlacesResponse)
      end
      def search_places(
        # Place name to search for, such as istanbul. Alias query. Xquik's cap is 4,096
        # characters.
        q:,
        # Maximum places to return. Omit it for every place X finds. A low credit balance
        # can return fewer. Aliases pageSize, count, max_results, maxItems, max_items &
        # per_page.
        limit: nil,
        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        fields: nil,
        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        omit: nil,
        request_options: {}
      )
      end

      # Returns the accounts, topics, hashtags & cashtags X suggests while someone types
      # a search. X may rank them differently per request. Costs 1 credit per
      # suggestion.
      sig do
        params(
          q: String,
          types: String,
          limit: Integer,
          fields: String,
          omit: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::SearchSuggestions)
      end
      def autocomplete_search(
        # Text typed so far. Start with # for hashtags or $ for cashtags. A # query
        # returns hashtags & the accounts X suggests for it. Its alias is query. Xquik's
        # cap is 4,096 characters.
        q:,
        # Comma-separated suggestion types from users, topics, hashtags & cashtags. Omit
        # for all. With only hashtags or only cashtags, a query without # or $ still
        # works. Any case works. It allows 66 characters for every choice once with spaces
        # around commas.
        types: nil,
        # Most suggestions to return, from 1 to 100. Default 20. Accounts fill it first,
        # then topics, hashtags & cashtags. A low credit balance can return fewer. Its
        # aliases are pageSize, count, max_results, maxItems, max_items & per_page.
        limit: nil,
        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        fields: nil,
        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        omit: nil,
        request_options: {}
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
      sig do
        params(
          woeid: Integer,
          country: String,
          location: String,
          from: String,
          to: String,
          every: String,
          count: Integer,
          limit: Integer,
          cursor: String,
          fields: String,
          omit: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XGetTrendsHistoryResponse)
      end
      def get_trends_history(
        # WOEID of the place, such as 1 for Worldwide or 23424969 for Turkey. It wins over
        # country & location. /x/trends/locations lists every WOEID.
        woeid: nil,
        # Country to read trends history for, by name or 2-letter code, such as Turkey or
        # TR. Case insensitive. X can add places, so Xquik takes up to 280 characters, the
        # most a post holds.
        country: nil,
        # Town or country to read trends history for, by name, such as Istanbul. Case
        # insensitive. Add country when 2 towns share a name. /x/trends/locations lists
        # every name. X can add places, so Xquik takes up to 280 characters, the most a
        # post holds.
        location: nil,
        # Start of the range. Takes an ISO 8601 time, a date such as 2026-10-13, or Unix
        # seconds. A time without a zone reads as UTC. It also takes a span back from now,
        # as a number & s, m, h or d, so from=7d reads the last 7 days. Defaults to 24
        # hours before to. History starts 2026-10-13 02:20 UTC, and a range that begins
        # earlier returns the stored part. A range that ends before the first stored list
        # answers 404 at no charge. Alias sinceTime.
        from: nil,
        # End of the range, which it leaves out. Takes the forms of from, so from=2d with
        # to=1d reads the day before the last 24 hours. Defaults to now. Alias untilTime.
        to: nil,
        # Step between 2 returned lists, as a number & m, h or d, such as 15m, 1h or 1d. A
        # step under 5m returns every stored list.
        every: nil,
        # Trends to return in each list.
        count: nil,
        # Maximum lists 1 request returns & charges. A wider range gives a next_cursor for
        # the next lists. A low credit balance can return fewer.
        limit: nil,
        # The next_cursor of the page before, for the next lists. It keeps the time of the
        # first request, so a range of spans stays the same on every page.
        cursor: nil,
        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        fields: nil,
        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        omit: nil,
        request_options: {}
      )
      end

      # Returns the places X offers trends for. Pass a location's woeid to /x/trends.
      # Each returned location costs 1 credit.
      sig do
        params(
          country: String,
          place_type:
            XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType::OrSymbol,
          q: String,
          limit: Integer,
          fields: String,
          omit: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XGetTrendLocationsResponse)
      end
      def get_trend_locations(
        # Country name or 2-letter code, such as Turkey or TR. Case insensitive. Returns
        # the country & its towns. X can add places, so Xquik takes up to 280 characters,
        # the most a post holds.
        country: nil,
        # Kind of place. Case insensitive. X labels a few towns unknown.
        place_type: nil,
        # Text the location name contains, such as york. Case insensitive. Alias query. X
        # can add places, so Xquik takes up to 280 characters, the most a post holds.
        q: nil,
        # Maximum locations to return. Omit it for every match. A low credit balance can
        # return fewer. Aliases pageSize, count, max_results, maxItems, max_items &
        # per_page.
        limit: nil,
        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        fields: nil,
        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        omit: nil,
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
