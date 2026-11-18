# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballPlayer < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballPlayer,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The player ID that plays & stats refer to.
      sig { returns(String) }
      attr_accessor :id

      # The player's team, a key of teams.
      sig { returns(T.nilable(String)) }
      attr_accessor :team_id

      # The player's full name.
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # The name play descriptions use.
      sig { returns(T.nilable(String)) }
      attr_accessor :short_name

      # The jersey number, as text.
      sig { returns(T.nilable(String)) }
      attr_accessor :jersey

      # The position abbreviation, such as QB or DE.
      sig { returns(T.nilable(String)) }
      attr_accessor :position

      # The college the player came from.
      sig { returns(T.nilable(String)) }
      attr_accessor :college

      # Where the player was born. X sends it only for NFL players.
      sig { returns(T.nilable(String)) }
      attr_accessor :birth_place

      # The birth date, as YYYY-MM-DD.
      sig { returns(T.nilable(String)) }
      attr_accessor :birth_date

      # Photos of the player. Any of them can be null.
      sig { returns(XTwitterScraper::Models::FootballPlayer::Headshots) }
      attr_reader :headshots

      sig do
        params(
          headshots: XTwitterScraper::Models::FootballPlayer::Headshots::OrHash
        ).void
      end
      attr_writer :headshots

      # The player's X account, or null without one.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballPlayer::XUser)) }
      attr_reader :x_user

      sig do
        params(
          x_user:
            T.nilable(XTwitterScraper::Models::FootballPlayer::XUser::OrHash)
        ).void
      end
      attr_writer :x_user

      sig do
        params(
          id: String,
          team_id: T.nilable(String),
          name: T.nilable(String),
          short_name: T.nilable(String),
          jersey: T.nilable(String),
          position: T.nilable(String),
          college: T.nilable(String),
          birth_place: T.nilable(String),
          birth_date: T.nilable(String),
          headshots: XTwitterScraper::Models::FootballPlayer::Headshots::OrHash,
          x_user:
            T.nilable(XTwitterScraper::Models::FootballPlayer::XUser::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # The player ID that plays & stats refer to.
        id:,
        # The player's team, a key of teams.
        team_id:,
        # The player's full name.
        name:,
        # The name play descriptions use.
        short_name:,
        # The jersey number, as text.
        jersey:,
        # The position abbreviation, such as QB or DE.
        position:,
        # The college the player came from.
        college:,
        # Where the player was born. X sends it only for NFL players.
        birth_place:,
        # The birth date, as YYYY-MM-DD.
        birth_date:,
        # Photos of the player. Any of them can be null.
        headshots:,
        # The player's X account, or null without one.
        x_user:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            team_id: T.nilable(String),
            name: T.nilable(String),
            short_name: T.nilable(String),
            jersey: T.nilable(String),
            position: T.nilable(String),
            college: T.nilable(String),
            birth_place: T.nilable(String),
            birth_date: T.nilable(String),
            headshots: XTwitterScraper::Models::FootballPlayer::Headshots,
            x_user: T.nilable(XTwitterScraper::Models::FootballPlayer::XUser)
          }
        )
      end
      def to_hash
      end

      class Headshots < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballPlayer::Headshots,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The photo X shows on the player's card.
        sig { returns(T.nilable(String)) }
        attr_accessor :original

        # The large photo.
        sig { returns(T.nilable(String)) }
        attr_accessor :large

        # The medium photo.
        sig { returns(T.nilable(String)) }
        attr_accessor :medium

        # The small photo.
        sig { returns(T.nilable(String)) }
        attr_accessor :small

        sig do
          params(
            original: T.nilable(String),
            large: T.nilable(String),
            medium: T.nilable(String),
            small: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The photo X shows on the player's card.
          original:,
          # The large photo.
          large:,
          # The medium photo.
          medium:,
          # The small photo.
          small:
        )
        end

        sig do
          override.returns(
            {
              original: T.nilable(String),
              large: T.nilable(String),
              medium: T.nilable(String),
              small: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      class XUser < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballPlayer::XUser,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The account's user ID.
        sig { returns(String) }
        attr_accessor :id

        # The account's username, without @.
        sig { returns(T.nilable(String)) }
        attr_accessor :username

        # Whether the account has a blue check.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :blue_verified

        # Whether the account protects its posts. Only rosters carry it.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :protected

        # Whether the account can offer subscriptions. Only rosters carry it.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :super_follow_eligible

        # The label X highlights on the account, such as BusinessLabel. Only rosters carry
        # it.
        sig { returns(T.nilable(String)) }
        attr_accessor :label_type

        sig do
          params(
            id: String,
            username: T.nilable(String),
            blue_verified: T.nilable(T::Boolean),
            protected: T.nilable(T::Boolean),
            super_follow_eligible: T.nilable(T::Boolean),
            label_type: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The account's user ID.
          id:,
          # The account's username, without @.
          username:,
          # Whether the account has a blue check.
          blue_verified:,
          # Whether the account protects its posts. Only rosters carry it.
          protected:,
          # Whether the account can offer subscriptions. Only rosters carry it.
          super_follow_eligible:,
          # The label X highlights on the account, such as BusinessLabel. Only rosters carry
          # it.
          label_type:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              username: T.nilable(String),
              blue_verified: T.nilable(T::Boolean),
              protected: T.nilable(T::Boolean),
              super_follow_eligible: T.nilable(T::Boolean),
              label_type: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
