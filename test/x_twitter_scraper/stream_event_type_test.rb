# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::StreamEventTypeTest < Minitest::Test
  POST_TYPES = [
    :"post.reply.new",
    :"post.quote.new",
    :"post.likes.changed",
    :"post.retweets.changed",
    :"post.replies.changed",
    :"post.quotes.changed",
    :"post.bookmarks.changed",
    :"post.views.changed",
    :"post.edited",
    :"post.deleted"
  ].freeze

  def test_stream_types_are_the_monitor_types_and_the_post_types
    assert_equal(40, XTwitterScraper::StreamEventType.values.length)
    assert_equal(
      (XTwitterScraper::EventType.values + POST_TYPES).sort,
      XTwitterScraper::StreamEventType.values.sort
    )
  end

  def test_monitors_keep_their_30_types
    assert_equal(30, XTwitterScraper::EventType.values.length)
    assert_empty(XTwitterScraper::EventType.values & POST_TYPES)
  end

  def test_events_and_webhooks_name_the_post_types
    event = XTwitterScraper::Event.new(type: :"post.reply.new")
    webhook = XTwitterScraper::WebhookCreateParams.new(event_types: [:"post.views.changed"], url: "https://example.com")

    assert_equal(XTwitterScraper::StreamEventType, XTwitterScraper::Event.fields.dig(:type, :type))
    assert_equal(:"post.reply.new", event.type)
    assert_equal([:"post.views.changed"], webhook.event_types)
  end
end
