# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballReturnStats < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballReturnStats,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Yards per return.
      sig { returns(T.nilable(Float)) }
      attr_accessor :avg_yards

      # The longest return, in yards.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :longest

      # Returns.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :returns

      # Return touchdowns.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :touchdowns

      # Return yards.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :yards

      sig do
        params(
          avg_yards: T.nilable(Float),
          longest: T.nilable(Integer),
          returns: T.nilable(Integer),
          touchdowns: T.nilable(Integer),
          yards: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        # Yards per return.
        avg_yards:,
        # The longest return, in yards.
        longest:,
        # Returns.
        returns:,
        # Return touchdowns.
        touchdowns:,
        # Return yards.
        yards:
      )
      end

      sig do
        override.returns(
          {
            avg_yards: T.nilable(Float),
            longest: T.nilable(Integer),
            returns: T.nilable(Integer),
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
