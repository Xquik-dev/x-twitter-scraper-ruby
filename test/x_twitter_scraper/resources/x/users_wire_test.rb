# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::XUsersWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

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
      bearer_token: "My Bearer Token",
      max_retries: 0
    )
  end

  def test_retrieve_batch_tweets
    stub = stub_request(:get, "http://localhost/x/users/batch/tweets").with(query: {"ids" => "ids", "usernames" => "usernames", "pageSize" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::BatchUserTweets))

    response = client.x.users.retrieve_batch_tweets(
      ids: "ids",
      usernames: "usernames",
      page_size: 1,
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::BatchUserTweets, response)
  end

  def test_retrieve_affiliates
    stub = stub_request(:get, "http://localhost/x/users/id/affiliates").with(query: {"cursor" => "cursor", "pageSize" => "1", "minFollowers" => "1", "maxFollowers" => "1", "minFollowing" => "1", "maxFollowing" => "1", "minStatuses" => "1", "maxStatuses" => "1", "minAccountAgeDays" => "1", "verifiedOnly" => "true", "blueVerifiedOnly" => "true", "verifiedType" => "verified_type", "hasWebsite" => "true", "hasLocation" => "true", "hasEmail" => "true", "businessEmailOnly" => "true", "emailDomains" => "email_domains", "bioContains" => "bio_contains", "locationContains" => "location_contains", "usernameContains" => "username_contains", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedUsers))

    response = client.x.users.retrieve_affiliates(
      "id",
      cursor: "cursor",
      page_size: 1,
      min_followers: 1,
      max_followers: 1,
      min_following: 1,
      max_following: 1,
      min_statuses: 1,
      max_statuses: 1,
      min_account_age_days: 1,
      verified_only: true,
      blue_verified_only: true,
      verified_type: "verified_type",
      has_website: true,
      has_location: true,
      has_email: true,
      business_email_only: true,
      email_domains: "email_domains",
      bio_contains: "bio_contains",
      location_contains: "location_contains",
      username_contains: "username_contains",
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedUsers, response)
  end

  def test_retrieve_articles
    stub = stub_request(:get, "http://localhost/x/users/id/articles").with(query: {"cursor" => "cursor", "pageSize" => "1", "fromUser" => "from_user", "toUser" => "to_user", "mentioning" => "mentioning", "language" => "language", "sinceDate" => "2026-01-02", "untilDate" => "2026-01-02", "mediaType" => "images", "minLikes" => "1", "minRetweets" => "1", "minReplies" => "1", "minQuotes" => "1", "minViews" => "1", "minBookmarks" => "1", "maxFaves" => "1", "maxRetweets" => "1", "maxReplies" => "1", "maxQuotes" => "1", "blueVerifiedOnly" => "true", "sinceId" => "since_id", "maxId" => "max_id", "withinTime" => "within_time", "nativeRetweets" => "true", "verifiedOnly" => "true", "replies" => "include", "retweets" => "include", "quotes" => "include", "exactPhrase" => "exact_phrase", "excludeWords" => "exclude_words", "anyWords" => "any_words", "hashtags" => "hashtags", "cashtags" => "cashtags", "url" => "url", "conversationId" => "conversation_id", "inReplyToTweetId" => "in_reply_to_tweet_id", "quotesOfTweetId" => "quotes_of_tweet_id", "retweetsOfTweetId" => "retweets_of_tweet_id", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedTweets))

    response = client.x.users.retrieve_articles(
      "id",
      cursor: "cursor",
      page_size: 1,
      from_user: "from_user",
      to_user: "to_user",
      mentioning: "mentioning",
      language: "language",
      since_date: Date.new(2026, 1, 2),
      until_date: Date.new(2026, 1, 2),
      media_type: :images,
      min_likes: 1,
      min_retweets: 1,
      min_replies: 1,
      min_quotes: 1,
      min_views: 1,
      min_bookmarks: 1,
      max_faves: 1,
      max_retweets: 1,
      max_replies: 1,
      max_quotes: 1,
      blue_verified_only: true,
      since_id: "since_id",
      max_id: "max_id",
      within_time: "within_time",
      native_retweets: true,
      verified_only: true,
      replies: :include,
      retweets: :include,
      quotes: :include,
      exact_phrase: "exact_phrase",
      exclude_words: "exclude_words",
      any_words: "any_words",
      hashtags: "hashtags",
      cashtags: "cashtags",
      url: "url",
      conversation_id: "conversation_id",
      in_reply_to_tweet_id: "in_reply_to_tweet_id",
      quotes_of_tweet_id: "quotes_of_tweet_id",
      retweets_of_tweet_id: "retweets_of_tweet_id",
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedTweets, response)
  end

  def test_retrieve_follower_audit
    stub = stub_request(:get, "http://localhost/x/users/id/follower-audit").with(query: {"limit" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::UserRetrieveFollowerAuditResponse))

    response = client.x.users.retrieve_follower_audit("id", limit: 1, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::UserRetrieveFollowerAuditResponse, response)
  end

  def test_retrieve_follower_ids
    stub = stub_request(:get, "http://localhost/x/users/id/follower-ids").with(query: {"cursor" => "cursor", "pageSize" => "1"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedUserIds))

    response = client.x.users.retrieve_follower_ids("id", cursor: "cursor", page_size: 1)

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedUserIds, response)
  end

  def test_retrieve_following_ids
    stub = stub_request(:get, "http://localhost/x/users/id/following-ids").with(query: {"cursor" => "cursor", "pageSize" => "1"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedUserIds))

    response = client.x.users.retrieve_following_ids("id", cursor: "cursor", page_size: 1)

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedUserIds, response)
  end

  def test_retrieve_highlights
    stub = stub_request(:get, "http://localhost/x/users/id/highlights").with(query: {"cursor" => "cursor", "pageSize" => "1", "fromUser" => "from_user", "toUser" => "to_user", "mentioning" => "mentioning", "language" => "language", "sinceDate" => "2026-01-02", "untilDate" => "2026-01-02", "mediaType" => "images", "minLikes" => "1", "minRetweets" => "1", "minReplies" => "1", "minQuotes" => "1", "minViews" => "1", "minBookmarks" => "1", "maxFaves" => "1", "maxRetweets" => "1", "maxReplies" => "1", "maxQuotes" => "1", "blueVerifiedOnly" => "true", "sinceId" => "since_id", "maxId" => "max_id", "withinTime" => "within_time", "nativeRetweets" => "true", "verifiedOnly" => "true", "replies" => "include", "retweets" => "include", "quotes" => "include", "exactPhrase" => "exact_phrase", "excludeWords" => "exclude_words", "anyWords" => "any_words", "hashtags" => "hashtags", "cashtags" => "cashtags", "url" => "url", "conversationId" => "conversation_id", "inReplyToTweetId" => "in_reply_to_tweet_id", "quotesOfTweetId" => "quotes_of_tweet_id", "retweetsOfTweetId" => "retweets_of_tweet_id", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedTweets))

    response = client.x.users.retrieve_highlights(
      "id",
      cursor: "cursor",
      page_size: 1,
      from_user: "from_user",
      to_user: "to_user",
      mentioning: "mentioning",
      language: "language",
      since_date: Date.new(2026, 1, 2),
      until_date: Date.new(2026, 1, 2),
      media_type: :images,
      min_likes: 1,
      min_retweets: 1,
      min_replies: 1,
      min_quotes: 1,
      min_views: 1,
      min_bookmarks: 1,
      max_faves: 1,
      max_retweets: 1,
      max_replies: 1,
      max_quotes: 1,
      blue_verified_only: true,
      since_id: "since_id",
      max_id: "max_id",
      within_time: "within_time",
      native_retweets: true,
      verified_only: true,
      replies: :include,
      retweets: :include,
      quotes: :include,
      exact_phrase: "exact_phrase",
      exclude_words: "exclude_words",
      any_words: "any_words",
      hashtags: "hashtags",
      cashtags: "cashtags",
      url: "url",
      conversation_id: "conversation_id",
      in_reply_to_tweet_id: "in_reply_to_tweet_id",
      quotes_of_tweet_id: "quotes_of_tweet_id",
      retweets_of_tweet_id: "retweets_of_tweet_id",
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedTweets, response)
  end

  def test_retrieve_insights
    stub = stub_request(:get, "http://localhost/x/users/id/insights").with(query: {"limit" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::UserRetrieveInsightsResponse))

    response = client.x.users.retrieve_insights("id", limit: 1, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::UserRetrieveInsightsResponse, response)
  end

  def test_retrieve_list_memberships
    stub = stub_request(:get, "http://localhost/x/users/id/list-memberships").with(query: {"cursor" => "cursor", "pageSize" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedLists))

    response = client.x.users.retrieve_list_memberships(
      "id",
      cursor: "cursor",
      page_size: 1,
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedLists, response)
  end

  def test_retrieve_lists
    stub = stub_request(:get, "http://localhost/x/users/id/lists").with(query: {"cursor" => "cursor", "pageSize" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedLists))

    response = client.x.users.retrieve_lists(
      "id",
      cursor: "cursor",
      page_size: 1,
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedLists, response)
  end

  def test_retrieve_live
    stub = stub_request(:get, "http://localhost/x/users/id/live").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::UserLiveStatus))

    response = client.x.users.retrieve_live("id", fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::UserLiveStatus, response)
  end

  def test_retrieve_shadowban
    stub = stub_request(:get, "http://localhost/x/users/id/shadowban").with(query: {"limit" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::ShadowbanReport))

    response = client.x.users.retrieve_shadowban("id", limit: 1, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::ShadowbanReport, response)
  end

  def test_retrieve_similar
    stub = stub_request(:get, "http://localhost/x/users/id/similar").with(query: {"cursor" => "cursor", "pageSize" => "1", "minFollowers" => "1", "maxFollowers" => "1", "minFollowing" => "1", "maxFollowing" => "1", "minStatuses" => "1", "maxStatuses" => "1", "minAccountAgeDays" => "1", "verifiedOnly" => "true", "blueVerifiedOnly" => "true", "verifiedType" => "verified_type", "hasWebsite" => "true", "hasLocation" => "true", "hasEmail" => "true", "businessEmailOnly" => "true", "emailDomains" => "email_domains", "bioContains" => "bio_contains", "locationContains" => "location_contains", "usernameContains" => "username_contains", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedUsers))

    response = client.x.users.retrieve_similar(
      "id",
      cursor: "cursor",
      page_size: 1,
      min_followers: 1,
      max_followers: 1,
      min_following: 1,
      max_following: 1,
      min_statuses: 1,
      max_statuses: 1,
      min_account_age_days: 1,
      verified_only: true,
      blue_verified_only: true,
      verified_type: "verified_type",
      has_website: true,
      has_location: true,
      has_email: true,
      business_email_only: true,
      email_domains: "email_domains",
      bio_contains: "bio_contains",
      location_contains: "location_contains",
      username_contains: "username_contains",
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedUsers, response)
  end

  def test_retrieve_subscriptions
    stub = stub_request(:get, "http://localhost/x/users/id/subscriptions").with(query: {"cursor" => "cursor", "pageSize" => "1", "minFollowers" => "1", "maxFollowers" => "1", "minFollowing" => "1", "maxFollowing" => "1", "minStatuses" => "1", "maxStatuses" => "1", "minAccountAgeDays" => "1", "verifiedOnly" => "true", "blueVerifiedOnly" => "true", "verifiedType" => "verified_type", "hasWebsite" => "true", "hasLocation" => "true", "hasEmail" => "true", "businessEmailOnly" => "true", "emailDomains" => "email_domains", "bioContains" => "bio_contains", "locationContains" => "location_contains", "usernameContains" => "username_contains", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedUsers))

    response = client.x.users.retrieve_subscriptions(
      "id",
      cursor: "cursor",
      page_size: 1,
      min_followers: 1,
      max_followers: 1,
      min_following: 1,
      max_following: 1,
      min_statuses: 1,
      max_statuses: 1,
      min_account_age_days: 1,
      verified_only: true,
      blue_verified_only: true,
      verified_type: "verified_type",
      has_website: true,
      has_location: true,
      has_email: true,
      business_email_only: true,
      email_domains: "email_domains",
      bio_contains: "bio_contains",
      location_contains: "location_contains",
      username_contains: "username_contains",
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedUsers, response)
  end

  def test_translate_bio
    stub = stub_request(:get, "http://localhost/x/users/id/translation").with(query: {"language" => "language", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::UserTranslateBioResponse))

    response = client.x.users.translate_bio("id", language: "language", fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::UserTranslateBioResponse, response)
  end
end
