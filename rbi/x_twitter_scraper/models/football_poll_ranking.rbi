# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballPollRanking < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballPollRanking,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The ranked team, a key of teams.
      sig { returns(T.nilable(String)) }
      attr_accessor :team_id

      # The team's rank, where 1 is the top.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :rank

      sig do
        params(team_id: T.nilable(String), rank: T.nilable(Integer)).returns(
          T.attached_class
        )
      end
      def self.new(
        # The ranked team, a key of teams.
        team_id:,
        # The team's rank, where 1 is the top.
        rank:
      )
      end

      sig do
        override.returns(
          { team_id: T.nilable(String), rank: T.nilable(Integer) }
        )
      end
      def to_hash
      end
    end
  end
end
