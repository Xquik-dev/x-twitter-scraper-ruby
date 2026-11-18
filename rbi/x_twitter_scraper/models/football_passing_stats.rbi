# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballPassingStats < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballPassingStats,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Passes thrown.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :attempts

      # Yards per pass.
      sig { returns(T.nilable(Float)) }
      attr_accessor :avg_yards

      # Passes caught.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :completions

      # Passes intercepted.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :interceptions

      # Passing yards minus sack yards.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :net_yards

      # The passer rating.
      sig { returns(T.nilable(Float)) }
      attr_accessor :rating

      # Yards lost to sacks.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :sack_yards

      # Times sacked.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :sacks

      # Passing touchdowns.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :touchdowns

      # Passing yards.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :yards

      sig do
        params(
          attempts: T.nilable(Integer),
          avg_yards: T.nilable(Float),
          completions: T.nilable(Integer),
          interceptions: T.nilable(Integer),
          net_yards: T.nilable(Integer),
          rating: T.nilable(Float),
          sack_yards: T.nilable(Integer),
          sacks: T.nilable(Integer),
          touchdowns: T.nilable(Integer),
          yards: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        # Passes thrown.
        attempts:,
        # Yards per pass.
        avg_yards:,
        # Passes caught.
        completions:,
        # Passes intercepted.
        interceptions:,
        # Passing yards minus sack yards.
        net_yards:,
        # The passer rating.
        rating:,
        # Yards lost to sacks.
        sack_yards:,
        # Times sacked.
        sacks:,
        # Passing touchdowns.
        touchdowns:,
        # Passing yards.
        yards:
      )
      end

      sig do
        override.returns(
          {
            attempts: T.nilable(Integer),
            avg_yards: T.nilable(Float),
            completions: T.nilable(Integer),
            interceptions: T.nilable(Integer),
            net_yards: T.nilable(Integer),
            rating: T.nilable(Float),
            sack_yards: T.nilable(Integer),
            sacks: T.nilable(Integer),
            touchdowns: T.nilable(Integer),
            yards: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end
    end
  end
end
