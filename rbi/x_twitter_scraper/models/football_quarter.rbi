# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballQuarter < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballQuarter,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X's ID for the quarter within the game.
      sig { returns(T.nilable(String)) }
      attr_accessor :id

      # The quarter's number.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :number

      # The quarter's place in the game, from 1.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :sequence

      # The quarter's drives, in order.
      sig { returns(T::Array[XTwitterScraper::Models::FootballDrive]) }
      attr_reader :drives

      sig do
        params(
          drives: T::Array[XTwitterScraper::Models::FootballDrive::OrHash]
        ).void
      end
      attr_writer :drives

      sig do
        params(
          id: T.nilable(String),
          number: T.nilable(Integer),
          sequence: T.nilable(Integer),
          drives: T::Array[XTwitterScraper::Models::FootballDrive::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # X's ID for the quarter within the game.
        id:,
        # The quarter's number.
        number:,
        # The quarter's place in the game, from 1.
        sequence:,
        # The quarter's drives, in order.
        drives:
      )
      end

      sig do
        override.returns(
          {
            id: T.nilable(String),
            number: T.nilable(Integer),
            sequence: T.nilable(Integer),
            drives: T::Array[XTwitterScraper::Models::FootballDrive]
          }
        )
      end
      def to_hash
      end
    end
  end
end
