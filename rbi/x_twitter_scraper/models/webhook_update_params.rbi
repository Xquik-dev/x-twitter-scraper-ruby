# typed: strong

module XTwitterScraper
  module Models
    class WebhookUpdateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::WebhookUpdateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Array of event types to subscribe to.
      sig do
        returns(
          T.nilable(
            T::Array[XTwitterScraper::WebhookUpdateParams::EventType::OrSymbol]
          )
        )
      end
      attr_reader :event_types

      sig do
        params(
          event_types:
            T::Array[XTwitterScraper::WebhookUpdateParams::EventType::OrSymbol]
        ).void
      end
      attr_writer :event_types

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_active

      sig { params(is_active: T::Boolean).void }
      attr_writer :is_active

      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig do
        params(
          id: String,
          event_types:
            T::Array[XTwitterScraper::WebhookUpdateParams::EventType::OrSymbol],
          is_active: T::Boolean,
          url: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Array of event types to subscribe to.
        event_types: nil,
        is_active: nil,
        url: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            event_types:
              T::Array[
                XTwitterScraper::WebhookUpdateParams::EventType::OrSymbol
              ],
            is_active: T::Boolean,
            url: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Type of monitor event fired when account activity occurs.
      module EventType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::WebhookUpdateParams::EventType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWEET_NEW =
          T.let(
            :"tweet.new",
            XTwitterScraper::WebhookUpdateParams::EventType::TaggedSymbol
          )
        TWEET_REPLY =
          T.let(
            :"tweet.reply",
            XTwitterScraper::WebhookUpdateParams::EventType::TaggedSymbol
          )
        TWEET_RETWEET =
          T.let(
            :"tweet.retweet",
            XTwitterScraper::WebhookUpdateParams::EventType::TaggedSymbol
          )
        TWEET_QUOTE =
          T.let(
            :"tweet.quote",
            XTwitterScraper::WebhookUpdateParams::EventType::TaggedSymbol
          )
        FOLLOWER_GAINED =
          T.let(
            :"follower.gained",
            XTwitterScraper::WebhookUpdateParams::EventType::TaggedSymbol
          )
        FOLLOWER_LOST =
          T.let(
            :"follower.lost",
            XTwitterScraper::WebhookUpdateParams::EventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::WebhookUpdateParams::EventType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
