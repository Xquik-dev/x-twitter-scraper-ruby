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
      attr_accessor :url

      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::SubscribeCreateResponse::Status::TaggedSymbol
          )
        )
      end
      attr_reader :status

      sig do
        params(
          status:
            XTwitterScraper::Models::SubscribeCreateResponse::Status::OrSymbol
        ).void
      end
      attr_writer :status

      sig do
        params(
          url: String,
          message: String,
          status:
            XTwitterScraper::Models::SubscribeCreateResponse::Status::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(url:, message: nil, status: nil)
      end

      sig do
        override.returns(
          {
            url: String,
            message: String,
            status:
              XTwitterScraper::Models::SubscribeCreateResponse::Status::TaggedSymbol
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
