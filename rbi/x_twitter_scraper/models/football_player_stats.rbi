# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballPlayerStats < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballPlayerStats,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The player these stats belong to, a key of players.
      sig { returns(T.nilable(String)) }
      attr_accessor :player_id

      # Passing stats.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballPassingStats)) }
      attr_reader :passing

      sig do
        params(
          passing: XTwitterScraper::Models::FootballPassingStats::OrHash
        ).void
      end
      attr_writer :passing

      # Rushing stats.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballRushingStats)) }
      attr_reader :rushing

      sig do
        params(
          rushing: XTwitterScraper::Models::FootballRushingStats::OrHash
        ).void
      end
      attr_writer :rushing

      # Receiving stats.
      sig do
        returns(
          T.nilable(XTwitterScraper::Models::FootballPlayerStats::Receiving)
        )
      end
      attr_reader :receiving

      sig do
        params(
          receiving:
            XTwitterScraper::Models::FootballPlayerStats::Receiving::OrHash
        ).void
      end
      attr_writer :receiving

      # Defensive stats.
      sig do
        returns(
          T.nilable(XTwitterScraper::Models::FootballPlayerStats::Defense)
        )
      end
      attr_reader :defense

      sig do
        params(
          defense: XTwitterScraper::Models::FootballPlayerStats::Defense::OrHash
        ).void
      end
      attr_writer :defense

      # Fumble stats.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballFumbleStats)) }
      attr_reader :fumbles

      sig do
        params(
          fumbles: XTwitterScraper::Models::FootballFumbleStats::OrHash
        ).void
      end
      attr_writer :fumbles

      # Kick, punt or interception return stats.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballReturnStats)) }
      attr_reader :kick_returns

      sig do
        params(
          kick_returns: XTwitterScraper::Models::FootballReturnStats::OrHash
        ).void
      end
      attr_writer :kick_returns

      # Kick, punt or interception return stats.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballReturnStats)) }
      attr_reader :punt_returns

      sig do
        params(
          punt_returns: XTwitterScraper::Models::FootballReturnStats::OrHash
        ).void
      end
      attr_writer :punt_returns

      # Kick, punt or interception return stats.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballReturnStats)) }
      attr_reader :interception_returns

      sig do
        params(
          interception_returns:
            XTwitterScraper::Models::FootballReturnStats::OrHash
        ).void
      end
      attr_writer :interception_returns

      # Punting stats.
      sig do
        returns(T.nilable(XTwitterScraper::Models::FootballPlayerStats::Punts))
      end
      attr_reader :punts

      sig do
        params(
          punts: XTwitterScraper::Models::FootballPlayerStats::Punts::OrHash
        ).void
      end
      attr_writer :punts

      # Field goal stats.
      sig do
        returns(
          T.nilable(XTwitterScraper::Models::FootballPlayerStats::FieldGoals)
        )
      end
      attr_reader :field_goals

      sig do
        params(
          field_goals:
            XTwitterScraper::Models::FootballPlayerStats::FieldGoals::OrHash
        ).void
      end
      attr_writer :field_goals

      # Extra point kicks.
      sig do
        returns(
          T.nilable(XTwitterScraper::Models::FootballPlayerStats::ExtraPoints)
        )
      end
      attr_reader :extra_points

      sig do
        params(
          extra_points:
            XTwitterScraper::Models::FootballPlayerStats::ExtraPoints::OrHash
        ).void
      end
      attr_writer :extra_points

      # 2-point conversions.
      sig do
        returns(
          T.nilable(XTwitterScraper::Models::FootballPlayerStats::Conversions)
        )
      end
      attr_reader :conversions

      sig do
        params(
          conversions:
            XTwitterScraper::Models::FootballPlayerStats::Conversions::OrHash
        ).void
      end
      attr_writer :conversions

      sig do
        params(
          player_id: T.nilable(String),
          passing: XTwitterScraper::Models::FootballPassingStats::OrHash,
          rushing: XTwitterScraper::Models::FootballRushingStats::OrHash,
          receiving:
            XTwitterScraper::Models::FootballPlayerStats::Receiving::OrHash,
          defense:
            XTwitterScraper::Models::FootballPlayerStats::Defense::OrHash,
          fumbles: XTwitterScraper::Models::FootballFumbleStats::OrHash,
          kick_returns: XTwitterScraper::Models::FootballReturnStats::OrHash,
          punt_returns: XTwitterScraper::Models::FootballReturnStats::OrHash,
          interception_returns:
            XTwitterScraper::Models::FootballReturnStats::OrHash,
          punts: XTwitterScraper::Models::FootballPlayerStats::Punts::OrHash,
          field_goals:
            XTwitterScraper::Models::FootballPlayerStats::FieldGoals::OrHash,
          extra_points:
            XTwitterScraper::Models::FootballPlayerStats::ExtraPoints::OrHash,
          conversions:
            XTwitterScraper::Models::FootballPlayerStats::Conversions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The player these stats belong to, a key of players.
        player_id:,
        # Passing stats.
        passing: nil,
        # Rushing stats.
        rushing: nil,
        # Receiving stats.
        receiving: nil,
        # Defensive stats.
        defense: nil,
        # Fumble stats.
        fumbles: nil,
        # Kick, punt or interception return stats.
        kick_returns: nil,
        # Kick, punt or interception return stats.
        punt_returns: nil,
        # Kick, punt or interception return stats.
        interception_returns: nil,
        # Punting stats.
        punts: nil,
        # Field goal stats.
        field_goals: nil,
        # Extra point kicks.
        extra_points: nil,
        # 2-point conversions.
        conversions: nil
      )
      end

      sig do
        override.returns(
          {
            player_id: T.nilable(String),
            passing: XTwitterScraper::Models::FootballPassingStats,
            rushing: XTwitterScraper::Models::FootballRushingStats,
            receiving: XTwitterScraper::Models::FootballPlayerStats::Receiving,
            defense: XTwitterScraper::Models::FootballPlayerStats::Defense,
            fumbles: XTwitterScraper::Models::FootballFumbleStats,
            kick_returns: XTwitterScraper::Models::FootballReturnStats,
            punt_returns: XTwitterScraper::Models::FootballReturnStats,
            interception_returns: XTwitterScraper::Models::FootballReturnStats,
            punts: XTwitterScraper::Models::FootballPlayerStats::Punts,
            field_goals:
              XTwitterScraper::Models::FootballPlayerStats::FieldGoals,
            extra_points:
              XTwitterScraper::Models::FootballPlayerStats::ExtraPoints,
            conversions:
              XTwitterScraper::Models::FootballPlayerStats::Conversions
          }
        )
      end
      def to_hash
      end

      class Receiving < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballPlayerStats::Receiving,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Yards per catch.
        sig { returns(T.nilable(Float)) }
        attr_accessor :avg_yards

        # The longest catch, in yards.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :longest

        # Catches.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :receptions

        # Passes thrown to the player.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :targets

        # Receiving touchdowns.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :touchdowns

        # Receiving yards.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :yards

        sig do
          params(
            avg_yards: T.nilable(Float),
            longest: T.nilable(Integer),
            receptions: T.nilable(Integer),
            targets: T.nilable(Integer),
            touchdowns: T.nilable(Integer),
            yards: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Yards per catch.
          avg_yards:,
          # The longest catch, in yards.
          longest:,
          # Catches.
          receptions:,
          # Passes thrown to the player.
          targets:,
          # Receiving touchdowns.
          touchdowns:,
          # Receiving yards.
          yards:
        )
        end

        sig do
          override.returns(
            {
              avg_yards: T.nilable(Float),
              longest: T.nilable(Integer),
              receptions: T.nilable(Integer),
              targets: T.nilable(Integer),
              touchdowns: T.nilable(Integer),
              yards: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end

      class Defense < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballPlayerStats::Defense,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Solo & assisted tackles together.
        sig { returns(T.nilable(Float)) }
        attr_accessor :combined

        # Fumbles forced.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :forced_fumbles

        # Interceptions.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :interceptions

        # Passes defended.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :passes_defended

        # Sacks, with a shared sack as 0.5.
        sig { returns(T.nilable(Float)) }
        attr_accessor :sacks

        # Solo tackles.
        sig { returns(T.nilable(Float)) }
        attr_accessor :tackles

        # Tackles for a loss.
        sig { returns(T.nilable(Float)) }
        attr_accessor :tackles_for_loss

        sig do
          params(
            combined: T.nilable(Float),
            forced_fumbles: T.nilable(Integer),
            interceptions: T.nilable(Integer),
            passes_defended: T.nilable(Integer),
            sacks: T.nilable(Float),
            tackles: T.nilable(Float),
            tackles_for_loss: T.nilable(Float)
          ).returns(T.attached_class)
        end
        def self.new(
          # Solo & assisted tackles together.
          combined:,
          # Fumbles forced.
          forced_fumbles:,
          # Interceptions.
          interceptions:,
          # Passes defended.
          passes_defended:,
          # Sacks, with a shared sack as 0.5.
          sacks:,
          # Solo tackles.
          tackles:,
          # Tackles for a loss.
          tackles_for_loss:
        )
        end

        sig do
          override.returns(
            {
              combined: T.nilable(Float),
              forced_fumbles: T.nilable(Integer),
              interceptions: T.nilable(Integer),
              passes_defended: T.nilable(Integer),
              sacks: T.nilable(Float),
              tackles: T.nilable(Float),
              tackles_for_loss: T.nilable(Float)
            }
          )
        end
        def to_hash
        end
      end

      class Punts < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballPlayerStats::Punts,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Punts.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :attempts

        # Net yards per punt, after returns.
        sig { returns(T.nilable(Float)) }
        attr_accessor :avg_net_yards

        # Yards per punt.
        sig { returns(T.nilable(Float)) }
        attr_accessor :avg_yards

        # Punts downed inside the 20.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :inside20

        # The longest punt, in yards.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :longest

        # Punting yards.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :yards

        sig do
          params(
            attempts: T.nilable(Integer),
            avg_net_yards: T.nilable(Float),
            avg_yards: T.nilable(Float),
            inside20: T.nilable(Integer),
            longest: T.nilable(Integer),
            yards: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Punts.
          attempts:,
          # Net yards per punt, after returns.
          avg_net_yards:,
          # Yards per punt.
          avg_yards:,
          # Punts downed inside the 20.
          inside20:,
          # The longest punt, in yards.
          longest:,
          # Punting yards.
          yards:
        )
        end

        sig do
          override.returns(
            {
              attempts: T.nilable(Integer),
              avg_net_yards: T.nilable(Float),
              avg_yards: T.nilable(Float),
              inside20: T.nilable(Integer),
              longest: T.nilable(Integer),
              yards: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end

      class FieldGoals < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballPlayerStats::FieldGoals,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Field goals tried.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :attempts

        # The longest made field goal, in yards.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :longest

        # Field goals made.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :made

        sig do
          params(
            attempts: T.nilable(Integer),
            longest: T.nilable(Integer),
            made: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Field goals tried.
          attempts:,
          # The longest made field goal, in yards.
          longest:,
          # Field goals made.
          made:
        )
        end

        sig do
          override.returns(
            {
              attempts: T.nilable(Integer),
              longest: T.nilable(Integer),
              made: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end

      class ExtraPoints < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballPlayerStats::ExtraPoints,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Extra points tried.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :attempts

        # Extra points made.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :made

        sig do
          params(
            attempts: T.nilable(Integer),
            made: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Extra points tried.
          attempts:,
          # Extra points made.
          made:
        )
        end

        sig do
          override.returns(
            { attempts: T.nilable(Integer), made: T.nilable(Integer) }
          )
        end
        def to_hash
        end
      end

      class Conversions < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballPlayerStats::Conversions,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Defensive 2-point returns.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :defense_successes

        # 2-point conversions by pass.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :pass_successes

        # 2-point conversions by rush.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :rush_successes

        # 2-point conversions after a turnover.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :turnover_successes

        sig do
          params(
            defense_successes: T.nilable(Integer),
            pass_successes: T.nilable(Integer),
            rush_successes: T.nilable(Integer),
            turnover_successes: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Defensive 2-point returns.
          defense_successes:,
          # 2-point conversions by pass.
          pass_successes:,
          # 2-point conversions by rush.
          rush_successes:,
          # 2-point conversions after a turnover.
          turnover_successes:
        )
        end

        sig do
          override.returns(
            {
              defense_successes: T.nilable(Integer),
              pass_successes: T.nilable(Integer),
              rush_successes: T.nilable(Integer),
              turnover_successes: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
