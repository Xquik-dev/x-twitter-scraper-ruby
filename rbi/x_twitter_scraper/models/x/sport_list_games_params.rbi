# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class SportListGamesParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::SportListGamesParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # nfl for the NFL or ncaafb for college football, in any case. Another value gets
        # a free 400 `invalid_league` before X is read.
        sig do
          returns(
            XTwitterScraper::Models::X::SportListGamesParams::League::TaggedSymbol
          )
        end
        attr_reader :league

        sig do
          params(
            league:
              XTwitterScraper::Models::X::SportListGamesParams::League::OrSymbol
          ).void
        end
        attr_writer :league

        # Start of the window. Takes an ISO 8601 date or time, such as 2026-10-01, or Unix
        # seconds. A time without a zone reads as UTC. Defaults to 7 days before to. Alias
        # sinceTime.
        sig { returns(T.nilable(String)) }
        attr_reader :from

        sig { params(from: String).void }
        attr_writer :from

        # End of the window. Takes the forms of from. Defaults to 7 days after from. Alias
        # untilTime.
        sig { returns(T.nilable(String)) }
        attr_reader :to

        sig { params(to: String).void }
        attr_writer :to

        # Keeps only 1 team's games, by team ID. Each game lists its teamIds. Aliases
        # teamId & team_id.
        sig { returns(T.nilable(String)) }
        attr_reader :team

        sig { params(team: String).void }
        attr_writer :team

        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        sig { returns(T.nilable(String)) }
        attr_reader :fields

        sig { params(fields: String).void }
        attr_writer :fields

        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        sig { returns(T.nilable(String)) }
        attr_reader :omit

        sig { params(omit: String).void }
        attr_writer :omit

        sig do
          params(
            league:
              XTwitterScraper::Models::X::SportListGamesParams::League::OrSymbol,
            from: String,
            to: String,
            team: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # nfl for the NFL or ncaafb for college football, in any case. Another value gets
          # a free 400 `invalid_league` before X is read.
          league:,
          # Start of the window. Takes an ISO 8601 date or time, such as 2026-10-01, or Unix
          # seconds. A time without a zone reads as UTC. Defaults to 7 days before to. Alias
          # sinceTime.
          from: nil,
          # End of the window. Takes the forms of from. Defaults to 7 days after from. Alias
          # untilTime.
          to: nil,
          # Keeps only 1 team's games, by team ID. Each game lists its teamIds. Aliases
          # teamId & team_id.
          team: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              league:
                XTwitterScraper::Models::X::SportListGamesParams::League::TaggedSymbol,
              from: String,
              to: String,
              team: String,
              fields: String,
              omit: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end

        module League
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::X::SportListGamesParams::League
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NFL =
            T.let(
              :nfl,
              XTwitterScraper::Models::X::SportListGamesParams::League::TaggedSymbol
            )
          NCAAFB =
            T.let(
              :ncaafb,
              XTwitterScraper::Models::X::SportListGamesParams::League::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::X::SportListGamesParams::League::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
