# typed: strong

module XTwitterScraper
  module Models
    class SubscribeCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::SubscribeCreateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Subscription tier to pre-select.
      sig do
        returns(
          T.nilable(XTwitterScraper::SubscribeCreateParams::Tier::OrSymbol)
        )
      end
      attr_reader :tier

      sig do
        params(
          tier: XTwitterScraper::SubscribeCreateParams::Tier::OrSymbol
        ).void
      end
      attr_writer :tier

      sig do
        params(
          tier: XTwitterScraper::SubscribeCreateParams::Tier::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Subscription tier to pre-select.
        tier: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            tier: XTwitterScraper::SubscribeCreateParams::Tier::OrSymbol,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Subscription tier to pre-select.
      module Tier
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::SubscribeCreateParams::Tier)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STARTER =
          T.let(
            :starter,
            XTwitterScraper::SubscribeCreateParams::Tier::TaggedSymbol
          )
        PRO =
          T.let(
            :pro,
            XTwitterScraper::SubscribeCreateParams::Tier::TaggedSymbol
          )
        BUSINESS =
          T.let(
            :business,
            XTwitterScraper::SubscribeCreateParams::Tier::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::SubscribeCreateParams::Tier::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
