# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballPlayerStats < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute player_id
      #   The player these stats belong to, a key of players.
      #
      #   @return [String, nil]
      required :player_id, String, api_name: :playerId, nil?: true

      # @!attribute passing
      #   Passing stats.
      #
      #   @return [XTwitterScraper::Models::FootballPassingStats, nil]
      optional :passing, -> { XTwitterScraper::Models::FootballPassingStats }

      # @!attribute rushing
      #   Rushing stats.
      #
      #   @return [XTwitterScraper::Models::FootballRushingStats, nil]
      optional :rushing, -> { XTwitterScraper::Models::FootballRushingStats }

      # @!attribute receiving
      #   Receiving stats.
      #
      #   @return [XTwitterScraper::Models::FootballPlayerStats::Receiving, nil]
      optional :receiving, -> { XTwitterScraper::Models::FootballPlayerStats::Receiving }

      # @!attribute defense
      #   Defensive stats.
      #
      #   @return [XTwitterScraper::Models::FootballPlayerStats::Defense, nil]
      optional :defense, -> { XTwitterScraper::Models::FootballPlayerStats::Defense }

      # @!attribute fumbles
      #   Fumble stats.
      #
      #   @return [XTwitterScraper::Models::FootballFumbleStats, nil]
      optional :fumbles, -> { XTwitterScraper::Models::FootballFumbleStats }

      # @!attribute kick_returns
      #   Kick, punt or interception return stats.
      #
      #   @return [XTwitterScraper::Models::FootballReturnStats, nil]
      optional :kick_returns, -> { XTwitterScraper::Models::FootballReturnStats }, api_name: :kickReturns

      # @!attribute punt_returns
      #   Kick, punt or interception return stats.
      #
      #   @return [XTwitterScraper::Models::FootballReturnStats, nil]
      optional :punt_returns, -> { XTwitterScraper::Models::FootballReturnStats }, api_name: :puntReturns

      # @!attribute interception_returns
      #   Kick, punt or interception return stats.
      #
      #   @return [XTwitterScraper::Models::FootballReturnStats, nil]
      optional :interception_returns, -> { XTwitterScraper::Models::FootballReturnStats }, api_name: :interceptionReturns

      # @!attribute punts
      #   Punting stats.
      #
      #   @return [XTwitterScraper::Models::FootballPlayerStats::Punts, nil]
      optional :punts, -> { XTwitterScraper::Models::FootballPlayerStats::Punts }

      # @!attribute field_goals
      #   Field goal stats.
      #
      #   @return [XTwitterScraper::Models::FootballPlayerStats::FieldGoals, nil]
      optional :field_goals, -> { XTwitterScraper::Models::FootballPlayerStats::FieldGoals }, api_name: :fieldGoals

      # @!attribute extra_points
      #   Extra point kicks.
      #
      #   @return [XTwitterScraper::Models::FootballPlayerStats::ExtraPoints, nil]
      optional :extra_points, -> { XTwitterScraper::Models::FootballPlayerStats::ExtraPoints }, api_name: :extraPoints

      # @!attribute conversions
      #   2-point conversions.
      #
      #   @return [XTwitterScraper::Models::FootballPlayerStats::Conversions, nil]
      optional :conversions, -> { XTwitterScraper::Models::FootballPlayerStats::Conversions }

      # @!method initialize(player_id:, passing: nil, rushing: nil, receiving: nil, defense: nil, fumbles: nil, kick_returns: nil, punt_returns: nil, interception_returns: nil, punts: nil, field_goals: nil, extra_points: nil, conversions: nil)
      #   1 player's stats for 1 game. Only the stat groups X sent are present.
      #
      #   @param player_id [String, nil] The player these stats belong to, a key of players.
      #
      #   @param passing [XTwitterScraper::Models::FootballPassingStats] Passing stats.
      #
      #   @param rushing [XTwitterScraper::Models::FootballRushingStats] Rushing stats.
      #
      #   @param receiving [XTwitterScraper::Models::FootballPlayerStats::Receiving] Receiving stats.
      #
      #   @param defense [XTwitterScraper::Models::FootballPlayerStats::Defense] Defensive stats.
      #
      #   @param fumbles [XTwitterScraper::Models::FootballFumbleStats] Fumble stats.
      #
      #   @param kick_returns [XTwitterScraper::Models::FootballReturnStats] Kick, punt or interception return stats.
      #
      #   @param punt_returns [XTwitterScraper::Models::FootballReturnStats] Kick, punt or interception return stats.
      #
      #   @param interception_returns [XTwitterScraper::Models::FootballReturnStats] Kick, punt or interception return stats.
      #
      #   @param punts [XTwitterScraper::Models::FootballPlayerStats::Punts] Punting stats.
      #
      #   @param field_goals [XTwitterScraper::Models::FootballPlayerStats::FieldGoals] Field goal stats.
      #
      #   @param extra_points [XTwitterScraper::Models::FootballPlayerStats::ExtraPoints] Extra point kicks.
      #
      #   @param conversions [XTwitterScraper::Models::FootballPlayerStats::Conversions] 2-point conversions.

      class Receiving < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute avg_yards
        #   Yards per catch.
        #
        #   @return [Float, nil]
        required :avg_yards, Float, api_name: :avgYards, nil?: true

        # @!attribute longest
        #   The longest catch, in yards.
        #
        #   @return [Integer, nil]
        required :longest, Integer, nil?: true

        # @!attribute receptions
        #   Catches.
        #
        #   @return [Integer, nil]
        required :receptions, Integer, nil?: true

        # @!attribute targets
        #   Passes thrown to the player.
        #
        #   @return [Integer, nil]
        required :targets, Integer, nil?: true

        # @!attribute touchdowns
        #   Receiving touchdowns.
        #
        #   @return [Integer, nil]
        required :touchdowns, Integer, nil?: true

        # @!attribute yards
        #   Receiving yards.
        #
        #   @return [Integer, nil]
        required :yards, Integer, nil?: true

        # @!method initialize(avg_yards:, longest:, receptions:, targets:, touchdowns:, yards:)
        #   Receiving stats.
        #
        #   @param avg_yards [Float, nil] Yards per catch.
        #
        #   @param longest [Integer, nil] The longest catch, in yards.
        #
        #   @param receptions [Integer, nil] Catches.
        #
        #   @param targets [Integer, nil] Passes thrown to the player.
        #
        #   @param touchdowns [Integer, nil] Receiving touchdowns.
        #
        #   @param yards [Integer, nil] Receiving yards.
      end

      class Defense < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute combined
        #   Solo & assisted tackles together.
        #
        #   @return [Float, nil]
        required :combined, Float, nil?: true

        # @!attribute forced_fumbles
        #   Fumbles forced.
        #
        #   @return [Integer, nil]
        required :forced_fumbles, Integer, api_name: :forcedFumbles, nil?: true

        # @!attribute interceptions
        #   Interceptions.
        #
        #   @return [Integer, nil]
        required :interceptions, Integer, nil?: true

        # @!attribute passes_defended
        #   Passes defended.
        #
        #   @return [Integer, nil]
        required :passes_defended, Integer, api_name: :passesDefended, nil?: true

        # @!attribute sacks
        #   Sacks, with a shared sack as 0.5.
        #
        #   @return [Float, nil]
        required :sacks, Float, nil?: true

        # @!attribute tackles
        #   Solo tackles.
        #
        #   @return [Float, nil]
        required :tackles, Float, nil?: true

        # @!attribute tackles_for_loss
        #   Tackles for a loss.
        #
        #   @return [Float, nil]
        required :tackles_for_loss, Float, api_name: :tacklesForLoss, nil?: true

        # @!method initialize(combined:, forced_fumbles:, interceptions:, passes_defended:, sacks:, tackles:, tackles_for_loss:)
        #   Defensive stats.
        #
        #   @param combined [Float, nil] Solo & assisted tackles together.
        #
        #   @param forced_fumbles [Integer, nil] Fumbles forced.
        #
        #   @param interceptions [Integer, nil] Interceptions.
        #
        #   @param passes_defended [Integer, nil] Passes defended.
        #
        #   @param sacks [Float, nil] Sacks, with a shared sack as 0.5.
        #
        #   @param tackles [Float, nil] Solo tackles.
        #
        #   @param tackles_for_loss [Float, nil] Tackles for a loss.
      end

      class Punts < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute attempts
        #   Punts.
        #
        #   @return [Integer, nil]
        required :attempts, Integer, nil?: true

        # @!attribute avg_net_yards
        #   Net yards per punt, after returns.
        #
        #   @return [Float, nil]
        required :avg_net_yards, Float, api_name: :avgNetYards, nil?: true

        # @!attribute avg_yards
        #   Yards per punt.
        #
        #   @return [Float, nil]
        required :avg_yards, Float, api_name: :avgYards, nil?: true

        # @!attribute inside20
        #   Punts downed inside the 20.
        #
        #   @return [Integer, nil]
        required :inside20, Integer, nil?: true

        # @!attribute longest
        #   The longest punt, in yards.
        #
        #   @return [Integer, nil]
        required :longest, Integer, nil?: true

        # @!attribute yards
        #   Punting yards.
        #
        #   @return [Integer, nil]
        required :yards, Integer, nil?: true

        # @!method initialize(attempts:, avg_net_yards:, avg_yards:, inside20:, longest:, yards:)
        #   Punting stats.
        #
        #   @param attempts [Integer, nil] Punts.
        #
        #   @param avg_net_yards [Float, nil] Net yards per punt, after returns.
        #
        #   @param avg_yards [Float, nil] Yards per punt.
        #
        #   @param inside20 [Integer, nil] Punts downed inside the 20.
        #
        #   @param longest [Integer, nil] The longest punt, in yards.
        #
        #   @param yards [Integer, nil] Punting yards.
      end

      class FieldGoals < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute attempts
        #   Field goals tried.
        #
        #   @return [Integer, nil]
        required :attempts, Integer, nil?: true

        # @!attribute longest
        #   The longest made field goal, in yards.
        #
        #   @return [Integer, nil]
        required :longest, Integer, nil?: true

        # @!attribute made
        #   Field goals made.
        #
        #   @return [Integer, nil]
        required :made, Integer, nil?: true

        # @!method initialize(attempts:, longest:, made:)
        #   Field goal stats.
        #
        #   @param attempts [Integer, nil] Field goals tried.
        #
        #   @param longest [Integer, nil] The longest made field goal, in yards.
        #
        #   @param made [Integer, nil] Field goals made.
      end

      class ExtraPoints < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute attempts
        #   Extra points tried.
        #
        #   @return [Integer, nil]
        required :attempts, Integer, nil?: true

        # @!attribute made
        #   Extra points made.
        #
        #   @return [Integer, nil]
        required :made, Integer, nil?: true

        # @!method initialize(attempts:, made:)
        #   Extra point kicks.
        #
        #   @param attempts [Integer, nil] Extra points tried.
        #
        #   @param made [Integer, nil] Extra points made.
      end

      class Conversions < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute defense_successes
        #   Defensive 2-point returns.
        #
        #   @return [Integer, nil]
        required :defense_successes, Integer, api_name: :defenseSuccesses, nil?: true

        # @!attribute pass_successes
        #   2-point conversions by pass.
        #
        #   @return [Integer, nil]
        required :pass_successes, Integer, api_name: :passSuccesses, nil?: true

        # @!attribute rush_successes
        #   2-point conversions by rush.
        #
        #   @return [Integer, nil]
        required :rush_successes, Integer, api_name: :rushSuccesses, nil?: true

        # @!attribute turnover_successes
        #   2-point conversions after a turnover.
        #
        #   @return [Integer, nil]
        required :turnover_successes, Integer, api_name: :turnoverSuccesses, nil?: true

        # @!method initialize(defense_successes:, pass_successes:, rush_successes:, turnover_successes:)
        #   2-point conversions.
        #
        #   @param defense_successes [Integer, nil] Defensive 2-point returns.
        #
        #   @param pass_successes [Integer, nil] 2-point conversions by pass.
        #
        #   @param rush_successes [Integer, nil] 2-point conversions by rush.
        #
        #   @param turnover_successes [Integer, nil] 2-point conversions after a turnover.
      end
    end
  end
end
