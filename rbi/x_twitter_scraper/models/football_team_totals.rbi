# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballTeamTotals < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballTeamTotals,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # First downs.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :first_downs

      # Third downs tried & converted.
      sig do
        returns(
          T.nilable(XTwitterScraper::Models::FootballTeamTotals::ThirdDowns)
        )
      end
      attr_reader :third_downs

      sig do
        params(
          third_downs:
            T.nilable(
              XTwitterScraper::Models::FootballTeamTotals::ThirdDowns::OrHash
            )
        ).void
      end
      attr_writer :third_downs

      # The team's fumbles, or null.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballFumbleStats)) }
      attr_reader :fumbles

      sig do
        params(
          fumbles:
            T.nilable(XTwitterScraper::Models::FootballFumbleStats::OrHash)
        ).void
      end
      attr_writer :fumbles

      # The team's passing, or null.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballPassingStats)) }
      attr_reader :passing

      sig do
        params(
          passing:
            T.nilable(XTwitterScraper::Models::FootballPassingStats::OrHash)
        ).void
      end
      attr_writer :passing

      # Penalties against the team.
      sig do
        returns(
          T.nilable(XTwitterScraper::Models::FootballTeamTotals::Penalties)
        )
      end
      attr_reader :penalties

      sig do
        params(
          penalties:
            T.nilable(
              XTwitterScraper::Models::FootballTeamTotals::Penalties::OrHash
            )
        ).void
      end
      attr_writer :penalties

      # The team's rushing, or null.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballRushingStats)) }
      attr_reader :rushing

      sig do
        params(
          rushing:
            T.nilable(XTwitterScraper::Models::FootballRushingStats::OrHash)
        ).void
      end
      attr_writer :rushing

      # Time with the ball, in seconds.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :time_of_possession_seconds

      # Total yards.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :total_yards

      # Turnovers.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :turnovers

      sig do
        params(
          first_downs: T.nilable(Integer),
          third_downs:
            T.nilable(
              XTwitterScraper::Models::FootballTeamTotals::ThirdDowns::OrHash
            ),
          fumbles:
            T.nilable(XTwitterScraper::Models::FootballFumbleStats::OrHash),
          passing:
            T.nilable(XTwitterScraper::Models::FootballPassingStats::OrHash),
          penalties:
            T.nilable(
              XTwitterScraper::Models::FootballTeamTotals::Penalties::OrHash
            ),
          rushing:
            T.nilable(XTwitterScraper::Models::FootballRushingStats::OrHash),
          time_of_possession_seconds: T.nilable(Integer),
          total_yards: T.nilable(Integer),
          turnovers: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        # First downs.
        first_downs:,
        # Third downs tried & converted.
        third_downs:,
        # The team's fumbles, or null.
        fumbles:,
        # The team's passing, or null.
        passing:,
        # Penalties against the team.
        penalties:,
        # The team's rushing, or null.
        rushing:,
        # Time with the ball, in seconds.
        time_of_possession_seconds:,
        # Total yards.
        total_yards:,
        # Turnovers.
        turnovers:
      )
      end

      sig do
        override.returns(
          {
            first_downs: T.nilable(Integer),
            third_downs:
              T.nilable(
                XTwitterScraper::Models::FootballTeamTotals::ThirdDowns
              ),
            fumbles: T.nilable(XTwitterScraper::Models::FootballFumbleStats),
            passing: T.nilable(XTwitterScraper::Models::FootballPassingStats),
            penalties:
              T.nilable(XTwitterScraper::Models::FootballTeamTotals::Penalties),
            rushing: T.nilable(XTwitterScraper::Models::FootballRushingStats),
            time_of_possession_seconds: T.nilable(Integer),
            total_yards: T.nilable(Integer),
            turnovers: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end

      class ThirdDowns < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballTeamTotals::ThirdDowns,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Third downs tried.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :attempts

        # Third downs converted.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :successes

        sig do
          params(
            attempts: T.nilable(Integer),
            successes: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Third downs tried.
          attempts:,
          # Third downs converted.
          successes:
        )
        end

        sig do
          override.returns(
            { attempts: T.nilable(Integer), successes: T.nilable(Integer) }
          )
        end
        def to_hash
        end
      end

      class Penalties < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballTeamTotals::Penalties,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Penalties.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :count

        # Penalty yards.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :yards

        sig do
          params(count: T.nilable(Integer), yards: T.nilable(Integer)).returns(
            T.attached_class
          )
        end
        def self.new(
          # Penalties.
          count:,
          # Penalty yards.
          yards:
        )
        end

        sig do
          override.returns(
            { count: T.nilable(Integer), yards: T.nilable(Integer) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
