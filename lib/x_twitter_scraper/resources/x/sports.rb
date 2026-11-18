# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Sports
        # Lists NFL or college football games in a time window, with teams & scores. Use
        # it to find game IDs & team IDs. Without from or to, X picks about 5 weeks around
        # today. Each request costs 1 credit.
        #
        # @overload list_games(league, from: nil, to: nil, team: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param league [Symbol, XTwitterScraper::Models::X::SportListGamesParams::League] nfl for the NFL or ncaafb for college football, in any case. Another value gets a free 400 `invalid_league` before X is read.
        #
        # @param from [String] Start of the window. Takes an ISO 8601 date or time, such as 2026-10-01, or Unix seconds. A time without a zone reads as UTC. Defaults to 7 days before to. Alias sinceTime.
        #
        # @param to [String] End of the window. Takes the forms of from. Defaults to 7 days after from. Alias untilTime.
        #
        # @param team [String] Keeps only 1 team's games, by team ID. Each game lists its teamIds. Aliases teamId & team_id.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::FootballSchedule]
        #
        # @see XTwitterScraper::Models::X::SportListGamesParams
        def list_games(league, params = {})
          parsed, options = XTwitterScraper::Models::X::SportListGamesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/sports/%1$s/games", league],
            query: query,
            model: XTwitterScraper::Models::FootballSchedule,
            options: options
          )
        end

        # Returns 1 game's scoreboard. It has the teams, the score by period, the status &
        # clock, down & distance, the venue & the latest play. Each request costs 1
        # credit.
        #
        # @overload retrieve_scoreboard(id, league:, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them. Another value gets a free 400 `invalid_game_id` before X is read.
        #
        # @param league [Symbol, XTwitterScraper::Models::X::SportRetrieveScoreboardParams::League] nfl for the NFL or ncaafb for college football, in any case. Another value gets a free 400 `invalid_league` before X is read.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::FootballScoreboard]
        #
        # @see XTwitterScraper::Models::X::SportRetrieveScoreboardParams
        def retrieve_scoreboard(id, params)
          parsed, options = XTwitterScraper::Models::X::SportRetrieveScoreboardParams.dump_request(params)
          league = parsed.delete(:league) do
            raise ArgumentError.new("missing required path argument league")
          end
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/sports/%1$s/games/%2$s", league, id],
            query: query,
            model: XTwitterScraper::Models::FootballScoreboard,
            options: options
          )
        end

        # Returns who follows 1 game on X. It has live viewers, fan picks per team & the
        # game chat's state. Each request costs 1 credit.
        #
        # @overload retrieve_audience(id, league:, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them. Another value gets a free 400 `invalid_game_id` before X is read.
        #
        # @param league [Symbol, XTwitterScraper::Models::X::SportRetrieveAudienceParams::League] nfl for the NFL or ncaafb for college football, in any case. Another value gets a free 400 `invalid_league` before X is read.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::SportsGameAudience]
        #
        # @see XTwitterScraper::Models::X::SportRetrieveAudienceParams
        def retrieve_audience(id, params)
          parsed, options = XTwitterScraper::Models::X::SportRetrieveAudienceParams.dump_request(params)
          league = parsed.delete(:league) do
            raise ArgumentError.new("missing required path argument league")
          end
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/sports/%1$s/games/%2$s/audience", league, id],
            query: query,
            model: XTwitterScraper::Models::SportsGameAudience,
            options: options
          )
        end

        # Returns each team's totals & each player's stats for 1 game. Stats cover
        # passing, rushing, receiving, defense, kicking & returns. A game that has not
        # started has no stats yet. Each request costs 1 credit.
        #
        # @overload retrieve_box_score(id, league:, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them. Another value gets a free 400 `invalid_game_id` before X is read.
        #
        # @param league [Symbol, XTwitterScraper::Models::X::SportRetrieveBoxScoreParams::League] nfl for the NFL or ncaafb for college football, in any case. Another value gets a free 400 `invalid_league` before X is read.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::FootballBoxScore]
        #
        # @see XTwitterScraper::Models::X::SportRetrieveBoxScoreParams
        def retrieve_box_score(id, params)
          parsed, options = XTwitterScraper::Models::X::SportRetrieveBoxScoreParams.dump_request(params)
          league = parsed.delete(:league) do
            raise ArgumentError.new("missing required path argument league")
          end
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/sports/%1$s/games/%2$s/box-score", league, id],
            query: query,
            model: XTwitterScraper::Models::FootballBoxScore,
            options: options
          )
        end

        # Returns the player prop lines & American odds X shows for 1 NFL game. X lists
        # props before & during a game. Other games return no categories. Each request
        # costs 1 credit.
        #
        # @overload retrieve_player_props(id, league:, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them. Another value gets a free 400 `invalid_game_id` before X is read.
        #
        # @param league [Symbol, XTwitterScraper::Models::X::SportRetrievePlayerPropsParams::League] nfl, in any case. X has no college rosters or props, so ncaafb gets a free 400 `unsupported_league`. Another value gets a free 400 `invalid_league`. Both come before X is read.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::FootballProps]
        #
        # @see XTwitterScraper::Models::X::SportRetrievePlayerPropsParams
        def retrieve_player_props(id, params)
          parsed, options = XTwitterScraper::Models::X::SportRetrievePlayerPropsParams.dump_request(params)
          league = parsed.delete(:league) do
            raise ArgumentError.new("missing required path argument league")
          end
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/sports/%1$s/games/%2$s/player-props", league, id],
            query: query,
            model: XTwitterScraper::Models::FootballProps,
            options: options
          )
        end

        # Returns every drive & play of 1 game, by quarter. Each play has its clock, down
        # & distance, details, penalties & linked posts. Each request costs 1 credit.
        #
        # @overload retrieve_plays(id, league:, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them. Another value gets a free 400 `invalid_game_id` before X is read.
        #
        # @param league [Symbol, XTwitterScraper::Models::X::SportRetrievePlaysParams::League] nfl for the NFL or ncaafb for college football, in any case. Another value gets a free 400 `invalid_league` before X is read.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::FootballPlays]
        #
        # @see XTwitterScraper::Models::X::SportRetrievePlaysParams
        def retrieve_plays(id, params)
          parsed, options = XTwitterScraper::Models::X::SportRetrievePlaysParams.dump_request(params)
          league = parsed.delete(:league) do
            raise ArgumentError.new("missing required path argument league")
          end
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/sports/%1$s/games/%2$s/plays", league, id],
            query: query,
            model: XTwitterScraper::Models::FootballPlays,
            options: options
          )
        end

        # Returns a game's top or latest posts, plus an X search you can run for more.
        # Works before, during & after the game. Pages hold up to 20 posts, & each post
        # costs 1 credit.
        #
        # @overload list_posts(id, league:, query_type: nil, cursor: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them. Another value gets a free 400 `invalid_game_id` before X is read.
        #
        # @param league [Symbol, XTwitterScraper::Models::X::SportListPostsParams::League] nfl for the NFL or ncaafb for college football, in any case. Another value gets a free 400 `invalid_league` before X is read.
        #
        # @param query_type [Symbol, XTwitterScraper::Models::X::SportListPostsParams::QueryType] Top for the posts X ranks highest, or Latest for the newest. Any case works, & so do Relevance & Recency. Alias order or sort. Send the same value with each cursor.
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] Items per page. A page holds up to 10,000, so a larger pageSize gets the largest page. Default 20. Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::SportsGamePosts]
        #
        # @see XTwitterScraper::Models::X::SportListPostsParams
        def list_posts(id, params)
          parsed, options = XTwitterScraper::Models::X::SportListPostsParams.dump_request(params)
          league = parsed.delete(:league) do
            raise ArgumentError.new("missing required path argument league")
          end
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/sports/%1$s/games/%2$s/posts", league, id],
            query: query,
            model: XTwitterScraper::Models::SportsGamePosts,
            options: options
          )
        end

        # Returns both teams' players for 1 NFL game. Each player has a jersey, position,
        # headshot & X account. Each request costs 1 credit.
        #
        # @overload retrieve_roster(id, league:, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them. Another value gets a free 400 `invalid_game_id` before X is read.
        #
        # @param league [Symbol, XTwitterScraper::Models::X::SportRetrieveRosterParams::League] nfl, in any case. X has no college rosters or props, so ncaafb gets a free 400 `unsupported_league`. Another value gets a free 400 `invalid_league`. Both come before X is read.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::FootballRoster]
        #
        # @see XTwitterScraper::Models::X::SportRetrieveRosterParams
        def retrieve_roster(id, params)
          parsed, options = XTwitterScraper::Models::X::SportRetrieveRosterParams.dump_request(params)
          league = parsed.delete(:league) do
            raise ArgumentError.new("missing required path argument league")
          end
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/sports/%1$s/games/%2$s/roster", league, id],
            query: query,
            model: XTwitterScraper::Models::FootballRoster,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
