# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballFumbleStats < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballFumbleStats,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Fumbles the other team recovered.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :lost

      # Touchdowns scored after recovering the other team's fumble.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :opponent_recovery_touchdowns

      # Touchdowns scored after recovering an own fumble.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :own_recovery_touchdowns

      sig do
        params(
          lost: T.nilable(Integer),
          opponent_recovery_touchdowns: T.nilable(Integer),
          own_recovery_touchdowns: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        # Fumbles the other team recovered.
        lost:,
        # Touchdowns scored after recovering the other team's fumble.
        opponent_recovery_touchdowns:,
        # Touchdowns scored after recovering an own fumble.
        own_recovery_touchdowns:
      )
      end

      sig do
        override.returns(
          {
            lost: T.nilable(Integer),
            opponent_recovery_touchdowns: T.nilable(Integer),
            own_recovery_touchdowns: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end
    end
  end
end
