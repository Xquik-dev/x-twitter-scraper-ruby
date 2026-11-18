# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballPlay < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballPlay,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X's ID for the play within the game.
      sig { returns(T.nilable(String)) }
      attr_accessor :id

      # The play's place in its drive, or null when X sends no digits.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :sequence

      # The game clock when the play started, as HH:MM:SS.
      sig { returns(T.nilable(String)) }
      attr_accessor :clock

      # X's kind of play, such as Pass, Rush, Punt or Conversion.
      sig { returns(T.nilable(String)) }
      attr_accessor :type

      # Where the play went, such as Left or Middle.
      sig { returns(T.nilable(String)) }
      attr_accessor :direction

      # The play as the official play-by-play writes it.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Whether the play scored points.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :scoring

      # The home team's points after the play.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :home_points

      # The away team's points after the play.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :away_points

      # The points a scoring play added, or null.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballPlay::Score)) }
      attr_reader :score

      sig do
        params(
          score: T.nilable(XTwitterScraper::Models::FootballPlay::Score::OrHash)
        ).void
      end
      attr_writer :score

      # Down & distance when the play started, or null.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballPlay::Start)) }
      attr_reader :start

      sig do
        params(
          start: T.nilable(XTwitterScraper::Models::FootballPlay::Start::OrHash)
        ).void
      end
      attr_writer :start

      # Flags X shows on the field for the play, or null.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballPlay::OnField)) }
      attr_reader :on_field

      sig do
        params(
          on_field:
            T.nilable(XTwitterScraper::Models::FootballPlay::OnField::OrHash)
        ).void
      end
      attr_writer :on_field

      # The play's steps, in order.
      sig { returns(T::Array[XTwitterScraper::Models::FootballPlayDetail]) }
      attr_reader :details

      sig do
        params(
          details: T::Array[XTwitterScraper::Models::FootballPlayDetail::OrHash]
        ).void
      end
      attr_writer :details

      # The post X links to the play, or null.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballPlay::Post)) }
      attr_reader :post

      sig do
        params(
          post: T.nilable(XTwitterScraper::Models::FootballPlay::Post::OrHash)
        ).void
      end
      attr_writer :post

      # The ID of a post with the play's video.
      sig { returns(T.nilable(String)) }
      attr_accessor :video_post_id

      # The ID of a reply with the play's video.
      sig { returns(T.nilable(String)) }
      attr_accessor :video_reply_post_id

      sig do
        params(
          id: T.nilable(String),
          sequence: T.nilable(Integer),
          clock: T.nilable(String),
          type: T.nilable(String),
          direction: T.nilable(String),
          description: T.nilable(String),
          scoring: T.nilable(T::Boolean),
          home_points: T.nilable(Integer),
          away_points: T.nilable(Integer),
          score:
            T.nilable(XTwitterScraper::Models::FootballPlay::Score::OrHash),
          start:
            T.nilable(XTwitterScraper::Models::FootballPlay::Start::OrHash),
          on_field:
            T.nilable(XTwitterScraper::Models::FootballPlay::OnField::OrHash),
          details:
            T::Array[XTwitterScraper::Models::FootballPlayDetail::OrHash],
          post: T.nilable(XTwitterScraper::Models::FootballPlay::Post::OrHash),
          video_post_id: T.nilable(String),
          video_reply_post_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # X's ID for the play within the game.
        id:,
        # The play's place in its drive, or null when X sends no digits.
        sequence:,
        # The game clock when the play started, as HH:MM:SS.
        clock:,
        # X's kind of play, such as Pass, Rush, Punt or Conversion.
        type:,
        # Where the play went, such as Left or Middle.
        direction:,
        # The play as the official play-by-play writes it.
        description:,
        # Whether the play scored points.
        scoring:,
        # The home team's points after the play.
        home_points:,
        # The away team's points after the play.
        away_points:,
        # The points a scoring play added, or null.
        score:,
        # Down & distance when the play started, or null.
        start:,
        # Flags X shows on the field for the play, or null.
        on_field:,
        # The play's steps, in order.
        details:,
        # The post X links to the play, or null.
        post:,
        # The ID of a post with the play's video.
        video_post_id:,
        # The ID of a reply with the play's video.
        video_reply_post_id:
      )
      end

      sig do
        override.returns(
          {
            id: T.nilable(String),
            sequence: T.nilable(Integer),
            clock: T.nilable(String),
            type: T.nilable(String),
            direction: T.nilable(String),
            description: T.nilable(String),
            scoring: T.nilable(T::Boolean),
            home_points: T.nilable(Integer),
            away_points: T.nilable(Integer),
            score: T.nilable(XTwitterScraper::Models::FootballPlay::Score),
            start: T.nilable(XTwitterScraper::Models::FootballPlay::Start),
            on_field: T.nilable(XTwitterScraper::Models::FootballPlay::OnField),
            details: T::Array[XTwitterScraper::Models::FootballPlayDetail],
            post: T.nilable(XTwitterScraper::Models::FootballPlay::Post),
            video_post_id: T.nilable(String),
            video_reply_post_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Score < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballPlay::Score,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The home team's score once this scoring play counted.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :home_points

        # The away team's score once this scoring play counted.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :away_points

        # The points the play scored.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :points

        sig do
          params(
            home_points: T.nilable(Integer),
            away_points: T.nilable(Integer),
            points: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # The home team's score once this scoring play counted.
          home_points:,
          # The away team's score once this scoring play counted.
          away_points:,
          # The points the play scored.
          points:
        )
        end

        sig do
          override.returns(
            {
              home_points: T.nilable(Integer),
              away_points: T.nilable(Integer),
              points: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end

      class Start < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballPlay::Start,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The down, from 1 to 4.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :down

        # The yards needed for a first down.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :yards_to_go

        # The yard line of the ball.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :yardline

        # Whose half the ball was in. Home or Away in NFL games, the team's alternateId in
        # college games.
        sig { returns(T.nilable(String)) }
        attr_accessor :yardline_side

        # The team with the ball. Home or Away in NFL games, the team's alternateId in
        # college games.
        sig { returns(T.nilable(String)) }
        attr_accessor :possession

        sig do
          params(
            down: T.nilable(Integer),
            yards_to_go: T.nilable(Integer),
            yardline: T.nilable(Integer),
            yardline_side: T.nilable(String),
            possession: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The down, from 1 to 4.
          down:,
          # The yards needed for a first down.
          yards_to_go:,
          # The yard line of the ball.
          yardline:,
          # Whose half the ball was in. Home or Away in NFL games, the team's alternateId in
          # college games.
          yardline_side:,
          # The team with the ball. Home or Away in NFL games, the team's alternateId in
          # college games.
          possession:
        )
        end

        sig do
          override.returns(
            {
              down: T.nilable(Integer),
              yards_to_go: T.nilable(Integer),
              yardline: T.nilable(Integer),
              yardline_side: T.nilable(String),
              possession: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      class OnField < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballPlay::OnField,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Whether a penalty called the play back.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :called_back

        # Whether a flag was thrown.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :penalty_on_field

        # Whether a timeout followed the play.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :timeout

        # Whether officials were reviewing the play.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :under_review

        sig do
          params(
            called_back: T.nilable(T::Boolean),
            penalty_on_field: T.nilable(T::Boolean),
            timeout: T.nilable(T::Boolean),
            under_review: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether a penalty called the play back.
          called_back:,
          # Whether a flag was thrown.
          penalty_on_field:,
          # Whether a timeout followed the play.
          timeout:,
          # Whether officials were reviewing the play.
          under_review:
        )
        end

        sig do
          override.returns(
            {
              called_back: T.nilable(T::Boolean),
              penalty_on_field: T.nilable(T::Boolean),
              timeout: T.nilable(T::Boolean),
              under_review: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end
      end

      class Post < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballPlay::Post,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The post's ID.
        sig { returns(String) }
        attr_accessor :id

        # The username of the post's author, when X sends it.
        sig { returns(T.nilable(String)) }
        attr_accessor :username

        sig do
          params(id: String, username: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The post's ID.
          id:,
          # The username of the post's author, when X sends it.
          username:
        )
        end

        sig { override.returns({ id: String, username: T.nilable(String) }) }
        def to_hash
        end
      end
    end
  end
end
