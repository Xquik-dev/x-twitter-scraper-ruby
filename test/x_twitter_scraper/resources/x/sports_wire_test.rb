# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::XSportsWireTest < Minitest::Test
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

  def test_list_games
    stub = stub_request(:get, "http://localhost/x/sports/nfl/games").with(query: {"from" => "from", "to" => "to", "team" => "team", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::FootballSchedule))

    response = client.x.sports.list_games(
      :nfl,
      from: "from",
      to: "to",
      team: "team",
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::FootballSchedule, response)
  end

  def test_retrieve_scoreboard
    stub = stub_request(:get, "http://localhost/x/sports/nfl/games/id").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::FootballScoreboard))

    response = client.x.sports.retrieve_scoreboard("id", league: :nfl, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::FootballScoreboard, response)
  end

  def test_retrieve_audience
    stub = stub_request(:get, "http://localhost/x/sports/nfl/games/id/audience").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::SportsGameAudience))

    response = client.x.sports.retrieve_audience("id", league: :nfl, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::SportsGameAudience, response)
  end

  def test_retrieve_box_score
    stub = stub_request(:get, "http://localhost/x/sports/nfl/games/id/box-score").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::FootballBoxScore))

    response = client.x.sports.retrieve_box_score("id", league: :nfl, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::FootballBoxScore, response)
  end

  def test_retrieve_player_props
    stub = stub_request(:get, "http://localhost/x/sports/nfl/games/id/player-props").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::FootballProps))

    response = client.x.sports.retrieve_player_props("id", league: :nfl, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::FootballProps, response)
  end

  def test_retrieve_plays
    stub = stub_request(:get, "http://localhost/x/sports/nfl/games/id/plays").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::FootballPlays))

    response = client.x.sports.retrieve_plays("id", league: :nfl, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::FootballPlays, response)
  end

  def test_list_posts
    stub = stub_request(:get, "http://localhost/x/sports/nfl/games/id/posts").with(query: {"queryType" => "Top", "cursor" => "cursor", "pageSize" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::SportsGamePosts))

    response = client.x.sports.list_posts(
      "id",
      league: :nfl,
      query_type: :Top,
      cursor: "cursor",
      page_size: 1,
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::SportsGamePosts, response)
  end

  def test_retrieve_roster
    stub = stub_request(:get, "http://localhost/x/sports/nfl/games/id/roster").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::FootballRoster))

    response = client.x.sports.retrieve_roster("id", league: :nfl, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::FootballRoster, response)
  end
end
