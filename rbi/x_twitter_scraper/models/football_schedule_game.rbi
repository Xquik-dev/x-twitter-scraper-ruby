# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballScheduleGame < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballScheduleGame,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The game ID the other sports routes take.
      sig { returns(String) }
      attr_accessor :id

      # This game's part of the season, such as RegularSeason.
      sig { returns(T.nilable(String)) }
      attr_accessor :season_type

      # This game's week of the season.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :week

      # This game's kickoff time in UTC, or null when Xquik cannot read it.
      sig { returns(T.nilable(Time)) }
      attr_accessor :starts_at

      # This game's status from X, such as Scheduled, InProgress or Closed.
      sig { returns(T.nilable(String)) }
      attr_accessor :status

      # This game's clock, as X writes it.
      sig { returns(T.nilable(String)) }
      attr_accessor :clock

      # This game's current or last quarter.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :quarter

      # A team's side of a game & its points.
      sig { returns(XTwitterScraper::Models::FootballTeamScore) }
      attr_reader :home

      sig do
        params(home: XTwitterScraper::Models::FootballTeamScore::OrHash).void
      end
      attr_writer :home

      # A team's side of a game & its points.
      sig { returns(XTwitterScraper::Models::FootballTeamScore) }
      attr_reader :away

      sig do
        params(away: XTwitterScraper::Models::FootballTeamScore::OrHash).void
      end
      attr_writer :away

      # The game's teams, keys of teams.
      sig { returns(T::Array[String]) }
      attr_accessor :team_ids

      # The periods played so far.
      sig { returns(T::Array[XTwitterScraper::Models::FootballSchedulePeriod]) }
      attr_reader :periods

      sig do
        params(
          periods:
            T::Array[XTwitterScraper::Models::FootballSchedulePeriod::OrHash]
        ).void
      end
      attr_writer :periods

      # Betting odds for each team, or null when X has none.
      sig do
        returns(T.nilable(XTwitterScraper::Models::FootballScheduleGame::Odds))
      end
      attr_reader :odds

      sig do
        params(
          odds:
            T.nilable(
              XTwitterScraper::Models::FootballScheduleGame::Odds::OrHash
            )
        ).void
      end
      attr_writer :odds

      sig do
        params(
          id: String,
          season_type: T.nilable(String),
          week: T.nilable(Integer),
          starts_at: T.nilable(Time),
          status: T.nilable(String),
          clock: T.nilable(String),
          quarter: T.nilable(Integer),
          home: XTwitterScraper::Models::FootballTeamScore::OrHash,
          away: XTwitterScraper::Models::FootballTeamScore::OrHash,
          team_ids: T::Array[String],
          periods:
            T::Array[XTwitterScraper::Models::FootballSchedulePeriod::OrHash],
          odds:
            T.nilable(
              XTwitterScraper::Models::FootballScheduleGame::Odds::OrHash
            )
        ).returns(T.attached_class)
      end
      def self.new(
        # The game ID the other sports routes take.
        id:,
        # This game's part of the season, such as RegularSeason.
        season_type:,
        # This game's week of the season.
        week:,
        # This game's kickoff time in UTC, or null when Xquik cannot read it.
        starts_at:,
        # This game's status from X, such as Scheduled, InProgress or Closed.
        status:,
        # This game's clock, as X writes it.
        clock:,
        # This game's current or last quarter.
        quarter:,
        # A team's side of a game & its points.
        home:,
        # A team's side of a game & its points.
        away:,
        # The game's teams, keys of teams.
        team_ids:,
        # The periods played so far.
        periods:,
        # Betting odds for each team, or null when X has none.
        odds:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            season_type: T.nilable(String),
            week: T.nilable(Integer),
            starts_at: T.nilable(Time),
            status: T.nilable(String),
            clock: T.nilable(String),
            quarter: T.nilable(Integer),
            home: XTwitterScraper::Models::FootballTeamScore,
            away: XTwitterScraper::Models::FootballTeamScore,
            team_ids: T::Array[String],
            periods: T::Array[XTwitterScraper::Models::FootballSchedulePeriod],
            odds: T.nilable(XTwitterScraper::Models::FootballScheduleGame::Odds)
          }
        )
      end
      def to_hash
      end

      class Odds < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballScheduleGame::Odds,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Betting odds titles for 1 team, as X shows them.
        sig { returns(XTwitterScraper::Models::FootballOdds) }
        attr_reader :home

        sig { params(home: XTwitterScraper::Models::FootballOdds::OrHash).void }
        attr_writer :home

        # Betting odds titles for 1 team, as X shows them.
        sig { returns(XTwitterScraper::Models::FootballOdds) }
        attr_reader :away

        sig { params(away: XTwitterScraper::Models::FootballOdds::OrHash).void }
        attr_writer :away

        sig do
          params(
            home: XTwitterScraper::Models::FootballOdds::OrHash,
            away: XTwitterScraper::Models::FootballOdds::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Betting odds titles for 1 team, as X shows them.
          home:,
          # Betting odds titles for 1 team, as X shows them.
          away:
        )
        end

        sig do
          override.returns(
            {
              home: XTwitterScraper::Models::FootballOdds,
              away: XTwitterScraper::Models::FootballOdds
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
