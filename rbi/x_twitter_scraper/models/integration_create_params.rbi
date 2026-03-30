# typed: strong

module XTwitterScraper
  module Models
    class IntegrationCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::IntegrationCreateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Integration config (e.g. Telegram chatId)
      sig { returns(XTwitterScraper::IntegrationCreateParams::Config) }
      attr_reader :config

      sig do
        params(
          config: XTwitterScraper::IntegrationCreateParams::Config::OrHash
        ).void
      end
      attr_writer :config

      sig { returns(T::Array[XTwitterScraper::EventType::OrSymbol]) }
      attr_accessor :event_types

      sig { returns(String) }
      attr_accessor :name

      sig { returns(XTwitterScraper::IntegrationCreateParams::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          config: XTwitterScraper::IntegrationCreateParams::Config::OrHash,
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          name: String,
          type: XTwitterScraper::IntegrationCreateParams::Type::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Integration config (e.g. Telegram chatId)
        config:,
        event_types:,
        name:,
        type:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            config: XTwitterScraper::IntegrationCreateParams::Config,
            event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
            name: String,
            type: XTwitterScraper::IntegrationCreateParams::Type::OrSymbol,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Config < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::IntegrationCreateParams::Config,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :chat_id

        # Integration config (e.g. Telegram chatId)
        sig { params(chat_id: String).returns(T.attached_class) }
        def self.new(chat_id:)
        end

        sig { override.returns({ chat_id: String }) }
        def to_hash
        end
      end

      module Type
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::IntegrationCreateParams::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TELEGRAM =
          T.let(
            :telegram,
            XTwitterScraper::IntegrationCreateParams::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::IntegrationCreateParams::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
