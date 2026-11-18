# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FollowerAudit < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute account
      #   Engagement insights of 1 profile. Engagements are likes, replies, reposts and
      #   quotes. A rate is null when nothing divides it, such as a profile without posts
      #   of its own.
      #
      #   @return [XTwitterScraper::Models::UserInsights]
      required :account, -> { XTwitterScraper::Models::UserInsights }

      # @!attribute coverage
      #
      #   @return [XTwitterScraper::Models::FollowerAudit::Coverage]
      required :coverage, -> { XTwitterScraper::Models::FollowerAudit::Coverage }

      # @!attribute quality
      #
      #   @return [XTwitterScraper::Models::FollowerAudit::Quality]
      required :quality, -> { XTwitterScraper::Models::FollowerAudit::Quality }

      # @!attribute classes
      #
      #   @return [Array<XTwitterScraper::Models::FollowerAudit::Classe>]
      required :classes, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FollowerAudit::Classe] }

      # @!attribute signals
      #
      #   @return [Array<XTwitterScraper::Models::FollowerAudit::Signal>]
      required :signals, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FollowerAudit::Signal] }

      # @!attribute arrival_bands
      #   Likely fake share by position in the newest-first list.
      #
      #   @return [Array<XTwitterScraper::Models::FollowerAudit::ArrivalBand>]
      required :arrival_bands, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FollowerAudit::ArrivalBand] }, api_name: :arrivalBands

      # @!attribute cohorts
      #   Followers who joined X in the same UTC week.
      #
      #   @return [Array<XTwitterScraper::Models::FollowerAudit::Cohort>]
      required :cohorts, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FollowerAudit::Cohort] }

      # @!attribute languages
      #
      #   @return [Array<XTwitterScraper::Models::FollowerValueCount>]
      required :languages, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FollowerValueCount] }

      # @!attribute places
      #
      #   @return [Array<XTwitterScraper::Models::FollowerValueCount>]
      required :places, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FollowerValueCount] }

      # @!attribute verified
      #
      #   @return [XTwitterScraper::Models::FollowerAudit::Verified]
      required :verified, -> { XTwitterScraper::Models::FollowerAudit::Verified }

      # @!attribute followers
      #
      #   @return [Array<XTwitterScraper::Models::AuditedFollower>]
      required :followers, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::AuditedFollower] }

      # @!attribute top_followers
      #
      #   @return [Array<XTwitterScraper::Models::AuditedFollower>]
      required :top_followers, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::AuditedFollower] }, api_name: :topFollowers

      # @!method initialize(account:, coverage:, quality:, classes:, signals:, arrival_bands:, cohorts:, languages:, places:, verified:, followers:, top_followers:)
      #   Report on the followers read. Classes rest on public profile signals, so they
      #   say what a profile looks like, never who runs it.
      #
      #   @param account [XTwitterScraper::Models::UserInsights] Engagement insights of 1 profile. Engagements are likes, replies, reposts and quotes. A rate is null when nothing divides it, such as a profile without posts of its own.
      #
      #   @param coverage [XTwitterScraper::Models::FollowerAudit::Coverage]
      #
      #   @param quality [XTwitterScraper::Models::FollowerAudit::Quality]
      #
      #   @param classes [Array<XTwitterScraper::Models::FollowerAudit::Classe>]
      #
      #   @param signals [Array<XTwitterScraper::Models::FollowerAudit::Signal>]
      #
      #   @param arrival_bands [Array<XTwitterScraper::Models::FollowerAudit::ArrivalBand>] Likely fake share by position in the newest-first list.
      #
      #   @param cohorts [Array<XTwitterScraper::Models::FollowerAudit::Cohort>] Followers who joined X in the same UTC week.
      #
      #   @param languages [Array<XTwitterScraper::Models::FollowerValueCount>]
      #
      #   @param places [Array<XTwitterScraper::Models::FollowerValueCount>]
      #
      #   @param verified [XTwitterScraper::Models::FollowerAudit::Verified]
      #
      #   @param followers [Array<XTwitterScraper::Models::AuditedFollower>]
      #
      #   @param top_followers [Array<XTwitterScraper::Models::AuditedFollower>]

      class Coverage < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute percent
        #
        #   @return [Float]
        required :percent, Float

        # @!attribute read
        #
        #   @return [Integer]
        required :read, Integer

        # @!attribute total
        #
        #   @return [Integer]
        required :total, Integer

        # @!method initialize(percent:, read:, total:)
        #   @param percent [Float]
        #
        #   @param read [Integer]
        #
        #   @param total [Integer]
      end

      class Quality < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute grade
        #
        #   @return [Symbol, XTwitterScraper::Models::FollowerAudit::Quality::Grade]
        required :grade, enum: -> { XTwitterScraper::Models::FollowerAudit::Quality::Grade }

        # @!attribute score
        #
        #   @return [Integer]
        required :score, Integer

        # @!method initialize(grade:, score:)
        #   @param grade [Symbol, XTwitterScraper::Models::FollowerAudit::Quality::Grade]
        #
        #   @param score [Integer]

        module Grade
          extend XTwitterScraper::Internal::Type::Enum

          A = :A
          B = :B
          C = :C
          D = :D
          F = :F

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Classe < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute class_
        #   What 1 follower looks like from its public profile.
        #
        #   @return [Symbol, XTwitterScraper::Models::FollowerClass]
        required :class_, enum: -> { XTwitterScraper::Models::FollowerClass }, api_name: :class

        # @!attribute count
        #
        #   @return [Integer]
        required :count, Integer

        # @!attribute percent
        #
        #   @return [Float]
        required :percent, Float

        # @!method initialize(class_:, count:, percent:)
        #   @param class_ [Symbol, XTwitterScraper::Models::FollowerClass] What 1 follower looks like from its public profile.
        #
        #   @param count [Integer]
        #
        #   @param percent [Float]
      end

      class Signal < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute count
        #
        #   @return [Integer]
        required :count, Integer

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute percent
        #
        #   @return [Float]
        required :percent, Float

        # @!attribute points
        #
        #   @return [Integer]
        required :points, Integer

        # @!method initialize(count:, id:, percent:, points:)
        #   @param count [Integer]
        #
        #   @param id [String]
        #
        #   @param percent [Float]
        #
        #   @param points [Integer]
      end

      class ArrivalBand < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute count
        #
        #   @return [Integer]
        required :count, Integer

        # @!attribute from
        #
        #   @return [Integer]
        required :from, Integer

        # @!attribute percent
        #
        #   @return [Float]
        required :percent, Float

        # @!attribute read
        #
        #   @return [Integer]
        required :read, Integer

        # @!attribute to
        #
        #   @return [Integer]
        required :to, Integer

        # @!method initialize(count:, from:, percent:, read:, to:)
        #   @param count [Integer]
        #
        #   @param from [Integer]
        #
        #   @param percent [Float]
        #
        #   @param read [Integer]
        #
        #   @param to [Integer]
      end

      class Cohort < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute count
        #
        #   @return [Integer]
        required :count, Integer

        # @!attribute likely_fake
        #
        #   @return [Integer]
        required :likely_fake, Integer, api_name: :likelyFake

        # @!attribute percent
        #
        #   @return [Float]
        required :percent, Float

        # @!attribute week_start_ms
        #
        #   @return [Integer]
        required :week_start_ms, Integer, api_name: :weekStartMs

        # @!method initialize(count:, likely_fake:, percent:, week_start_ms:)
        #   @param count [Integer]
        #
        #   @param likely_fake [Integer]
        #
        #   @param percent [Float]
        #
        #   @param week_start_ms [Integer]
      end

      class Verified < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute count
        #
        #   @return [Integer]
        required :count, Integer

        # @!attribute percent
        #
        #   @return [Float]
        required :percent, Float

        # @!method initialize(count:, percent:)
        #   @param count [Integer]
        #
        #   @param percent [Float]
      end
    end
  end
end
