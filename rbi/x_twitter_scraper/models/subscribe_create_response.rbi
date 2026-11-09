# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class SubscribeCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::SubscribeCreateResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :message

      sig do
        returns(
          XTwitterScraper::Models::SubscribeCreateResponse::Status::TaggedSymbol
        )
      end
      attr_accessor :status

      sig { returns(String) }
      attr_accessor :url

      # Currency the checkout charges. Only a checkout_created answer has it.
      sig do
        returns(T.nilable(XTwitterScraper::Models::Currency::TaggedSymbol))
      end
      attr_reader :charged_currency

      sig do
        params(
          charged_currency: XTwitterScraper::Models::Currency::OrSymbol
        ).void
      end
      attr_writer :charged_currency

      sig do
        params(
          message: String,
          status:
            XTwitterScraper::Models::SubscribeCreateResponse::Status::OrSymbol,
          url: String,
          charged_currency: XTwitterScraper::Models::Currency::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        message:,
        status:,
        url:,
        # Currency the checkout charges. Only a checkout_created answer has it.
        charged_currency: nil
      )
      end

      sig do
        override.returns(
          {
            message: String,
            status:
              XTwitterScraper::Models::SubscribeCreateResponse::Status::TaggedSymbol,
            url: String,
            charged_currency: XTwitterScraper::Models::Currency::TaggedSymbol
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
              XTwitterScraper::Models::SubscribeCreateResponse::Status
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CHECKOUT_CREATED =
          T.let(
            :checkout_created,
            XTwitterScraper::Models::SubscribeCreateResponse::Status::TaggedSymbol
          )
        ALREADY_SUBSCRIBED =
          T.let(
            :already_subscribed,
            XTwitterScraper::Models::SubscribeCreateResponse::Status::TaggedSymbol
          )
        PAYMENT_ISSUE =
          T.let(
            :payment_issue,
            XTwitterScraper::Models::SubscribeCreateResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::SubscribeCreateResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
