# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class SportsTeamGame < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::SportsTeamGame,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The game ID, which the game routes take.
      sig { returns(String) }
      attr_accessor :id

      # When this game kicked off, in UTC. Null when Xquik can't read X's time.
      sig { returns(T.nilable(Time)) }
      attr_accessor :starts_at

      # The stadium. X has sent none in recent games so far.
      sig { returns(T.nilable(String)) }
      attr_accessor :venue

      # This game's status as X names it, such as Closed.
      sig { returns(T.nilable(String)) }
      attr_accessor :status

      # The game clock, as X writes it. X has sent none so far.
      sig { returns(T.nilable(String)) }
      attr_accessor :clock

      # The current or last quarter. X has sent none so far.
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

      sig do
        params(
          id: String,
          starts_at: T.nilable(Time),
          venue: T.nilable(String),
          status: T.nilable(String),
          clock: T.nilable(String),
          quarter: T.nilable(Integer),
          home: XTwitterScraper::Models::FootballTeamScore::OrHash,
          away: XTwitterScraper::Models::FootballTeamScore::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The game ID, which the game routes take.
        id:,
        # When this game kicked off, in UTC. Null when Xquik can't read X's time.
        starts_at:,
        # The stadium. X has sent none in recent games so far.
        venue:,
        # This game's status as X names it, such as Closed.
        status:,
        # The game clock, as X writes it. X has sent none so far.
        clock:,
        # The current or last quarter. X has sent none so far.
        quarter:,
        # A team's side of a game & its points.
        home:,
        # A team's side of a game & its points.
        away:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            starts_at: T.nilable(Time),
            venue: T.nilable(String),
            status: T.nilable(String),
            clock: T.nilable(String),
            quarter: T.nilable(Integer),
            home: XTwitterScraper::Models::FootballTeamScore,
            away: XTwitterScraper::Models::FootballTeamScore
          }
        )
      end
      def to_hash
      end
    end
  end
end
