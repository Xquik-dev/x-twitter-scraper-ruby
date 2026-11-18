# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FollowerAudit < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FollowerAudit,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Engagement insights of 1 profile. Engagements are likes, replies, reposts and
      # quotes. A rate is null when nothing divides it, such as a profile without posts
      # of its own.
      sig { returns(XTwitterScraper::Models::UserInsights) }
      attr_reader :account

      sig do
        params(account: XTwitterScraper::Models::UserInsights::OrHash).void
      end
      attr_writer :account

      sig { returns(XTwitterScraper::Models::FollowerAudit::Coverage) }
      attr_reader :coverage

      sig do
        params(
          coverage: XTwitterScraper::Models::FollowerAudit::Coverage::OrHash
        ).void
      end
      attr_writer :coverage

      sig { returns(XTwitterScraper::Models::FollowerAudit::Quality) }
      attr_reader :quality

      sig do
        params(
          quality: XTwitterScraper::Models::FollowerAudit::Quality::OrHash
        ).void
      end
      attr_writer :quality

      sig { returns(T::Array[XTwitterScraper::Models::FollowerAudit::Classe]) }
      attr_reader :classes

      sig do
        params(
          classes:
            T::Array[XTwitterScraper::Models::FollowerAudit::Classe::OrHash]
        ).void
      end
      attr_writer :classes

      sig { returns(T::Array[XTwitterScraper::Models::FollowerAudit::Signal]) }
      attr_reader :signals

      sig do
        params(
          signals:
            T::Array[XTwitterScraper::Models::FollowerAudit::Signal::OrHash]
        ).void
      end
      attr_writer :signals

      # Likely fake share by position in the newest-first list.
      sig do
        returns(T::Array[XTwitterScraper::Models::FollowerAudit::ArrivalBand])
      end
      attr_reader :arrival_bands

      sig do
        params(
          arrival_bands:
            T::Array[
              XTwitterScraper::Models::FollowerAudit::ArrivalBand::OrHash
            ]
        ).void
      end
      attr_writer :arrival_bands

      # Followers who joined X in the same UTC week.
      sig { returns(T::Array[XTwitterScraper::Models::FollowerAudit::Cohort]) }
      attr_reader :cohorts

      sig do
        params(
          cohorts:
            T::Array[XTwitterScraper::Models::FollowerAudit::Cohort::OrHash]
        ).void
      end
      attr_writer :cohorts

      sig { returns(T::Array[XTwitterScraper::Models::FollowerValueCount]) }
      attr_reader :languages

      sig do
        params(
          languages:
            T::Array[XTwitterScraper::Models::FollowerValueCount::OrHash]
        ).void
      end
      attr_writer :languages

      sig { returns(T::Array[XTwitterScraper::Models::FollowerValueCount]) }
      attr_reader :places

      sig do
        params(
          places: T::Array[XTwitterScraper::Models::FollowerValueCount::OrHash]
        ).void
      end
      attr_writer :places

      sig { returns(XTwitterScraper::Models::FollowerAudit::Verified) }
      attr_reader :verified

      sig do
        params(
          verified: XTwitterScraper::Models::FollowerAudit::Verified::OrHash
        ).void
      end
      attr_writer :verified

      sig { returns(T::Array[XTwitterScraper::Models::AuditedFollower]) }
      attr_reader :followers

      sig do
        params(
          followers: T::Array[XTwitterScraper::Models::AuditedFollower::OrHash]
        ).void
      end
      attr_writer :followers

      sig { returns(T::Array[XTwitterScraper::Models::AuditedFollower]) }
      attr_reader :top_followers

      sig do
        params(
          top_followers:
            T::Array[XTwitterScraper::Models::AuditedFollower::OrHash]
        ).void
      end
      attr_writer :top_followers

      sig do
        params(
          account: XTwitterScraper::Models::UserInsights::OrHash,
          coverage: XTwitterScraper::Models::FollowerAudit::Coverage::OrHash,
          quality: XTwitterScraper::Models::FollowerAudit::Quality::OrHash,
          classes:
            T::Array[XTwitterScraper::Models::FollowerAudit::Classe::OrHash],
          signals:
            T::Array[XTwitterScraper::Models::FollowerAudit::Signal::OrHash],
          arrival_bands:
            T::Array[
              XTwitterScraper::Models::FollowerAudit::ArrivalBand::OrHash
            ],
          cohorts:
            T::Array[XTwitterScraper::Models::FollowerAudit::Cohort::OrHash],
          languages:
            T::Array[XTwitterScraper::Models::FollowerValueCount::OrHash],
          places: T::Array[XTwitterScraper::Models::FollowerValueCount::OrHash],
          verified: XTwitterScraper::Models::FollowerAudit::Verified::OrHash,
          followers: T::Array[XTwitterScraper::Models::AuditedFollower::OrHash],
          top_followers:
            T::Array[XTwitterScraper::Models::AuditedFollower::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Engagement insights of 1 profile. Engagements are likes, replies, reposts and
        # quotes. A rate is null when nothing divides it, such as a profile without posts
        # of its own.
        account:,
        coverage:,
        quality:,
        classes:,
        signals:,
        # Likely fake share by position in the newest-first list.
        arrival_bands:,
        # Followers who joined X in the same UTC week.
        cohorts:,
        languages:,
        places:,
        verified:,
        followers:,
        top_followers:
      )
      end

      sig do
        override.returns(
          {
            account: XTwitterScraper::Models::UserInsights,
            coverage: XTwitterScraper::Models::FollowerAudit::Coverage,
            quality: XTwitterScraper::Models::FollowerAudit::Quality,
            classes: T::Array[XTwitterScraper::Models::FollowerAudit::Classe],
            signals: T::Array[XTwitterScraper::Models::FollowerAudit::Signal],
            arrival_bands:
              T::Array[XTwitterScraper::Models::FollowerAudit::ArrivalBand],
            cohorts: T::Array[XTwitterScraper::Models::FollowerAudit::Cohort],
            languages: T::Array[XTwitterScraper::Models::FollowerValueCount],
            places: T::Array[XTwitterScraper::Models::FollowerValueCount],
            verified: XTwitterScraper::Models::FollowerAudit::Verified,
            followers: T::Array[XTwitterScraper::Models::AuditedFollower],
            top_followers: T::Array[XTwitterScraper::Models::AuditedFollower]
          }
        )
      end
      def to_hash
      end

      class Coverage < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FollowerAudit::Coverage,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Float) }
        attr_accessor :percent

        sig { returns(Integer) }
        attr_accessor :read

        sig { returns(Integer) }
        attr_accessor :total

        sig do
          params(percent: Float, read: Integer, total: Integer).returns(
            T.attached_class
          )
        end
        def self.new(percent:, read:, total:)
        end

        sig do
          override.returns({ percent: Float, read: Integer, total: Integer })
        end
        def to_hash
        end
      end

      class Quality < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FollowerAudit::Quality,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            XTwitterScraper::Models::FollowerAudit::Quality::Grade::TaggedSymbol
          )
        end
        attr_reader :grade

        sig do
          params(
            grade:
              XTwitterScraper::Models::FollowerAudit::Quality::Grade::OrSymbol
          ).void
        end
        attr_writer :grade

        sig { returns(Integer) }
        attr_accessor :score

        sig do
          params(
            grade:
              XTwitterScraper::Models::FollowerAudit::Quality::Grade::OrSymbol,
            score: Integer
          ).returns(T.attached_class)
        end
        def self.new(grade:, score:)
        end

        sig do
          override.returns(
            {
              grade:
                XTwitterScraper::Models::FollowerAudit::Quality::Grade::TaggedSymbol,
              score: Integer
            }
          )
        end
        def to_hash
        end

        module Grade
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::FollowerAudit::Quality::Grade
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          A =
            T.let(
              :A,
              XTwitterScraper::Models::FollowerAudit::Quality::Grade::TaggedSymbol
            )
          B =
            T.let(
              :B,
              XTwitterScraper::Models::FollowerAudit::Quality::Grade::TaggedSymbol
            )
          C =
            T.let(
              :C,
              XTwitterScraper::Models::FollowerAudit::Quality::Grade::TaggedSymbol
            )
          D =
            T.let(
              :D,
              XTwitterScraper::Models::FollowerAudit::Quality::Grade::TaggedSymbol
            )
          F =
            T.let(
              :F,
              XTwitterScraper::Models::FollowerAudit::Quality::Grade::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::FollowerAudit::Quality::Grade::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Classe < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FollowerAudit::Classe,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # What 1 follower looks like from its public profile.
        sig { returns(XTwitterScraper::Models::FollowerClass::TaggedSymbol) }
        attr_reader :class_

        sig do
          params(class_: XTwitterScraper::Models::FollowerClass::OrSymbol).void
        end
        attr_writer :class_

        sig { returns(Integer) }
        attr_accessor :count

        sig { returns(Float) }
        attr_accessor :percent

        sig do
          params(
            class_: XTwitterScraper::Models::FollowerClass::OrSymbol,
            count: Integer,
            percent: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # What 1 follower looks like from its public profile.
          class_:,
          count:,
          percent:
        )
        end

        sig do
          override.returns(
            {
              class_: XTwitterScraper::Models::FollowerClass::TaggedSymbol,
              count: Integer,
              percent: Float
            }
          )
        end
        def to_hash
        end
      end

      class Signal < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FollowerAudit::Signal,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :count

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Float) }
        attr_accessor :percent

        sig { returns(Integer) }
        attr_accessor :points

        sig do
          params(
            count: Integer,
            id: String,
            percent: Float,
            points: Integer
          ).returns(T.attached_class)
        end
        def self.new(count:, id:, percent:, points:)
        end

        sig do
          override.returns(
            { count: Integer, id: String, percent: Float, points: Integer }
          )
        end
        def to_hash
        end
      end

      class ArrivalBand < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FollowerAudit::ArrivalBand,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :count

        sig { returns(Integer) }
        attr_accessor :from

        sig { returns(Float) }
        attr_accessor :percent

        sig { returns(Integer) }
        attr_accessor :read

        sig { returns(Integer) }
        attr_accessor :to

        sig do
          params(
            count: Integer,
            from: Integer,
            percent: Float,
            read: Integer,
            to: Integer
          ).returns(T.attached_class)
        end
        def self.new(count:, from:, percent:, read:, to:)
        end

        sig do
          override.returns(
            {
              count: Integer,
              from: Integer,
              percent: Float,
              read: Integer,
              to: Integer
            }
          )
        end
        def to_hash
        end
      end

      class Cohort < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FollowerAudit::Cohort,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :count

        sig { returns(Integer) }
        attr_accessor :likely_fake

        sig { returns(Float) }
        attr_accessor :percent

        sig { returns(Integer) }
        attr_accessor :week_start_ms

        sig do
          params(
            count: Integer,
            likely_fake: Integer,
            percent: Float,
            week_start_ms: Integer
          ).returns(T.attached_class)
        end
        def self.new(count:, likely_fake:, percent:, week_start_ms:)
        end

        sig do
          override.returns(
            {
              count: Integer,
              likely_fake: Integer,
              percent: Float,
              week_start_ms: Integer
            }
          )
        end
        def to_hash
        end
      end

      class Verified < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FollowerAudit::Verified,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :count

        sig { returns(Float) }
        attr_accessor :percent

        sig { params(count: Integer, percent: Float).returns(T.attached_class) }
        def self.new(count:, percent:)
        end

        sig { override.returns({ count: Integer, percent: Float }) }
        def to_hash
        end
      end
    end
  end
end
