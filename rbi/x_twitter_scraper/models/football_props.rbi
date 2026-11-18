# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballProps < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballProps,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The ID of the game these props cover.
      sig { returns(String) }
      attr_accessor :id

      # The league of the game these props cover.
      sig do
        returns(XTwitterScraper::Models::FootballProps::League::TaggedSymbol)
      end
      attr_reader :league

      sig do
        params(
          league: XTwitterScraper::Models::FootballProps::League::OrSymbol
        ).void
      end
      attr_writer :league

      # The sportsbook page X links for these props.
      sig { returns(T.nilable(String)) }
      attr_accessor :sportsbook_url

      # Each kind of prop, such as passing yards, in X's order. A game without props has
      # none.
      sig { returns(T::Array[XTwitterScraper::Models::FootballPropCategory]) }
      attr_reader :categories

      sig do
        params(
          categories:
            T::Array[XTwitterScraper::Models::FootballPropCategory::OrHash]
        ).void
      end
      attr_writer :categories

      # The players these props name, by player ID. X sends only each player's name,
      # jersey & team, so other fields are null.
      sig { returns(T::Hash[Symbol, XTwitterScraper::Models::FootballPlayer]) }
      attr_reader :players

      sig do
        params(
          players:
            T::Hash[Symbol, XTwitterScraper::Models::FootballPlayer::OrHash]
        ).void
      end
      attr_writer :players

      sig do
        params(
          id: String,
          league: XTwitterScraper::Models::FootballProps::League::OrSymbol,
          sportsbook_url: T.nilable(String),
          categories:
            T::Array[XTwitterScraper::Models::FootballPropCategory::OrHash],
          players:
            T::Hash[Symbol, XTwitterScraper::Models::FootballPlayer::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the game these props cover.
        id:,
        # The league of the game these props cover.
        league:,
        # The sportsbook page X links for these props.
        sportsbook_url:,
        # Each kind of prop, such as passing yards, in X's order. A game without props has
        # none.
        categories:,
        # The players these props name, by player ID. X sends only each player's name,
        # jersey & team, so other fields are null.
        players:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            league:
              XTwitterScraper::Models::FootballProps::League::TaggedSymbol,
            sportsbook_url: T.nilable(String),
            categories: T::Array[XTwitterScraper::Models::FootballPropCategory],
            players: T::Hash[Symbol, XTwitterScraper::Models::FootballPlayer]
          }
        )
      end
      def to_hash
      end

      # The league of the game these props cover.
      module League
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::FootballProps::League)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NFL =
          T.let(
            :nfl,
            XTwitterScraper::Models::FootballProps::League::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::FootballProps::League::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
