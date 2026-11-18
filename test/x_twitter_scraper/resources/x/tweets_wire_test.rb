# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::XTweetsWireTest < Minitest::Test
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

  def test_resolve_links
    stub = stub_request(:get, "http://localhost/x/links/resolve").with(query: {"urls" => "urls", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::TweetResolveLinksResponse))

    response = client.x.tweets.resolve_links(urls: "urls", fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::TweetResolveLinksResponse, response)
  end

  def test_list_top
    stub = stub_request(:get, "http://localhost/x/tweets/top").with(query: {"metric" => "likes", "window" => "day", "country" => "country", "language" => "language", "cursor" => "cursor", "pageSize" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedTweets))

    response = client.x.tweets.list_top(
      metric: :likes,
      window: :day,
      country: "country",
      language: "language",
      cursor: "cursor",
      page_size: 1,
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedTweets, response)
  end

  def test_embed
    stub = stub_request(:get, "http://localhost/x/tweets/id/embed").with(query: {"theme" => "light", "hideMedia" => "true", "hideThread" => "true", "omitScript" => "true", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::TweetEmbedResponse))

    response = client.x.tweets.embed(
      "id",
      theme: :light,
      hide_media: true,
      hide_thread: true,
      omit_script: true,
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::TweetEmbedResponse, response)
  end

  def test_get_hidden_replies
    stub = stub_request(:get, "http://localhost/x/tweets/id/hidden-replies").with(query: {"cursor" => "cursor", "pageSize" => "1", "fromUser" => "from_user", "toUser" => "to_user", "mentioning" => "mentioning", "language" => "language", "sinceDate" => "2026-01-02", "untilDate" => "2026-01-02", "mediaType" => "images", "minLikes" => "1", "minRetweets" => "1", "minReplies" => "1", "minQuotes" => "1", "minViews" => "1", "minBookmarks" => "1", "maxFaves" => "1", "maxRetweets" => "1", "maxReplies" => "1", "maxQuotes" => "1", "blueVerifiedOnly" => "true", "sinceId" => "since_id", "maxId" => "max_id", "withinTime" => "within_time", "nativeRetweets" => "true", "verifiedOnly" => "true", "replies" => "include", "retweets" => "include", "quotes" => "include", "exactPhrase" => "exact_phrase", "excludeWords" => "exclude_words", "anyWords" => "any_words", "hashtags" => "hashtags", "cashtags" => "cashtags", "url" => "url", "conversationId" => "conversation_id", "inReplyToTweetId" => "in_reply_to_tweet_id", "quotesOfTweetId" => "quotes_of_tweet_id", "retweetsOfTweetId" => "retweets_of_tweet_id", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedTweets))

    response = client.x.tweets.get_hidden_replies(
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

  def test_get_insights
    stub = stub_request(:get, "http://localhost/x/tweets/id/insights").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::TweetGetInsightsResponse))

    response = client.x.tweets.get_insights("id", fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::TweetGetInsightsResponse, response)
  end

  def test_get_retweeter_ids
    stub = stub_request(:get, "http://localhost/x/tweets/id/retweeter-ids").with(query: {"cursor" => "cursor", "pageSize" => "1"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedUserIds))

    response = client.x.tweets.get_retweeter_ids("id", cursor: "cursor", page_size: 1)

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedUserIds, response)
  end

  def test_check_repost
    stub = stub_request(:get, "http://localhost/x/tweets/id/retweeters/check").with(query: {"user" => "user", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::TweetCheckRepostResponse))

    response = client.x.tweets.check_repost("id", user: "user", fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::TweetCheckRepostResponse, response)
  end

  def test_get_subtitles
    stub = stub_request(:get, "http://localhost/x/tweets/id/subtitles").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::TweetGetSubtitlesResponse))

    response = client.x.tweets.get_subtitles("id", fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::TweetGetSubtitlesResponse, response)
  end

  def test_translate
    stub = stub_request(:get, "http://localhost/x/tweets/id/translation").with(query: {"language" => "language", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::TweetTranslateResponse))

    response = client.x.tweets.translate("id", language: "language", fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::TweetTranslateResponse, response)
  end
end
