# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballPlay < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   X's ID for the play within the game.
      #
      #   @return [String, nil]
      required :id, String, nil?: true

      # @!attribute sequence
      #   The play's place in its drive, or null when X sends no digits.
      #
      #   @return [Integer, nil]
      required :sequence, Integer, nil?: true

      # @!attribute clock
      #   The game clock when the play started, as HH:MM:SS.
      #
      #   @return [String, nil]
      required :clock, String, nil?: true

      # @!attribute type
      #   X's kind of play, such as Pass, Rush, Punt or Conversion.
      #
      #   @return [String, nil]
      required :type, String, nil?: true

      # @!attribute direction
      #   Where the play went, such as Left or Middle.
      #
      #   @return [String, nil]
      required :direction, String, nil?: true

      # @!attribute description
      #   The play as the official play-by-play writes it.
      #
      #   @return [String, nil]
      required :description, String, nil?: true

      # @!attribute scoring
      #   Whether the play scored points.
      #
      #   @return [Boolean, nil]
      required :scoring, XTwitterScraper::Internal::Type::Boolean, nil?: true

      # @!attribute home_points
      #   The home team's points after the play.
      #
      #   @return [Integer, nil]
      required :home_points, Integer, api_name: :homePoints, nil?: true

      # @!attribute away_points
      #   The away team's points after the play.
      #
      #   @return [Integer, nil]
      required :away_points, Integer, api_name: :awayPoints, nil?: true

      # @!attribute score
      #   The points a scoring play added, or null.
      #
      #   @return [XTwitterScraper::Models::FootballPlay::Score, nil]
      required :score, -> { XTwitterScraper::Models::FootballPlay::Score }, nil?: true

      # @!attribute start
      #   Down & distance when the play started, or null.
      #
      #   @return [XTwitterScraper::Models::FootballPlay::Start, nil]
      required :start, -> { XTwitterScraper::Models::FootballPlay::Start }, nil?: true

      # @!attribute on_field
      #   Flags X shows on the field for the play, or null.
      #
      #   @return [XTwitterScraper::Models::FootballPlay::OnField, nil]
      required :on_field, -> { XTwitterScraper::Models::FootballPlay::OnField }, api_name: :onField, nil?: true

      # @!attribute details
      #   The play's steps, in order.
      #
      #   @return [Array<XTwitterScraper::Models::FootballPlayDetail>]
      required :details, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FootballPlayDetail] }

      # @!attribute post
      #   The post X links to the play, or null.
      #
      #   @return [XTwitterScraper::Models::FootballPlay::Post, nil]
      required :post, -> { XTwitterScraper::Models::FootballPlay::Post }, nil?: true

      # @!attribute video_post_id
      #   The ID of a post with the play's video.
      #
      #   @return [String, nil]
      required :video_post_id, String, api_name: :videoPostId, nil?: true

      # @!attribute video_reply_post_id
      #   The ID of a reply with the play's video.
      #
      #   @return [String, nil]
      required :video_reply_post_id, String, api_name: :videoReplyPostId, nil?: true

      # @!method initialize(id:, sequence:, clock:, type:, direction:, description:, scoring:, home_points:, away_points:, score:, start:, on_field:, details:, post:, video_post_id:, video_reply_post_id:)
      #   A play, with its situation, steps & linked posts.
      #
      #   @param id [String, nil] X's ID for the play within the game.
      #
      #   @param sequence [Integer, nil] The play's place in its drive, or null when X sends no digits.
      #
      #   @param clock [String, nil] The game clock when the play started, as HH:MM:SS.
      #
      #   @param type [String, nil] X's kind of play, such as Pass, Rush, Punt or Conversion.
      #
      #   @param direction [String, nil] Where the play went, such as Left or Middle.
      #
      #   @param description [String, nil] The play as the official play-by-play writes it.
      #
      #   @param scoring [Boolean, nil] Whether the play scored points.
      #
      #   @param home_points [Integer, nil] The home team's points after the play.
      #
      #   @param away_points [Integer, nil] The away team's points after the play.
      #
      #   @param score [XTwitterScraper::Models::FootballPlay::Score, nil] The points a scoring play added, or null.
      #
      #   @param start [XTwitterScraper::Models::FootballPlay::Start, nil] Down & distance when the play started, or null.
      #
      #   @param on_field [XTwitterScraper::Models::FootballPlay::OnField, nil] Flags X shows on the field for the play, or null.
      #
      #   @param details [Array<XTwitterScraper::Models::FootballPlayDetail>] The play's steps, in order.
      #
      #   @param post [XTwitterScraper::Models::FootballPlay::Post, nil] The post X links to the play, or null.
      #
      #   @param video_post_id [String, nil] The ID of a post with the play's video.
      #
      #   @param video_reply_post_id [String, nil] The ID of a reply with the play's video.

      class Score < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute home_points
        #   The home team's score once this scoring play counted.
        #
        #   @return [Integer, nil]
        required :home_points, Integer, api_name: :homePoints, nil?: true

        # @!attribute away_points
        #   The away team's score once this scoring play counted.
        #
        #   @return [Integer, nil]
        required :away_points, Integer, api_name: :awayPoints, nil?: true

        # @!attribute points
        #   The points the play scored.
        #
        #   @return [Integer, nil]
        required :points, Integer, nil?: true

        # @!method initialize(home_points:, away_points:, points:)
        #   The points a scoring play added, or null.
        #
        #   @param home_points [Integer, nil] The home team's score once this scoring play counted.
        #
        #   @param away_points [Integer, nil] The away team's score once this scoring play counted.
        #
        #   @param points [Integer, nil] The points the play scored.
      end

      class Start < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute down
        #   The down, from 1 to 4.
        #
        #   @return [Integer, nil]
        required :down, Integer, nil?: true

        # @!attribute yards_to_go
        #   The yards needed for a first down.
        #
        #   @return [Integer, nil]
        required :yards_to_go, Integer, api_name: :yardsToGo, nil?: true

        # @!attribute yardline
        #   The yard line of the ball.
        #
        #   @return [Integer, nil]
        required :yardline, Integer, nil?: true

        # @!attribute yardline_side
        #   Whose half the ball was in. Home or Away in NFL games, the team's alternateId in
        #   college games.
        #
        #   @return [String, nil]
        required :yardline_side, String, api_name: :yardlineSide, nil?: true

        # @!attribute possession
        #   The team with the ball. Home or Away in NFL games, the team's alternateId in
        #   college games.
        #
        #   @return [String, nil]
        required :possession, String, nil?: true

        # @!method initialize(down:, yards_to_go:, yardline:, yardline_side:, possession:)
        #   Down & distance when the play started, or null.
        #
        #   @param down [Integer, nil] The down, from 1 to 4.
        #
        #   @param yards_to_go [Integer, nil] The yards needed for a first down.
        #
        #   @param yardline [Integer, nil] The yard line of the ball.
        #
        #   @param yardline_side [String, nil] Whose half the ball was in. Home or Away in NFL games, the team's alternateId in college games.
        #
        #   @param possession [String, nil] The team with the ball. Home or Away in NFL games, the team's alternateId in college games.
      end

      class OnField < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute called_back
        #   Whether a penalty called the play back.
        #
        #   @return [Boolean, nil]
        required :called_back, XTwitterScraper::Internal::Type::Boolean, api_name: :calledBack, nil?: true

        # @!attribute penalty_on_field
        #   Whether a flag was thrown.
        #
        #   @return [Boolean, nil]
        required :penalty_on_field,
                 XTwitterScraper::Internal::Type::Boolean,
                 api_name: :penaltyOnField,
                 nil?: true

        # @!attribute timeout
        #   Whether a timeout followed the play.
        #
        #   @return [Boolean, nil]
        required :timeout, XTwitterScraper::Internal::Type::Boolean, nil?: true

        # @!attribute under_review
        #   Whether officials were reviewing the play.
        #
        #   @return [Boolean, nil]
        required :under_review, XTwitterScraper::Internal::Type::Boolean, api_name: :underReview, nil?: true

        # @!method initialize(called_back:, penalty_on_field:, timeout:, under_review:)
        #   Flags X shows on the field for the play, or null.
        #
        #   @param called_back [Boolean, nil] Whether a penalty called the play back.
        #
        #   @param penalty_on_field [Boolean, nil] Whether a flag was thrown.
        #
        #   @param timeout [Boolean, nil] Whether a timeout followed the play.
        #
        #   @param under_review [Boolean, nil] Whether officials were reviewing the play.
      end

      class Post < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #   The post's ID.
        #
        #   @return [String]
        required :id, String

        # @!attribute username
        #   The username of the post's author, when X sends it.
        #
        #   @return [String, nil]
        required :username, String, nil?: true

        # @!method initialize(id:, username:)
        #   The post X links to the play, or null.
        #
        #   @param id [String] The post's ID.
        #
        #   @param username [String, nil] The username of the post's author, when X sends it.
      end
    end
  end
end
