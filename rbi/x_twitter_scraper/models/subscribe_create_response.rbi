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

      sig do
        params(
          message: String,
          status:
            XTwitterScraper::Models::SubscribeCreateResponse::Status::OrSymbol,
          url: String
        ).returns(T.attached_class)
      end
      def self.new(message:, status:, url:)
      end

      sig do
        override.returns(
          {
            message: String,
            status:
              XTwitterScraper::Models::SubscribeCreateResponse::Status::TaggedSymbol,
            url: String
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
