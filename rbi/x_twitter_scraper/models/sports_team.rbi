# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class SportsTeam < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::SportsTeam,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The team ID that games & players refer to.
      sig { returns(String) }
      attr_accessor :id

      # The team's full name.
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # The team's short name.
      sig { returns(T.nilable(String)) }
      attr_accessor :short_name

      # The team's abbreviation.
      sig { returns(T.nilable(String)) }
      attr_accessor :abbreviation

      # Another ID X keeps for the team.
      sig { returns(T.nilable(String)) }
      attr_accessor :alternate_id

      # The school or place the team plays for. X sends it in college football schedules
      # & in a game's audience.
      sig { returns(T.nilable(String)) }
      attr_accessor :location

      # The team's colors, as red, green & blue from 0 to 255.
      sig { returns(T::Array[XTwitterScraper::Models::SportsTeam::Color]) }
      attr_reader :colors

      sig do
        params(
          colors: T::Array[XTwitterScraper::Models::SportsTeam::Color::OrHash]
        ).void
      end
      attr_writer :colors

      # The team's logo images.
      sig { returns(XTwitterScraper::Models::SportsTeam::Logos) }
      attr_reader :logos

      sig do
        params(logos: XTwitterScraper::Models::SportsTeam::Logos::OrHash).void
      end
      attr_writer :logos

      # The user ID of the team's X account.
      sig { returns(T.nilable(String)) }
      attr_accessor :x_user_id

      # The team's wins, losses & ties this season. X sends it only in college football
      # games.
      sig { returns(T.nilable(XTwitterScraper::Models::SportsTeam::Record)) }
      attr_reader :record

      sig do
        params(
          record: T.nilable(XTwitterScraper::Models::SportsTeam::Record::OrHash)
        ).void
      end
      attr_writer :record

      # The team's recent games, newest first. Games without a kickoff time come last. X
      # sends them only with the teams of a college football game. The list is empty
      # elsewhere.
      sig { returns(T::Array[XTwitterScraper::Models::SportsTeamGame]) }
      attr_reader :recent_games

      sig do
        params(
          recent_games:
            T::Array[XTwitterScraper::Models::SportsTeamGame::OrHash]
        ).void
      end
      attr_writer :recent_games

      sig do
        params(
          id: String,
          name: T.nilable(String),
          short_name: T.nilable(String),
          abbreviation: T.nilable(String),
          alternate_id: T.nilable(String),
          location: T.nilable(String),
          colors: T::Array[XTwitterScraper::Models::SportsTeam::Color::OrHash],
          logos: XTwitterScraper::Models::SportsTeam::Logos::OrHash,
          x_user_id: T.nilable(String),
          record:
            T.nilable(XTwitterScraper::Models::SportsTeam::Record::OrHash),
          recent_games:
            T::Array[XTwitterScraper::Models::SportsTeamGame::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # The team ID that games & players refer to.
        id:,
        # The team's full name.
        name:,
        # The team's short name.
        short_name:,
        # The team's abbreviation.
        abbreviation:,
        # Another ID X keeps for the team.
        alternate_id:,
        # The school or place the team plays for. X sends it in college football schedules
        # & in a game's audience.
        location:,
        # The team's colors, as red, green & blue from 0 to 255.
        colors:,
        # The team's logo images.
        logos:,
        # The user ID of the team's X account.
        x_user_id:,
        # The team's wins, losses & ties this season. X sends it only in college football
        # games.
        record:,
        # The team's recent games, newest first. Games without a kickoff time come last. X
        # sends them only with the teams of a college football game. The list is empty
        # elsewhere.
        recent_games:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: T.nilable(String),
            short_name: T.nilable(String),
            abbreviation: T.nilable(String),
            alternate_id: T.nilable(String),
            location: T.nilable(String),
            colors: T::Array[XTwitterScraper::Models::SportsTeam::Color],
            logos: XTwitterScraper::Models::SportsTeam::Logos,
            x_user_id: T.nilable(String),
            record: T.nilable(XTwitterScraper::Models::SportsTeam::Record),
            recent_games: T::Array[XTwitterScraper::Models::SportsTeamGame]
          }
        )
      end
      def to_hash
      end

      class Color < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::SportsTeam::Color,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Red, from 0 to 255.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :r

        # Green, from 0 to 255.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :g

        # Blue, from 0 to 255.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :b

        sig do
          params(
            r: T.nilable(Integer),
            g: T.nilable(Integer),
            b: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Red, from 0 to 255.
          r:,
          # Green, from 0 to 255.
          g:,
          # Blue, from 0 to 255.
          b:
        )
        end

        sig do
          override.returns(
            {
              r: T.nilable(Integer),
              g: T.nilable(Integer),
              b: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end

      class Logos < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::SportsTeam::Logos,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The logo X shows by default.
        sig { returns(T.nilable(String)) }
        attr_accessor :default

        # The logo for light backgrounds.
        sig { returns(T.nilable(String)) }
        attr_accessor :light

        # The logo for dark backgrounds.
        sig { returns(T.nilable(String)) }
        attr_accessor :dark

        sig do
          params(
            default: T.nilable(String),
            light: T.nilable(String),
            dark: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The logo X shows by default.
          default:,
          # The logo for light backgrounds.
          light:,
          # The logo for dark backgrounds.
          dark:
        )
        end

        sig do
          override.returns(
            {
              default: T.nilable(String),
              light: T.nilable(String),
              dark: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      class Record < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::SportsTeam::Record,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Games the team won this season.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :wins

        # Games the team lost this season.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :losses

        # Games the team tied this season.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :ties

        sig do
          params(
            wins: T.nilable(Integer),
            losses: T.nilable(Integer),
            ties: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Games the team won this season.
          wins:,
          # Games the team lost this season.
          losses:,
          # Games the team tied this season.
          ties:
        )
        end

        sig do
          override.returns(
            {
              wins: T.nilable(Integer),
              losses: T.nilable(Integer),
              ties: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
