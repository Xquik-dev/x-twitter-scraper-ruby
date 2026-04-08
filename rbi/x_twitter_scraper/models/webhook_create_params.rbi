# typed: strong

module XTwitterScraper
  module Models
    class WebhookCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::WebhookCreateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Array of event types to subscribe to.
      sig do
        returns(
          T::Array[XTwitterScraper::WebhookCreateParams::EventType::OrSymbol]
        )
      end
      attr_accessor :event_types

      # HTTPS URL
      sig { returns(String) }
      attr_accessor :url

      sig do
        params(
          event_types:
            T::Array[XTwitterScraper::WebhookCreateParams::EventType::OrSymbol],
          url: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of event types to subscribe to.
        event_types:,
        # HTTPS URL
        url:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            event_types:
              T::Array[
                XTwitterScraper::WebhookCreateParams::EventType::OrSymbol
              ],
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
            T.all(Symbol, XTwitterScraper::WebhookCreateParams::EventType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWEET_NEW =
          T.let(
            :"tweet.new",
            XTwitterScraper::WebhookCreateParams::EventType::TaggedSymbol
          )
        TWEET_REPLY =
          T.let(
            :"tweet.reply",
            XTwitterScraper::WebhookCreateParams::EventType::TaggedSymbol
          )
        TWEET_RETWEET =
          T.let(
            :"tweet.retweet",
            XTwitterScraper::WebhookCreateParams::EventType::TaggedSymbol
          )
        TWEET_QUOTE =
          T.let(
            :"tweet.quote",
            XTwitterScraper::WebhookCreateParams::EventType::TaggedSymbol
          )
        FOLLOWER_GAINED =
          T.let(
            :"follower.gained",
            XTwitterScraper::WebhookCreateParams::EventType::TaggedSymbol
          )
        FOLLOWER_LOST =
          T.let(
            :"follower.lost",
            XTwitterScraper::WebhookCreateParams::EventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::WebhookCreateParams::EventType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
