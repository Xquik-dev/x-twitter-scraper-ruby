# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballRushingStats < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballRushingStats,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Rushes.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :attempts

      # Yards per rush.
      sig { returns(T.nilable(Float)) }
      attr_accessor :avg_yards

      # The longest rush, in yards.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :longest

      # Rushing touchdowns.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :touchdowns

      # Rushing yards.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :yards

      sig do
        params(
          attempts: T.nilable(Integer),
          avg_yards: T.nilable(Float),
          longest: T.nilable(Integer),
          touchdowns: T.nilable(Integer),
          yards: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        # Rushes.
        attempts:,
        # Yards per rush.
        avg_yards:,
        # The longest rush, in yards.
        longest:,
        # Rushing touchdowns.
        touchdowns:,
        # Rushing yards.
        yards:
      )
      end

      sig do
        override.returns(
          {
            attempts: T.nilable(Integer),
            avg_yards: T.nilable(Float),
            longest: T.nilable(Integer),
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
