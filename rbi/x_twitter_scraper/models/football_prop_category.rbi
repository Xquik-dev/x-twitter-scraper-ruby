# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballPropCategory < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballPropCategory,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X's key for the prop, such as passing_yards.
      sig { returns(T.nilable(String)) }
      attr_accessor :key

      # The name X shows for the prop.
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # The category's place in X's order, from 1.
      sig { returns(T.nilable(Float)) }
      attr_accessor :rank

      # Each player's line, in X's order.
      sig { returns(T::Array[XTwitterScraper::Models::FootballPlayerProp]) }
      attr_reader :props

      sig do
        params(
          props: T::Array[XTwitterScraper::Models::FootballPlayerProp::OrHash]
        ).void
      end
      attr_writer :props

      sig do
        params(
          key: T.nilable(String),
          name: T.nilable(String),
          rank: T.nilable(Float),
          props: T::Array[XTwitterScraper::Models::FootballPlayerProp::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # X's key for the prop, such as passing_yards.
        key:,
        # The name X shows for the prop.
        name:,
        # The category's place in X's order, from 1.
        rank:,
        # Each player's line, in X's order.
        props:
      )
      end

      sig do
        override.returns(
          {
            key: T.nilable(String),
            name: T.nilable(String),
            rank: T.nilable(Float),
            props: T::Array[XTwitterScraper::Models::FootballPlayerProp]
          }
        )
      end
      def to_hash
      end
    end
  end
end
