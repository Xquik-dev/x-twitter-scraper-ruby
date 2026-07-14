# typed: strong

module XTwitterScraper
  module Models
    class CreditRetrieveTopupStatusResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CreditRetrieveTopupStatusResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig do
        returns(
          XTwitterScraper::Models::CreditRetrieveTopupStatusResponse::Status::TaggedSymbol
        )
      end
      attr_accessor :status

      # Dollar amount requested for the top-up.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :amount_dollars

      # Bigint string credit amount granted or pending.
      sig { returns(T.nilable(String)) }
      attr_reader :credits

      sig { params(credits: String).void }
      attr_writer :credits

      sig do
        params(
          status:
            XTwitterScraper::Models::CreditRetrieveTopupStatusResponse::Status::OrSymbol,
          amount_dollars: T.nilable(Integer),
          credits: String
        ).returns(T.attached_class)
      end
      def self.new(
        status:,
        # Dollar amount requested for the top-up.
        amount_dollars: nil,
        # Bigint string credit amount granted or pending.
        credits: nil
      )
      end

      sig do
        override.returns(
          {
            status:
              XTwitterScraper::Models::CreditRetrieveTopupStatusResponse::Status::TaggedSymbol,
            amount_dollars: T.nilable(Integer),
            credits: String
          }
        )
      end
      def to_hash
      end

      module Status
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::CreditRetrieveTopupStatusResponse::Status
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PAID =
          T.let(
            :paid,
            XTwitterScraper::Models::CreditRetrieveTopupStatusResponse::Status::TaggedSymbol
          )
        PROCESSING =
          T.let(
            :processing,
            XTwitterScraper::Models::CreditRetrieveTopupStatusResponse::Status::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            XTwitterScraper::Models::CreditRetrieveTopupStatusResponse::Status::TaggedSymbol
          )
        EXPIRED =
          T.let(
            :expired,
            XTwitterScraper::Models::CreditRetrieveTopupStatusResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::CreditRetrieveTopupStatusResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
