# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

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

      # Currency the checkout charged.
      sig { returns(T.nilable(XTwitterScraper::Models::Currency::TaggedSymbol)) }
      attr_reader :charged_currency

      sig { params(charged_currency: XTwitterScraper::Models::Currency::OrSymbol).void }
      attr_writer :charged_currency

      # Amount the checkout charged before tax, in the currency's smallest unit. JPY and
      # KRW have no decimals, so 1580 JPY is ¥1,580.
      sig { returns(T.nilable(Integer)) }
      attr_reader :charged_minor_units

      sig { params(charged_minor_units: Integer).void }
      attr_writer :charged_minor_units

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
          charged_currency: XTwitterScraper::Models::Currency::OrSymbol, charged_minor_units: Integer, credits: String
        ).returns(T.attached_class)
      end
      def self.new(
        status:,
        # Dollar amount requested for the top-up.
        amount_dollars: nil,
# Currency the checkout charged.
charged_currency: nil,
# Amount the checkout charged before tax, in the currency's smallest unit. JPY and
# KRW have no decimals, so 1580 JPY is ¥1,580.
charged_minor_units: nil,
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
            charged_currency: XTwitterScraper::Models::Currency::TaggedSymbol, charged_minor_units: Integer, credits: String
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
