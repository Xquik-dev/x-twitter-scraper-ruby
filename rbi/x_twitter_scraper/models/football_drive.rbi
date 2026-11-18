# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballDrive < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballDrive,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X's ID for the drive within the game.
      sig { returns(T.nilable(String)) }
      attr_accessor :id

      # The drive's place in the game, from 1.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :sequence

      # The team that drove. Home or Away in NFL games, the team's alternateId in
      # college games.
      sig { returns(T.nilable(String)) }
      attr_accessor :offense

      # The team on defense. X stopped sending it on 2026-10-24, so it is null.
      sig { returns(T.nilable(String)) }
      attr_accessor :defense

      # The game clock when the drive started, as HH:MM:SS.
      sig { returns(T.nilable(String)) }
      attr_accessor :start_clock

      # The game clock when the drive ended, as HH:MM:SS.
      sig { returns(T.nilable(String)) }
      attr_accessor :end_clock

      # How the drive started, such as Kickoff or Punt. X stopped sending it on
      # 2026-10-24, so it is null.
      sig { returns(T.nilable(String)) }
      attr_accessor :start_reason

      # How the drive ended, such as Touchdown or Punt.
      sig { returns(T.nilable(String)) }
      attr_accessor :end_reason

      # The drive's plays.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :play_count

      # The first downs the drive gained. X stopped sending it on 2026-10-24, so it is
      # null.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :first_downs

      # The yards the drive gained.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :net_yards

      # Whether the drive scored. X stopped sending it on 2026-10-24, so it is null.
      # Each play still says whether it scored.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :scoring

      # The drive's plays, in order.
      sig { returns(T::Array[XTwitterScraper::Models::FootballPlay]) }
      attr_reader :plays

      sig do
        params(
          plays: T::Array[XTwitterScraper::Models::FootballPlay::OrHash]
        ).void
      end
      attr_writer :plays

      sig do
        params(
          id: T.nilable(String),
          sequence: T.nilable(Integer),
          offense: T.nilable(String),
          defense: T.nilable(String),
          start_clock: T.nilable(String),
          end_clock: T.nilable(String),
          start_reason: T.nilable(String),
          end_reason: T.nilable(String),
          play_count: T.nilable(Integer),
          first_downs: T.nilable(Integer),
          net_yards: T.nilable(Integer),
          scoring: T.nilable(T::Boolean),
          plays: T::Array[XTwitterScraper::Models::FootballPlay::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # X's ID for the drive within the game.
        id:,
        # The drive's place in the game, from 1.
        sequence:,
        # The team that drove. Home or Away in NFL games, the team's alternateId in
        # college games.
        offense:,
        # The team on defense. X stopped sending it on 2026-10-24, so it is null.
        defense:,
        # The game clock when the drive started, as HH:MM:SS.
        start_clock:,
        # The game clock when the drive ended, as HH:MM:SS.
        end_clock:,
        # How the drive started, such as Kickoff or Punt. X stopped sending it on
        # 2026-10-24, so it is null.
        start_reason:,
        # How the drive ended, such as Touchdown or Punt.
        end_reason:,
        # The drive's plays.
        play_count:,
        # The first downs the drive gained. X stopped sending it on 2026-10-24, so it is
        # null.
        first_downs:,
        # The yards the drive gained.
        net_yards:,
        # Whether the drive scored. X stopped sending it on 2026-10-24, so it is null.
        # Each play still says whether it scored.
        scoring:,
        # The drive's plays, in order.
        plays:
      )
      end

      sig do
        override.returns(
          {
            id: T.nilable(String),
            sequence: T.nilable(Integer),
            offense: T.nilable(String),
            defense: T.nilable(String),
            start_clock: T.nilable(String),
            end_clock: T.nilable(String),
            start_reason: T.nilable(String),
            end_reason: T.nilable(String),
            play_count: T.nilable(Integer),
            first_downs: T.nilable(Integer),
            net_yards: T.nilable(Integer),
            scoring: T.nilable(T::Boolean),
            plays: T::Array[XTwitterScraper::Models::FootballPlay]
          }
        )
      end
      def to_hash
      end
    end
  end
end
