# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::RequestFieldsWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  BOOLEAN = XTwitterScraper::Internal::Type::Boolean
  PATH_ID = "id42"
  ROWS = [
    {
      op: "GET /api/v1/events",
      call: "events.list",
      params: XTwitterScraper::EventListParams,
      required: {},
      fields: {
        "postMonitorId" => String
      }
    },
    {
      op: "GET /api/v1/extractions/{id}",
      call: "extractions.retrieve",
      params: XTwitterScraper::ExtractionRetrieveParams,
      required: {},
      fields: {
        "wait" => Integer
      }
    },
    {
      op: "GET /api/v1/extractions/{id}/export",
      call: "extractions.export_results",
      params: XTwitterScraper::ExtractionExportResultsParams,
      required: {format_: :csv},
      fields: {
        "businessEmailOnly" => BOOLEAN,
        "compare" => String,
        "emailDomains" => String,
        "hasEmail" => BOOLEAN,
        "hasWebsite" => BOOLEAN,
        "hideFake" => BOOLEAN,
        "hideInactive" => BOOLEAN,
        "joinedSince" => Date,
        "joinedUntil" => Date,
        "location" => String
      }
    },
    {
      op: "GET /api/v1/monitors",
      call: "monitors.list",
      params: XTwitterScraper::MonitorListParams,
      required: {},
      fields: {
        "cursor" => String, "limit" => Integer
      }
    },
    {
      op: "GET /api/v1/monitors/keywords",
      call: "monitors.keywords.list",
      params: XTwitterScraper::Monitors::KeywordListParams,
      required: {},
      fields: {
        "cursor" => String, "limit" => Integer
      }
    },
    {
      op: "GET /api/v1/styles",
      call: "styles.list",
      params: XTwitterScraper::StyleListParams,
      required: {},
      fields: {
        "cursor" => String, "limit" => Integer
      }
    },
    {
      op: "GET /api/v1/support/tickets",
      call: "support.tickets.list",
      params: XTwitterScraper::Support::TicketListParams,
      required: {},
      fields: {
        "cursor" => String, "limit" => Integer
      }
    },
    {
      op: "GET /api/v1/trends",
      call: "trends.list",
      params: XTwitterScraper::TrendListParams,
      required: {},
      fields: {
        "fields" => String, "omit" => String
      }
    },
    {
      op: "GET /api/v1/webhooks",
      call: "webhooks.list",
      params: XTwitterScraper::WebhookListParams,
      required: {},
      fields: {
        "cursor" => String, "limit" => Integer
      }
    },
    {
      op: "GET /api/v1/webhooks/{id}/deliveries",
      call: "webhooks.list_deliveries",
      params: XTwitterScraper::WebhookListDeliveriesParams,
      required: {},
      fields: {
        "cursor" => String, "limit" => Integer
      }
    },
    {
      op: "GET /api/v1/x/accounts",
      call: "x.accounts.list",
      params: XTwitterScraper::X::AccountListParams,
      required: {},
      fields: {
        "cursor" => String, "limit" => Integer
      }
    },
    {
      op: "GET /api/v1/x/articles/{tweetId}",
      call: "x.get_article",
      params: XTwitterScraper::XGetArticleParams,
      required: {},
      fields: {
        "fields" => String, "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/bookmarks/folders",
      call: "x.bookmarks.retrieve_folders",
      params: XTwitterScraper::X::BookmarkRetrieveFoldersParams,
      required: {},
      fields: {
        "cursor" => String
      }
    },
    {
      op: "GET /api/v1/x/communities/search",
      call: "x.communities.retrieve_search",
      params: XTwitterScraper::X::CommunityRetrieveSearchParams,
      required: {community_id: "c1", q: "cats"},
      fields: {
        "anyWords" => String,
        "blueVerifiedOnly" => BOOLEAN,
        "cashtags" => String,
        "conversationId" => String,
        "exactPhrase" => String,
        "excludeWords" => String,
        "fields" => String,
        "fromUser" => String,
        "hashtags" => String,
        "inReplyToTweetId" => String,
        "language" => String,
        "maxFaves" => Integer,
        "maxId" => String,
        "maxQuotes" => Integer,
        "maxReplies" => Integer,
        "maxRetweets" => Integer,
        "mentioning" => String,
        "minBookmarks" => Integer,
        "minLikes" => Integer,
        "minQuotes" => Integer,
        "minReplies" => Integer,
        "minRetweets" => Integer,
        "minViews" => Integer,
        "nativeRetweets" => BOOLEAN,
        "omit" => String,
        "quotesOfTweetId" => String,
        "retweetsOfTweetId" => String,
        "sinceDate" => Date,
        "sinceId" => String,
        "toUser" => String,
        "untilDate" => Date,
        "url" => String,
        "verifiedOnly" => BOOLEAN,
        "withinTime" => String
      }
    },
    {
      op: "GET /api/v1/x/communities/tweets",
      call: "x.communities.tweets.list",
      params: XTwitterScraper::X::Communities::TweetListParams,
      required: {community_id: "c1", q: "cats"},
      fields: {
        "anyWords" => String,
        "blueVerifiedOnly" => BOOLEAN,
        "cashtags" => String,
        "conversationId" => String,
        "exactPhrase" => String,
        "excludeWords" => String,
        "fields" => String,
        "fromUser" => String,
        "hashtags" => String,
        "inReplyToTweetId" => String,
        "language" => String,
        "maxFaves" => Integer,
        "maxId" => String,
        "maxQuotes" => Integer,
        "maxReplies" => Integer,
        "maxRetweets" => Integer,
        "mentioning" => String,
        "minBookmarks" => Integer,
        "minLikes" => Integer,
        "minQuotes" => Integer,
        "minReplies" => Integer,
        "minRetweets" => Integer,
        "minViews" => Integer,
        "nativeRetweets" => BOOLEAN,
        "omit" => String,
        "quotesOfTweetId" => String,
        "retweetsOfTweetId" => String,
        "sinceDate" => Date,
        "sinceId" => String,
        "toUser" => String,
        "untilDate" => Date,
        "url" => String,
        "verifiedOnly" => BOOLEAN,
        "withinTime" => String
      }
    },
    {
      op: "GET /api/v1/x/communities/{id}/info",
      call: "x.communities.retrieve_info",
      params: XTwitterScraper::X::CommunityRetrieveInfoParams,
      required: {},
      fields: {
        "fields" => String, "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/communities/{id}/members",
      call: "x.communities.retrieve_members",
      params: XTwitterScraper::X::CommunityRetrieveMembersParams,
      required: {},
      fields: {
        "blueVerifiedOnly" => BOOLEAN,
        "businessEmailOnly" => BOOLEAN,
        "emailDomains" => String,
        "fields" => String,
        "hasEmail" => BOOLEAN,
        "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/communities/{id}/moderators",
      call: "x.communities.retrieve_moderators",
      params: XTwitterScraper::X::CommunityRetrieveModeratorsParams,
      required: {},
      fields: {
        "blueVerifiedOnly" => BOOLEAN,
        "businessEmailOnly" => BOOLEAN,
        "emailDomains" => String,
        "fields" => String,
        "hasEmail" => BOOLEAN,
        "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/communities/{id}/tweets",
      call: "x.communities.tweets.list_by_community",
      params: XTwitterScraper::X::Communities::TweetListByCommunityParams,
      required: {},
      fields: {
        "anyWords" => String,
        "blueVerifiedOnly" => BOOLEAN,
        "cashtags" => String,
        "conversationId" => String,
        "exactPhrase" => String,
        "excludeWords" => String,
        "fields" => String,
        "fromUser" => String,
        "hashtags" => String,
        "inReplyToTweetId" => String,
        "language" => String,
        "maxFaves" => Integer,
        "maxId" => String,
        "maxQuotes" => Integer,
        "maxReplies" => Integer,
        "maxRetweets" => Integer,
        "mentioning" => String,
        "minBookmarks" => Integer,
        "minLikes" => Integer,
        "minQuotes" => Integer,
        "minReplies" => Integer,
        "minRetweets" => Integer,
        "minViews" => Integer,
        "nativeRetweets" => BOOLEAN,
        "omit" => String,
        "quotesOfTweetId" => String,
        "retweetsOfTweetId" => String,
        "sinceDate" => Date,
        "sinceId" => String,
        "toUser" => String,
        "untilDate" => Date,
        "url" => String,
        "verifiedOnly" => BOOLEAN,
        "withinTime" => String
      }
    },
    {
      op: "GET /api/v1/x/followers/check",
      call: "x.followers.check",
      params: XTwitterScraper::X::FollowerCheckParams,
      required: {source: "a", target: "b"},
      fields: {
        "fields" => String, "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/lists/{id}/followers",
      call: "x.lists.retrieve_followers",
      params: XTwitterScraper::X::ListRetrieveFollowersParams,
      required: {},
      fields: {
        "after" => String,
        "blueVerifiedOnly" => BOOLEAN,
        "businessEmailOnly" => BOOLEAN,
        "emailDomains" => String,
        "fields" => String,
        "hasEmail" => BOOLEAN,
        "maxScan" => Integer,
        "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/lists/{id}/members",
      call: "x.lists.retrieve_members",
      params: XTwitterScraper::X::ListRetrieveMembersParams,
      required: {},
      fields: {
        "after" => String,
        "blueVerifiedOnly" => BOOLEAN,
        "businessEmailOnly" => BOOLEAN,
        "emailDomains" => String,
        "fields" => String,
        "hasEmail" => BOOLEAN,
        "maxScan" => Integer,
        "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/lists/{id}/tweets",
      call: "x.lists.retrieve_tweets",
      params: XTwitterScraper::X::ListRetrieveTweetsParams,
      required: {},
      fields: {
        "advancedQuery" => String,
        "after" => String,
        "anyWords" => String,
        "blueVerifiedOnly" => BOOLEAN,
        "boundingBox" => String,
        "cardName" => String,
        "cashtags" => String,
        "conversationId" => String,
        "exactPhrase" => String,
        "excludeSource" => String,
        "excludeWords" => String,
        "fields" => String,
        "fromUser" => String,
        "geocode" => String,
        "hashtags" => String,
        "inReplyToTweetId" => String,
        "keywords" => String,
        "language" => String,
        "maxFaves" => Integer,
        "maxId" => String,
        "maxQuotes" => Integer,
        "maxReplies" => Integer,
        "maxRetweets" => Integer,
        "mentioning" => String,
        "minBookmarks" => Integer,
        "minLikes" => Integer,
        "minQuotes" => Integer,
        "minReplies" => Integer,
        "minRetweets" => Integer,
        "minViews" => Integer,
        "nativeRetweets" => BOOLEAN,
        "near" => String,
        "news" => BOOLEAN,
        "omit" => String,
        "place" => String,
        "placeCountry" => String,
        "pointRadius" => String,
        "quotesOfTweetId" => String,
        "retweetsOfTweetId" => String,
        "safe" => BOOLEAN,
        "sinceDate" => Date,
        "sinceId" => String,
        "source" => String,
        "toUser" => String,
        "untilDate" => Date,
        "url" => String,
        "verifiedOnly" => BOOLEAN,
        "within" => String,
        "withinTime" => String
      }
    },
    {
      op: "GET /api/v1/x/trends",
      call: "x.get_trends",
      params: XTwitterScraper::XGetTrendsParams,
      required: {},
      fields: {
        "at" => String,
        "country" => String,
        "fields" => String,
        "location" => String,
        "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/tweets",
      call: "x.tweets.list",
      params: XTwitterScraper::X::TweetListParams,
      required: {ids: "1,2"},
      fields: {
        "fields" => String, "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/tweets/search",
      call: "x.tweets.search",
      params: XTwitterScraper::X::TweetSearchParams,
      required: {q: "cats"},
      fields: {
        "fields" => String,
        "imageShows" => String,
        "keywords" => String,
        "minLikes" => Integer,
        "omit" => String,
        "textOnlyTerms" => String,
        "topic" => String
      }
    },
    {
      op: "GET /api/v1/x/tweets/{id}",
      call: "x.tweets.retrieve",
      params: XTwitterScraper::X::TweetRetrieveParams,
      required: {},
      fields: {
        "fields" => String, "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/tweets/{id}/favoriters",
      call: "x.tweets.get_favoriters",
      params: XTwitterScraper::X::TweetGetFavoritersParams,
      required: {},
      fields: {
        "blueVerifiedOnly" => BOOLEAN,
        "businessEmailOnly" => BOOLEAN,
        "emailDomains" => String,
        "fields" => String,
        "hasEmail" => BOOLEAN,
        "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/tweets/{id}/quotes",
      call: "x.tweets.get_quotes",
      params: XTwitterScraper::X::TweetGetQuotesParams,
      required: {},
      fields: {
        "advancedQuery" => String,
        "boundingBox" => String,
        "fields" => String,
        "keywords" => String,
        "listId" => String,
        "minLikes" => Integer,
        "omit" => String,
        "place" => String,
        "placeCountry" => String,
        "pointRadius" => String
      }
    },
    {
      op: "GET /api/v1/x/tweets/{id}/replies",
      call: "x.tweets.get_replies",
      params: XTwitterScraper::X::TweetGetRepliesParams,
      required: {},
      fields: {
        "after" => String,
        "fields" => String,
        "includeHidden" => BOOLEAN,
        "minLikes" => Integer,
        "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/tweets/{id}/retweeters",
      call: "x.tweets.get_retweeters",
      params: XTwitterScraper::X::TweetGetRetweetersParams,
      required: {},
      fields: {
        "blueVerifiedOnly" => BOOLEAN,
        "businessEmailOnly" => BOOLEAN,
        "emailDomains" => String,
        "enrichProfiles" => BOOLEAN,
        "fields" => String,
        "hasEmail" => BOOLEAN,
        "includeRetweetTimestamp" => BOOLEAN,
        "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/tweets/{id}/thread",
      call: "x.tweets.get_thread",
      params: XTwitterScraper::X::TweetGetThreadParams,
      required: {},
      fields: {
        "fields" => String,
        "maxId" => String,
        "minLikes" => Integer,
        "nativeRetweets" => BOOLEAN,
        "omit" => String,
        "sinceId" => String,
        "withinTime" => String
      }
    },
    {
      op: "GET /api/v1/x/users/batch",
      call: "x.users.retrieve_batch",
      params: XTwitterScraper::X::UserRetrieveBatchParams,
      required: {ids: "1,2"},
      fields: {
        "bioContains" => String,
        "blueVerifiedOnly" => BOOLEAN,
        "businessEmailOnly" => BOOLEAN,
        "emailDomains" => String,
        "fields" => String,
        "hasEmail" => BOOLEAN,
        "hasLocation" => BOOLEAN,
        "hasWebsite" => BOOLEAN,
        "locationContains" => String,
        "maxFollowers" => Integer,
        "maxFollowing" => Integer,
        "maxStatuses" => Integer,
        "minAccountAgeDays" => Integer,
        "minFollowers" => Integer,
        "minFollowing" => Integer,
        "minStatuses" => Integer,
        "omit" => String,
        "usernameContains" => String,
        "usernames" => String,
        "verifiedOnly" => BOOLEAN,
        "verifiedType" => String
      }
    },
    {
      op: "GET /api/v1/x/users/search",
      call: "x.users.retrieve_search",
      params: XTwitterScraper::X::UserRetrieveSearchParams,
      required: {q: "cats"},
      fields: {
        "blueVerifiedOnly" => BOOLEAN,
        "businessEmailOnly" => BOOLEAN,
        "emailDomains" => String,
        "enrichProfiles" => BOOLEAN,
        "fields" => String,
        "hasEmail" => BOOLEAN,
        "omit" => String,
        "pageSize" => Integer
      }
    },
    {
      op: "GET /api/v1/x/users/{id}",
      call: "x.users.retrieve",
      params: XTwitterScraper::X::UserRetrieveParams,
      required: {},
      fields: {
        "fields" => String, "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/users/{id}/followers",
      call: "x.users.retrieve_followers",
      params: XTwitterScraper::X::UserRetrieveFollowersParams,
      required: {},
      fields: {
        "blueVerifiedOnly" => BOOLEAN,
        "businessEmailOnly" => BOOLEAN,
        "emailDomains" => String,
        "enrichProfiles" => BOOLEAN,
        "fields" => String,
        "hasEmail" => BOOLEAN,
        "maxScan" => Integer,
        "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/users/{id}/followers-you-know",
      call: "x.users.retrieve_followers_you_know",
      params: XTwitterScraper::X::UserRetrieveFollowersYouKnowParams,
      required: {},
      fields: {
        "blueVerifiedOnly" => BOOLEAN,
        "businessEmailOnly" => BOOLEAN,
        "emailDomains" => String,
        "fields" => String,
        "hasEmail" => BOOLEAN,
        "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/users/{id}/following",
      call: "x.users.retrieve_following",
      params: XTwitterScraper::X::UserRetrieveFollowingParams,
      required: {},
      fields: {
        "blueVerifiedOnly" => BOOLEAN,
        "businessEmailOnly" => BOOLEAN,
        "emailDomains" => String,
        "enrichProfiles" => BOOLEAN,
        "fields" => String,
        "hasEmail" => BOOLEAN,
        "maxScan" => Integer,
        "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/users/{id}/likes",
      call: "x.users.retrieve_likes",
      params: XTwitterScraper::X::UserRetrieveLikesParams,
      required: {},
      fields: {
        "fields" => String, "minLikes" => Integer, "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/users/{id}/media",
      call: "x.users.retrieve_media",
      params: XTwitterScraper::X::UserRetrieveMediaParams,
      required: {},
      fields: {
        "fields" => String,
        "imageShows" => String,
        "minLikes" => Integer,
        "omit" => String,
        "topic" => String
      }
    },
    {
      op: "GET /api/v1/x/users/{id}/mentions",
      call: "x.users.retrieve_mentions",
      params: XTwitterScraper::X::UserRetrieveMentionsParams,
      required: {},
      fields: {
        "fields" => String, "minLikes" => Integer, "omit" => String
      }
    },
    {
      op: "GET /api/v1/x/users/{id}/replies",
      call: "x.users.retrieve_replies",
      params: XTwitterScraper::X::UserRetrieveRepliesParams,
      required: {},
      fields: {
        "advancedQuery" => String,
        "boundingBox" => String,
        "fields" => String,
        "imageShows" => String,
        "keywords" => String,
        "listId" => String,
        "minLikes" => Integer,
        "omit" => String,
        "place" => String,
        "placeCountry" => String,
        "pointRadius" => String,
        "sinceTime" => String,
        "topic" => String,
        "untilTime" => String
      }
    },
    {
      op: "GET /api/v1/x/users/{id}/tweets",
      call: "x.users.retrieve_tweets",
      params: XTwitterScraper::X::UserRetrieveTweetsParams,
      required: {},
      fields: {
        "advancedQuery" => String,
        "boundingBox" => String,
        "fields" => String,
        "imageShows" => String,
        "keywords" => String,
        "listId" => String,
        "minLikes" => Integer,
        "omit" => String,
        "place" => String,
        "placeCountry" => String,
        "pointRadius" => String,
        "sinceTime" => String,
        "topic" => String,
        "untilTime" => String
      }
    },
    {
      op: "GET /api/v1/x/users/{id}/verified-followers",
      call: "x.users.retrieve_verified_followers",
      params: XTwitterScraper::X::UserRetrieveVerifiedFollowersParams,
      required: {},
      fields: {
        "blueVerifiedOnly" => BOOLEAN,
        "businessEmailOnly" => BOOLEAN,
        "emailDomains" => String,
        "enrichProfiles" => BOOLEAN,
        "fields" => String,
        "hasEmail" => BOOLEAN,
        "maxScan" => Integer,
        "omit" => String
      }
    }
  ].freeze

  def before_all
    super
    WebMock.enable!
  end

  def teardown
    WebMock.reset!
    super
  end

  def client
    XTwitterScraper::Client.new(
      base_url: "http://localhost",
      api_key: "My API Key",
      bearer_token: "My Bearer Token"
    )
  end

  def sample(type, index)
    value = {
      BOOLEAN => true,
      Integer => index + 1,
      Date => Date.new(2026, 11, 9) + index,
      String => "v#{index}"
    }
    value = value.fetch(type)
    [value, value.is_a?(Date) ? value.iso8601 : value.to_s]
  end

  def snake(wire) = wire.gsub(/([A-Z])/) { "_#{_1.downcase}" }.to_sym

  ROWS.each do |row|
    define_method("test_#{row.fetch(:call).tr('.', '_')}_names_and_sends_its_fields") do
      verb, path = row.fetch(:op).split
      path = path.delete_prefix("/api/v1").gsub(/\{\w+\}/, PATH_ID)
      values = row.fetch(:fields).each_with_index.to_h do |(wire, type), index|
        [wire, sample(type, index)]
      end
      kwargs = values.to_h { |wire, (value, _)| [snake(wire), value] }
      known = row.fetch(:params).fields

      row.fetch(:fields).each do |wire, type|
        assert_equal(type, known.dig(snake(wire), :type), "#{row.fetch(:op)} model names #{wire}")
      end
      model = row.fetch(:params).new(**row.fetch(:required), **kwargs)
      kwargs.each { |name, value| assert_equal(value, model.public_send(name)) }

      stub_request(:any, %r{\Ahttp://localhost/}).to_return_json(status: 200, body: {})
      resource = row.fetch(:call).split(".")[..-2].reduce(client) { _1.public_send(_2) }
      args = row.fetch(:op).include?("{") ? [PATH_ID] : []
      resource.public_send(row.fetch(:call).split(".").last, *args, **row.fetch(:required), **kwargs)

      sent = values.to_h { |wire, (_, encoded)| [wire, encoded] }
      assert_requested(verb.downcase.to_sym, "http://localhost#{path}", query: hash_including(sent))
      renamed = kwargs.keys.map(&:to_s) - sent.keys
      assert_requested(verb.downcase.to_sym, "http://localhost#{path}", query: hash_excluding(*renamed))
    end
  end
end
