# typed: strong

module XTwitterScraper
  module Models
    class WebhookCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::WebhookCreateResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig do
        returns(
          T::Array[
            XTwitterScraper::Models::WebhookCreateResponse::EventType::TaggedSymbol
          ]
        )
      end
      attr_accessor :event_types

      sig { returns(String) }
      attr_accessor :secret

      sig { returns(String) }
      attr_accessor :url

      sig do
        params(
          id: String,
          created_at: Time,
          event_types:
            T::Array[
              XTwitterScraper::Models::WebhookCreateResponse::EventType::OrSymbol
            ],
          secret: String,
          url: String
        ).returns(T.attached_class)
      end
      def self.new(id:, created_at:, event_types:, secret:, url:)
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            event_types:
              T::Array[
                XTwitterScraper::Models::WebhookCreateResponse::EventType::TaggedSymbol
              ],
            secret: String,
            url: String
          }
        )
      end
      def to_hash
      end

      module EventType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::WebhookCreateResponse::EventType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWEET_NEW =
          T.let(
            :"tweet.new",
            XTwitterScraper::Models::WebhookCreateResponse::EventType::TaggedSymbol
          )
        TWEET_REPLY =
          T.let(
            :"tweet.reply",
            XTwitterScraper::Models::WebhookCreateResponse::EventType::TaggedSymbol
          )
        TWEET_RETWEET =
          T.let(
            :"tweet.retweet",
            XTwitterScraper::Models::WebhookCreateResponse::EventType::TaggedSymbol
          )
        TWEET_QUOTE =
          T.let(
            :"tweet.quote",
            XTwitterScraper::Models::WebhookCreateResponse::EventType::TaggedSymbol
          )
        FOLLOWER_GAINED =
          T.let(
            :"follower.gained",
            XTwitterScraper::Models::WebhookCreateResponse::EventType::TaggedSymbol
          )
        FOLLOWER_LOST =
          T.let(
            :"follower.lost",
            XTwitterScraper::Models::WebhookCreateResponse::EventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::WebhookCreateResponse::EventType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
