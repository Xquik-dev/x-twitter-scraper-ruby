# typed: strong

module XTwitterScraper
  module Models
    class AccountRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::AccountRetrieveResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :monitors_allowed

      sig { returns(Integer) }
      attr_accessor :monitors_used

      sig do
        returns(
          XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol
        )
      end
      attr_accessor :plan

      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::AccountRetrieveResponse::CurrentPeriod
          )
        )
      end
      attr_reader :current_period

      sig do
        params(
          current_period:
            XTwitterScraper::Models::AccountRetrieveResponse::CurrentPeriod::OrHash
        ).void
      end
      attr_writer :current_period

      sig do
        params(
          monitors_allowed: Integer,
          monitors_used: Integer,
          plan:
            XTwitterScraper::Models::AccountRetrieveResponse::Plan::OrSymbol,
          current_period:
            XTwitterScraper::Models::AccountRetrieveResponse::CurrentPeriod::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        monitors_allowed:,
        monitors_used:,
        plan:,
        current_period: nil
      )
      end

      sig do
        override.returns(
          {
            monitors_allowed: Integer,
            monitors_used: Integer,
            plan:
              XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol,
            current_period:
              XTwitterScraper::Models::AccountRetrieveResponse::CurrentPeriod
          }
        )
      end
      def to_hash
      end

      module Plan
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::AccountRetrieveResponse::Plan
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(
            :active,
            XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol
          )
        INACTIVE =
          T.let(
            :inactive,
            XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class CurrentPeriod < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::AccountRetrieveResponse::CurrentPeriod,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Time) }
        attr_accessor :end_

        sig { returns(Time) }
        attr_accessor :start

        sig { returns(Float) }
        attr_accessor :usage_percent

        sig do
          params(end_: Time, start: Time, usage_percent: Float).returns(
            T.attached_class
          )
        end
        def self.new(end_:, start:, usage_percent:)
        end

        sig do
          override.returns({ end_: Time, start: Time, usage_percent: Float })
        end
        def to_hash
        end
      end
    end
  end
end
