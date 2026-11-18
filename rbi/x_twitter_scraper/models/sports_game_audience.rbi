# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class SportsGameAudience < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::SportsGameAudience,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The ID of the game, from your request.
      sig { returns(String) }
      attr_accessor :id

      # The game's league, from your request.
      sig do
        returns(
          XTwitterScraper::Models::SportsGameAudience::League::TaggedSymbol
        )
      end
      attr_reader :league

      sig do
        params(
          league: XTwitterScraper::Models::SportsGameAudience::League::OrSymbol
        ).void
      end
      attr_writer :league

      # People watching the game on X at X's last count. Null before X counts any, as
      # before kickoff.
      sig do
        returns(T.nilable(XTwitterScraper::Models::SportsGameAudience::Viewers))
      end
      attr_reader :viewers

      sig do
        params(
          viewers:
            T.nilable(
              XTwitterScraper::Models::SportsGameAudience::Viewers::OrHash
            )
        ).void
      end
      attr_writer :viewers

      # How many people on X picked a team to root for.
      sig { returns(XTwitterScraper::Models::SportsGameAudience::TeamPicks) }
      attr_reader :team_picks

      sig do
        params(
          team_picks:
            XTwitterScraper::Models::SportsGameAudience::TeamPicks::OrHash
        ).void
      end
      attr_writer :team_picks

      # The game's live chat on X.
      sig { returns(XTwitterScraper::Models::SportsGameAudience::Chat) }
      attr_reader :chat

      sig do
        params(
          chat: XTwitterScraper::Models::SportsGameAudience::Chat::OrHash
        ).void
      end
      attr_writer :chat

      # The game's teams, by team ID. Short name, alternate ID, X account & record are
      # null here.
      sig { returns(T::Hash[Symbol, XTwitterScraper::Models::SportsTeam]) }
      attr_reader :teams

      sig do
        params(
          teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam::OrHash]
        ).void
      end
      attr_writer :teams

      sig do
        params(
          id: String,
          league: XTwitterScraper::Models::SportsGameAudience::League::OrSymbol,
          viewers:
            T.nilable(
              XTwitterScraper::Models::SportsGameAudience::Viewers::OrHash
            ),
          team_picks:
            XTwitterScraper::Models::SportsGameAudience::TeamPicks::OrHash,
          chat: XTwitterScraper::Models::SportsGameAudience::Chat::OrHash,
          teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the game, from your request.
        id:,
        # The game's league, from your request.
        league:,
        # People watching the game on X at X's last count. Null before X counts any, as
        # before kickoff.
        viewers:,
        # How many people on X picked a team to root for.
        team_picks:,
        # The game's live chat on X.
        chat:,
        # The game's teams, by team ID. Short name, alternate ID, X account & record are
        # null here.
        teams:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            league:
              XTwitterScraper::Models::SportsGameAudience::League::TaggedSymbol,
            viewers:
              T.nilable(XTwitterScraper::Models::SportsGameAudience::Viewers),
            team_picks: XTwitterScraper::Models::SportsGameAudience::TeamPicks,
            chat: XTwitterScraper::Models::SportsGameAudience::Chat,
            teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam]
          }
        )
      end
      def to_hash
      end

      # The game's league, from your request.
      module League
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::SportsGameAudience::League)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NFL =
          T.let(
            :nfl,
            XTwitterScraper::Models::SportsGameAudience::League::TaggedSymbol
          )
        NCAAFB =
          T.let(
            :ncaafb,
            XTwitterScraper::Models::SportsGameAudience::League::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::SportsGameAudience::League::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Viewers < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::SportsGameAudience::Viewers,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # How many people watched the game on X.
        sig { returns(Integer) }
        attr_accessor :count

        # When X counted them.
        sig { returns(Time) }
        attr_accessor :as_of

        sig { params(count: Integer, as_of: Time).returns(T.attached_class) }
        def self.new(
          # How many people watched the game on X.
          count:,
          # When X counted them.
          as_of:
        )
        end

        sig { override.returns({ count: Integer, as_of: Time }) }
        def to_hash
        end
      end

      class TeamPicks < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::SportsGameAudience::TeamPicks,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Picks for every team in the game.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :total

        # Picks per team.
        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::SportsGameAudience::TeamPicks::Team
            ]
          )
        end
        attr_reader :teams

        sig do
          params(
            teams:
              T::Array[
                XTwitterScraper::Models::SportsGameAudience::TeamPicks::Team::OrHash
              ]
          ).void
        end
        attr_writer :teams

        sig do
          params(
            total: T.nilable(Integer),
            teams:
              T::Array[
                XTwitterScraper::Models::SportsGameAudience::TeamPicks::Team::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Picks for every team in the game.
          total:,
          # Picks per team.
          teams:
        )
        end

        sig do
          override.returns(
            {
              total: T.nilable(Integer),
              teams:
                T::Array[
                  XTwitterScraper::Models::SportsGameAudience::TeamPicks::Team
                ]
            }
          )
        end
        def to_hash
        end

        class Team < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::SportsGameAudience::TeamPicks::Team,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # The team ID, a key in teams.
          sig { returns(String) }
          attr_accessor :team_id

          # How many people picked this team.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :count

          sig do
            params(team_id: String, count: T.nilable(Integer)).returns(
              T.attached_class
            )
          end
          def self.new(
            # The team ID, a key in teams.
            team_id:,
            # How many people picked this team.
            count:
          )
          end

          sig do
            override.returns({ team_id: String, count: T.nilable(Integer) })
          end
          def to_hash
          end
        end
      end

      class Chat < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::SportsGameAudience::Chat,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Whether the chat is open now.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :available

        # X's ID for the game's chat room.
        sig { returns(T.nilable(String)) }
        attr_accessor :broadcast_id

        # Time left until the chat opens. Null while it is open & after the game.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::SportsGameAudience::Chat::OpensIn
            )
          )
        end
        attr_reader :opens_in

        sig do
          params(
            opens_in:
              T.nilable(
                XTwitterScraper::Models::SportsGameAudience::Chat::OpensIn::OrHash
              )
          ).void
        end
        attr_writer :opens_in

        sig do
          params(
            available: T.nilable(T::Boolean),
            broadcast_id: T.nilable(String),
            opens_in:
              T.nilable(
                XTwitterScraper::Models::SportsGameAudience::Chat::OpensIn::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the chat is open now.
          available:,
          # X's ID for the game's chat room.
          broadcast_id:,
          # Time left until the chat opens. Null while it is open & after the game.
          opens_in:
        )
        end

        sig do
          override.returns(
            {
              available: T.nilable(T::Boolean),
              broadcast_id: T.nilable(String),
              opens_in:
                T.nilable(
                  XTwitterScraper::Models::SportsGameAudience::Chat::OpensIn
                )
            }
          )
        end
        def to_hash
        end

        class OpensIn < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::SportsGameAudience::Chat::OpensIn,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Whole days left.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :days

          # Hours left after the days.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :hours

          # Minutes left after the hours.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :minutes

          sig do
            params(
              days: T.nilable(Integer),
              hours: T.nilable(Integer),
              minutes: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # Whole days left.
            days:,
            # Hours left after the days.
            hours:,
            # Minutes left after the hours.
            minutes:
          )
          end

          sig do
            override.returns(
              {
                days: T.nilable(Integer),
                hours: T.nilable(Integer),
                minutes: T.nilable(Integer)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
