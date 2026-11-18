# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballPlayerProp < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballPlayerProp,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The player the line is for, a key of players.
      sig { returns(T.nilable(String)) }
      attr_accessor :player_id

      # The line's place in its category, from 1.
      sig { returns(T.nilable(Float)) }
      attr_accessor :rank

      # The line the odds price, such as 248.5 yards. Null when the prop has no line,
      # such as the first touchdown scorer.
      sig { returns(T.nilable(Float)) }
      attr_accessor :line

      # The American odds X shows first, such as -115 or 240.
      sig { returns(T.nilable(Float)) }
      attr_accessor :odds

      # The American odds X shows second. Null for a prop with 1 price.
      sig { returns(T.nilable(Float)) }
      attr_accessor :alternate_odds

      # Whether the sportsbook takes bets on the line.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :open_for_betting

      sig do
        params(
          player_id: T.nilable(String),
          rank: T.nilable(Float),
          line: T.nilable(Float),
          odds: T.nilable(Float),
          alternate_odds: T.nilable(Float),
          open_for_betting: T.nilable(T::Boolean)
        ).returns(T.attached_class)
      end
      def self.new(
        # The player the line is for, a key of players.
        player_id:,
        # The line's place in its category, from 1.
        rank:,
        # The line the odds price, such as 248.5 yards. Null when the prop has no line,
        # such as the first touchdown scorer.
        line:,
        # The American odds X shows first, such as -115 or 240.
        odds:,
        # The American odds X shows second. Null for a prop with 1 price.
        alternate_odds:,
        # Whether the sportsbook takes bets on the line.
        open_for_betting:
      )
      end

      sig do
        override.returns(
          {
            player_id: T.nilable(String),
            rank: T.nilable(Float),
            line: T.nilable(Float),
            odds: T.nilable(Float),
            alternate_odds: T.nilable(Float),
            open_for_betting: T.nilable(T::Boolean)
          }
        )
      end
      def to_hash
      end
    end
  end
end
