# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Sports
        # Lists NFL or college football games in a time window, with teams & scores. Use
        # it to find game IDs & team IDs. Without from or to, X picks about 5 weeks around
        # today. Each request costs 1 credit.
        sig do
          params(
            league:
              XTwitterScraper::Models::X::SportListGamesParams::League::OrSymbol,
            from: String,
            to: String,
            team: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::FootballSchedule)
        end
        def list_games(
          # nfl for the NFL or ncaafb for college football, in any case. Another value gets
          # a free 400 `invalid_league` before X is read.
          league,
          # Start of the window. Takes an ISO 8601 date or time, such as 2026-10-01, or Unix
          # seconds. A time without a zone reads as UTC. Defaults to 7 days before to. Alias
          # sinceTime.
          from: nil,
          # End of the window. Takes the forms of from. Defaults to 7 days after from. Alias
          # untilTime.
          to: nil,
          # Keeps only 1 team's games, by team ID. Each game lists its teamIds. Aliases
          # teamId & team_id.
          team: nil,
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

        # Returns 1 game's scoreboard. It has the teams, the score by period, the status &
        # clock, down & distance, the venue & the latest play. Each request costs 1
        # credit.
        sig do
          params(
            id: String,
            league:
              XTwitterScraper::Models::X::SportRetrieveScoreboardParams::League::OrSymbol,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::FootballScoreboard)
        end
        def retrieve_scoreboard(
          # Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them.
          # Another value gets a free 400 `invalid_game_id` before X is read.
          id,
          # nfl for the NFL or ncaafb for college football, in any case. Another value gets
          # a free 400 `invalid_league` before X is read.
          league:,
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

        # Returns who follows 1 game on X. It has live viewers, fan picks per team & the
        # game chat's state. Each request costs 1 credit.
        sig do
          params(
            id: String,
            league:
              XTwitterScraper::Models::X::SportRetrieveAudienceParams::League::OrSymbol,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::SportsGameAudience)
        end
        def retrieve_audience(
          # Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them.
          # Another value gets a free 400 `invalid_game_id` before X is read.
          id,
          # nfl for the NFL or ncaafb for college football, in any case. Another value gets
          # a free 400 `invalid_league` before X is read.
          league:,
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

        # Returns each team's totals & each player's stats for 1 game. Stats cover
        # passing, rushing, receiving, defense, kicking & returns. A game that has not
        # started has no stats yet. Each request costs 1 credit.
        sig do
          params(
            id: String,
            league:
              XTwitterScraper::Models::X::SportRetrieveBoxScoreParams::League::OrSymbol,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::FootballBoxScore)
        end
        def retrieve_box_score(
          # Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them.
          # Another value gets a free 400 `invalid_game_id` before X is read.
          id,
          # nfl for the NFL or ncaafb for college football, in any case. Another value gets
          # a free 400 `invalid_league` before X is read.
          league:,
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

        # Returns the player prop lines & American odds X shows for 1 NFL game. X lists
        # props before & during a game. Other games return no categories. Each request
        # costs 1 credit.
        sig do
          params(
            id: String,
            league:
              XTwitterScraper::Models::X::SportRetrievePlayerPropsParams::League::OrSymbol,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::FootballProps)
        end
        def retrieve_player_props(
          # Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them.
          # Another value gets a free 400 `invalid_game_id` before X is read.
          id,
          # nfl, in any case. X has no college rosters or props, so ncaafb gets a free 400
          # `unsupported_league`. Another value gets a free 400 `invalid_league`. Both come
          # before X is read.
          league:,
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

        # Returns every drive & play of 1 game, by quarter. Each play has its clock, down
        # & distance, details, penalties & linked posts. Each request costs 1 credit.
        sig do
          params(
            id: String,
            league:
              XTwitterScraper::Models::X::SportRetrievePlaysParams::League::OrSymbol,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::FootballPlays)
        end
        def retrieve_plays(
          # Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them.
          # Another value gets a free 400 `invalid_game_id` before X is read.
          id,
          # nfl for the NFL or ncaafb for college football, in any case. Another value gets
          # a free 400 `invalid_league` before X is read.
          league:,
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

        # Returns a game's top or latest posts, plus an X search you can run for more.
        # Works before, during & after the game. Pages hold up to 20 posts, & each post
        # costs 1 credit.
        sig do
          params(
            id: String,
            league:
              XTwitterScraper::Models::X::SportListPostsParams::League::OrSymbol,
            query_type:
              XTwitterScraper::Models::X::SportListPostsParams::QueryType::OrSymbol,
            cursor: String,
            page_size: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::SportsGamePosts)
        end
        def list_posts(
          # Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them.
          # Another value gets a free 400 `invalid_game_id` before X is read.
          id,
          # nfl for the NFL or ncaafb for college football, in any case. Another value gets
          # a free 400 `invalid_league` before X is read.
          league:,
          # Top for the posts X ranks highest, or Latest for the newest. Any case works, &
          # so do Relevance & Recency. Alias order or sort. Send the same value with each
          # cursor.
          query_type: nil,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Items per page. A page holds up to 10,000, so a larger pageSize gets the largest
          # page. Default 20. Source, filters or credits can return fewer. Follow
          # next_cursor for more pages. Its aliases are limit, count, max_results, maxItems,
          # max_items & per_page.
          page_size: nil,
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

        # Returns both teams' players for 1 NFL game. Each player has a jersey, position,
        # headshot & X account. Each request costs 1 credit.
        sig do
          params(
            id: String,
            league:
              XTwitterScraper::Models::X::SportRetrieveRosterParams::League::OrSymbol,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::FootballRoster)
        end
        def retrieve_roster(
          # Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them.
          # Another value gets a free 400 `invalid_game_id` before X is read.
          id,
          # nfl, in any case. X has no college rosters or props, so ncaafb gets a free 400
          # `unsupported_league`. Another value gets a free 400 `invalid_league`. Both come
          # before X is read.
          league:,
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
        sig do
          params(client: XTwitterScraper::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
