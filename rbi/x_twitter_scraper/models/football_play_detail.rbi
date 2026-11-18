# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballPlayDetail < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballPlayDetail,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The step's place in the play, from 1.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :sequence

      # X's kind of step, such as Pass, Tackle or Penalty.
      sig { returns(T.nilable(String)) }
      attr_accessor :category

      # What happened in the step.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # The direction X gives for the step.
      sig { returns(T.nilable(String)) }
      attr_accessor :direction

      # The yards the step gained or lost.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :yards

      # The players in the step & their roles.
      sig do
        returns(T::Array[XTwitterScraper::Models::FootballPlayDetail::Player])
      end
      attr_reader :players

      sig do
        params(
          players:
            T::Array[
              XTwitterScraper::Models::FootballPlayDetail::Player::OrHash
            ]
        ).void
      end
      attr_writer :players

      # The penalty this step called, or null.
      sig do
        returns(T.nilable(XTwitterScraper::Models::FootballPlayDetail::Penalty))
      end
      attr_reader :penalty

      sig do
        params(
          penalty:
            T.nilable(
              XTwitterScraper::Models::FootballPlayDetail::Penalty::OrHash
            )
        ).void
      end
      attr_writer :penalty

      sig do
        params(
          sequence: T.nilable(Integer),
          category: T.nilable(String),
          description: T.nilable(String),
          direction: T.nilable(String),
          yards: T.nilable(Integer),
          players:
            T::Array[
              XTwitterScraper::Models::FootballPlayDetail::Player::OrHash
            ],
          penalty:
            T.nilable(
              XTwitterScraper::Models::FootballPlayDetail::Penalty::OrHash
            )
        ).returns(T.attached_class)
      end
      def self.new(
        # The step's place in the play, from 1.
        sequence:,
        # X's kind of step, such as Pass, Tackle or Penalty.
        category:,
        # What happened in the step.
        description:,
        # The direction X gives for the step.
        direction:,
        # The yards the step gained or lost.
        yards:,
        # The players in the step & their roles.
        players:,
        # The penalty this step called, or null.
        penalty:
      )
      end

      sig do
        override.returns(
          {
            sequence: T.nilable(Integer),
            category: T.nilable(String),
            description: T.nilable(String),
            direction: T.nilable(String),
            yards: T.nilable(Integer),
            players:
              T::Array[XTwitterScraper::Models::FootballPlayDetail::Player],
            penalty:
              T.nilable(XTwitterScraper::Models::FootballPlayDetail::Penalty)
          }
        )
      end
      def to_hash
      end

      class Player < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballPlayDetail::Player,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The player, a key of players.
        sig { returns(T.nilable(String)) }
        attr_accessor :player_id

        # The player's role, such as Pass, Receive or Tackle.
        sig { returns(T.nilable(String)) }
        attr_accessor :player_role

        sig do
          params(
            player_id: T.nilable(String),
            player_role: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The player, a key of players.
          player_id:,
          # The player's role, such as Pass, Receive or Tackle.
          player_role:
        )
        end

        sig do
          override.returns(
            { player_id: T.nilable(String), player_role: T.nilable(String) }
          )
        end
        def to_hash
        end
      end

      class Penalty < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballPlayDetail::Penalty,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The penalty's name.
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # What the penalty does to the down.
        sig { returns(T.nilable(String)) }
        attr_accessor :next_down

        # Whether the penalty was accepted or declined.
        sig { returns(T.nilable(String)) }
        attr_accessor :result

        # The penalized team, a key of teams.
        sig { returns(T.nilable(String)) }
        attr_accessor :team_id

        # The penalty's yards.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :yards

        sig do
          params(
            description: T.nilable(String),
            next_down: T.nilable(String),
            result: T.nilable(String),
            team_id: T.nilable(String),
            yards: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # The penalty's name.
          description:,
          # What the penalty does to the down.
          next_down:,
          # Whether the penalty was accepted or declined.
          result:,
          # The penalized team, a key of teams.
          team_id:,
          # The penalty's yards.
          yards:
        )
        end

        sig do
          override.returns(
            {
              description: T.nilable(String),
              next_down: T.nilable(String),
              result: T.nilable(String),
              team_id: T.nilable(String),
              yards: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
