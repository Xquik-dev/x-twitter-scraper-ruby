# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::AnalysisWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  ROUTES = {
    brand: "brand",
    classify: "classify",
    market_signals: "market-signals",
    news: "news",
    sentiment: "sentiment",
    viral_score: "viral-score"
  }.freeze

  TOPIC = "the Rust programming language"
  IMAGE_SHOWS = "charts"

  CHANGE = {questionId: "sentiment", previous: "neutral", current: "positive"}.freeze

  RESULT = {
    tweet: {
      id: "2102882545427714266",
      text: "Rust 2027 ships today",
      bookmarkCount: 1,
      likeCount: 40,
      quoteCount: 2,
      replyCount: 3,
      retweetCount: 5,
      viewCount: 900
    },
    analysis: {
      status: "succeeded",
      answers: [
        {
          questionId: "sentiment",
          questionVersion: "1",
          type: "choice",
          value: "positive",
          confidence: 0.92,
          probabilities: {positive: 0.92, neutral: 0.05, negative: 0.03}
        },
        {questionId: "intensity", questionVersion: "1", type: "score", value: 1.4, levels: %w[low mid high]},
        {questionId: "sarcasm", questionVersion: "1", type: "probability", probability: 0.04}
      ],
      questions: [{id: "sentiment", version: "1"}],
      contextBytes: 812,
      contextAvailability: {
        quote: "not_applicable",
        reply: "missing",
        author: "available",
        media: "images",
        article: "not_supplied",
        postText: "truncated"
      }
    },
    answers: {sentiment: "positive", intensity: 1.4, sarcasm: 0.04},
    sourceDomains: ["blog.rust-lang.org"],
    cashtags: ["$RUST"],
    viralScore: nil,
    viralVerdict: "edit_first",
    viralAlgorithmScore: 12.5,
    viralActualEngagementRate: nil,
    viral: {weightsVersion: "1"},
    monitor: {
      configurationFingerprint: "9f2c4e1b",
      baselineDatasetId: nil,
      status: "changed",
      changedQuestionIds: ["sentiment"],
      changes: [CHANGE]
    }
  }.freeze

  PAGE = {
    results: [RESULT],
    unanalyzed: [{id: "text:2", status: "skipped", reason: "missing_text"}],
    analysisSummary: {
      schemaVersion: 1,
      rows: {analyzed: 1, failed: 0, skipped: 1},
      engagement: 50,
      questions: {sentiment: {counts: {positive: 1}}},
      targets: [{name: "Rust", mentions: 1, share: 1.0, engagement: 50, choices: {}, top: {}}],
      cashtags: [{cashtag: "$RUST", rows: 1, choices: {}, signal: {bullish: 1, bearish: 0, score: 1.0}}],
      sourceDomains: [{domain: "blog.rust-lang.org", posts: 1}],
      monitor: {statuses: {changed: 1}, changedRows: [{tweetId: "2102882545427714266", changes: [CHANGE]}]}
    },
    has_next_page: true,
    next_cursor: "DAACCgACGRElMJcAAA",
    topicFilter: {
      topic: TOPIC,
      question: "Is this post about #{TOPIC}?",
      cutoff: 0.5,
      checked: 3,
      kept: 1,
      unchecked: [{id: "2102882545427714267", reason: "no_text"}]
    },
    imageFilter: {
      imageShows: IMAGE_SHOWS,
      question: "Do this post's photos show #{IMAGE_SHOWS}?",
      cutoff: 0.5,
      checked: 2,
      kept: 1,
      unchecked: [{id: "2102882545427714268", reason: "no_safe_photo"}]
    }
  }.freeze

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

  ROUTES.each do |method, route|
    define_method(:"test_#{method}_sends_topic_and_image_shows_and_reads_both_filters") do
      assert_route_sends_both_inputs_and_reads_both_filters(method, route)
    end
  end

  def assert_route_sends_both_inputs_and_reads_both_filters(method, route)
    url = "http://localhost/x/analysis/#{route}"
    stub_request(:post, url).to_return_json(body: PAGE)

    page = client.x.analysis.public_send(
      method,
      query: "rust lang:en",
      topic: TOPIC,
      image_shows: IMAGE_SHOWS
    )

    assert_requested(:post, url, body: {query: "rust lang:en", topic: TOPIC, imageShows: IMAGE_SHOWS})
    assert_instance_of(XTwitterScraper::Models::TweetAnalysisPage, page)
    assert_filter(XTwitterScraper::Models::TopicFilterSummary, [TOPIC, 3, "no_text"], page.topic_filter, :topic)
    assert_filter(
      XTwitterScraper::Models::ImageFilterSummary,
      [IMAGE_SHOWS, 2, "no_safe_photo"],
      page.image_filter,
      :image_shows
    )
  end

  def assert_filter(type, (asked, checked, reason), filter, input)
    assert_instance_of(type, filter)
    assert_equal(
      [asked, 0.5, checked, 1, reason],
      [
        filter.public_send(input),
        filter.cutoff,
        filter.checked,
        filter.kept,
        filter.unchecked.first.reason
      ]
    )
  end

  def test_settings_and_baseline_are_sent_under_their_api_names
    url = "http://localhost/x/analysis/classify"
    stub_request(:post, url).to_return_json(body: PAGE)

    client.x.analysis.classify(
      tweet_ids: ["2102882545427714266"],
      since_time: 1_790_000_000,
      until_time: "2026-09-26T00:00:00Z",
      query_type: :Top,
      limit: 20,
      cursor: "DAACCgACGRElMJcAAA",
      analysis: {
        questions: [
          {
            id: "request",
            type: :choice,
            version: "1",
            instructions: "What does the post ask for?",
            categories: {feature: "A new feature", other: nil}
          },
          {
            id: "urgent",
            type: :probability,
            version: "1",
            instructions: "Is it urgent?",
            criteria: {yes: "Now", no: "Later"}
          }
        ],
        targets: [{name: "Sony", aliases: ["WH-1000XM6"]}],
        max_context_bytes: 4000,
        concurrency: 4,
        images: false
      },
      baseline: [
        {
          id: "2102882545427714266",
          tweet: {id: "2102882545427714266"},
          answers: {sentiment: "positive", intensity: 1.0},
          monitor: {configuration_fingerprint: "9f2c4e1b"}
        }
      ]
    )

    assert_requested(:post, url) do |request|
      body = JSON.parse(request.body)
      settings = body.fetch("analysis")
      row = body.fetch("baseline").first
      assert_equal(
        [1_790_000_000, "2026-09-26T00:00:00Z", "Top"],
        body.values_at("sinceTime", "untilTime", "queryType")
      )
      assert_equal(["2102882545427714266"], body.fetch("tweetIds"))
      assert_equal([4000, 4, false], settings.values_at("maxContextBytes", "concurrency", "images"))
      assert_equal(
        {"feature" => "A new feature", "other" => nil},
        settings.fetch("questions").first.fetch("categories")
      )
      assert_equal({"yes" => "Now", "no" => "Later"}, settings.fetch("questions").last.fetch("criteria"))
      assert_equal({"configurationFingerprint" => "9f2c4e1b"}, row.fetch("monitor"))
      assert_equal({"sentiment" => "positive", "intensity" => 1.0}, row.fetch("answers"))
      true
    end
  end

  def test_page_reads_results_answers_and_summary
    stub_request(:post, "http://localhost/x/analysis/viral-score").to_return_json(body: PAGE)

    page = client.x.analysis.viral_score(texts: ["We shipped dark mode today. Tell us what breaks."])
    result = page.results.first
    answers = result.analysis.answers
    summary = page.analysis_summary

    assert_equal([true, "DAACCgACGRElMJcAAA"], [page.has_next_page, page.next_cursor])
    assert_equal("2102882545427714266", result.tweet.id)
    assert_equal({sentiment: "positive", intensity: 1.4, sarcasm: 0.04}, result.answers)
    assert_equal([:choice, "positive", 0.92], [answers[0].type, answers[0].value, answers[0].confidence])
    assert_equal([:score, 1.4, %w[low mid high]], [answers[1].type, answers[1].value, answers[1].levels])
    assert_equal([:probability, 0.04], [answers[2].type, answers[2].probability])
    assert_equal({positive: 0.92, neutral: 0.05, negative: 0.03}, answers[0].probabilities)
    assert_equal([:succeeded, 812], [result.analysis.status, result.analysis.context_bytes])
    assert_equal(
      [:truncated, :images],
      [
        result.analysis.context_availability.post_text,
        result.analysis.context_availability.media
      ]
    )
    assert_equal(
      [nil, :edit_first, 12.5, nil],
      [
        result.viral_score,
        result.viral_verdict,
        result.viral_algorithm_score,
        result.viral_actual_engagement_rate
      ]
    )
    assert_equal(
      [:changed, nil, ["sentiment"]],
      [
        result.monitor.status,
        result.monitor.baseline_dataset_id,
        result.monitor.changed_question_ids
      ]
    )
    assert_equal(
      %w[sentiment neutral positive],
      result.monitor.changes.first.then do
        [_1.question_id, _1.previous, _1.current]
      end
    )
    assert_equal([:skipped, "missing_text"], [page.unanalyzed.first.status, page.unanalyzed.first.reason])
    assert_equal([1, 0, 1], [summary.rows.analyzed, summary.rows.failed, summary.rows.skipped])
    assert_equal(1.0, summary.cashtags.first.signal.score)
    assert_equal(
      ["blog.rust-lang.org", 1],
      [summary.source_domains.first.domain, summary.source_domains.first.posts]
    )
    assert_equal(
      [1, "2102882545427714266"],
      [summary.monitor.statuses[:changed], summary.monitor.changed_rows.first.tweet_id]
    )
  end

  def test_a_page_without_posts_has_a_null_summary_monitor_and_no_filters
    page = XTwitterScraper::TweetAnalysisPage.new(
      results: [],
      unanalyzed: [],
      analysis_summary: PAGE[:analysisSummary].merge(monitor: nil),
      has_next_page: false,
      next_cursor: ""
    )

    assert_nil(page.analysis_summary.monitor)
    assert_nil(page.topic_filter)
    assert_nil(page.image_filter)
  end
end
