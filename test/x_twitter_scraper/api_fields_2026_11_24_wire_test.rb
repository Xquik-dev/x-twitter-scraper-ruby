# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::APIFields20261124WireTest < Minitest::Test
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
    XTwitterScraper::Client.new(base_url: "http://localhost", api_key: "My API Key", max_retries: 0)
  end

  def post(id, **fields)
    {
      id: id,
      bookmarkCount: 0,
      likeCount: 0,
      quoteCount: 0,
      replyCount: 0,
      retweetCount: 0,
      text: "gm",
      viewCount: 0,
      **fields
    }
  end

  def test_a_listed_post_and_its_embedded_posts_name_why_x_shows_no_community
    stub_request(:get, "http://localhost/x/bookmarks").to_return_json(
      body: {
        tweets: [
          post(
            "1",
            communityUnavailable: {reason: "Suspended"},
            parentTweet: post("2", communityUnavailable: {reason: "NotFound"}),
            quoted_tweet: post("3", communityUnavailable: {reason: "Deleted"}),
            retweeted_tweet: post("4")
          )
        ],
        has_next_page: false,
        next_cursor: ""
      }
    )

    tweet = client.x.bookmarks.list.tweets.first

    assert_equal(
      ["Suspended", "NotFound", "Deleted", nil],
      [
        tweet.community_unavailable.reason,
        tweet.parent_tweet.community_unavailable.reason,
        tweet.quoted_tweet.community_unavailable.reason,
        tweet.retweeted_tweet.community_unavailable
      ]
    )
  end

  def test_a_post_read_by_id_names_why_x_shows_no_community
    stub_request(:get, "http://localhost/x/tweets/1").to_return_json(
      body: {tweet: post("1", communityUnavailable: {reason: "Suspended"})}
    )

    assert_equal("Suspended", client.x.tweets.retrieve("1").tweet.community_unavailable.reason)
  end

  def test_a_college_game_lists_the_teams_x_ranks_in_its_poll
    stub_request(:get, "http://localhost/x/sports/ncaafb/games").to_return_json(
      body: {
        league: "ncaafb",
        games: [
          {
            id: "2055084502741811200",
            seasonType: "RegularSeason",
            week: 6,
            startsAt: "2026-10-20T00:15:00.000Z",
            status: "Closed",
            clock: "00:00:00",
            quarter: 4,
            home: {teamId: "689566294702555136", points: 23},
            away: {teamId: "689566304366292992", points: 17},
            teamIds: %w[689566294702555136 689566304366292992],
            periods: [],
            odds: nil,
            rankings: [{teamId: "689566294702555136", rank: 5}, {teamId: nil, rank: nil}]
          }
        ],
        teams: {}
      }
    )

    game = client.x.sports.list_games(:ncaafb).games.first

    assert_equal([["689566294702555136", 5], [nil, nil]], game.rankings.map { [_1.team_id, _1.rank] })
  end
end
