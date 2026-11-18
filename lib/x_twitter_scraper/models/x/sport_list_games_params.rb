# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Sports#list_games
      class SportListGamesParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute league
        #   nfl for the NFL or ncaafb for college football, in any case. Another value gets
        #   a free 400 `invalid_league` before X is read.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::SportListGamesParams::League]
        required :league, enum: -> { XTwitterScraper::Models::X::SportListGamesParams::League }

        # @!attribute from
        #   Start of the window. Takes an ISO 8601 date or time, such as 2026-10-01, or Unix
        #   seconds. A time without a zone reads as UTC. Defaults to 7 days before to. Alias
        #   sinceTime.
        #
        #   @return [String, nil]
        optional :from, String

        # @!attribute to
        #   End of the window. Takes the forms of from. Defaults to 7 days after from. Alias
        #   untilTime.
        #
        #   @return [String, nil]
        optional :to, String

        # @!attribute team
        #   Keeps only 1 team's games, by team ID. Each game lists its teamIds. Aliases
        #   teamId & team_id.
        #
        #   @return [String, nil]
        optional :team, String

        # @!attribute fields
        #   Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #   author.username. A list keeps the field in each item. Case & underscores do not
        #   matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        #   always stay. An unknown name answers 400 unknown_field with the valid names,
        #   before any read. The price stays the same. SDK row types then hold only the
        #   named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        #   the fields you need with `fields` & `omit`.
        #
        #   @return [String, nil]
        optional :fields, String

        # @!attribute omit
        #   Fields to drop from each row, comma-separated. It takes the same names as
        #   fields. With fields, it drops from the kept fields. A longer URL fails at the
        #   edge before Xquik reads it.
        #
        #   @return [String, nil]
        optional :omit, String

        # @!method initialize(league:, from: nil, to: nil, team: nil, fields: nil, omit: nil, request_options: {})
        #   @param league [Symbol, XTwitterScraper::Models::X::SportListGamesParams::League] nfl for the NFL or ncaafb for college football, in any case. Another value gets a free 400 `invalid_league` before X is read.
        #
        #   @param from [String] Start of the window. Takes an ISO 8601 date or time, such as 2026-10-01, or Unix seconds. A time without a zone reads as UTC. Defaults to 7 days before to. Alias sinceTime.
        #
        #   @param to [String] End of the window. Takes the forms of from. Defaults to 7 days after from. Alias untilTime.
        #
        #   @param team [String] Keeps only 1 team's games, by team ID. Each game lists its teamIds. Aliases teamId & team_id.
        #
        #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

        module League
          extend XTwitterScraper::Internal::Type::Enum

          NFL = :nfl
          NCAAFB = :ncaafb

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
