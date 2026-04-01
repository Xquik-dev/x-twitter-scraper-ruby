# typed: strong

module XTwitterScraper
  module Models
    class WebhookUpdateResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::WebhookUpdateResponse,
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
            XTwitterScraper::Models::WebhookUpdateResponse::EventType::TaggedSymbol
          ]
        )
      end
      attr_accessor :event_types

      sig { returns(T::Boolean) }
      attr_accessor :is_active

      sig { returns(String) }
      attr_accessor :url

      sig do
        params(
          id: String,
          created_at: Time,
          event_types:
            T::Array[
              XTwitterScraper::Models::WebhookUpdateResponse::EventType::OrSymbol
            ],
          is_active: T::Boolean,
          url: String
        ).returns(T.attached_class)
      end
      def self.new(id:, created_at:, event_types:, is_active:, url:)
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            event_types:
              T::Array[
                XTwitterScraper::Models::WebhookUpdateResponse::EventType::TaggedSymbol
              ],
            is_active: T::Boolean,
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
              XTwitterScraper::Models::WebhookUpdateResponse::EventType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWEET_NEW =
          T.let(
            :"tweet.new",
            XTwitterScraper::Models::WebhookUpdateResponse::EventType::TaggedSymbol
          )
        TWEET_REPLY =
          T.let(
            :"tweet.reply",
            XTwitterScraper::Models::WebhookUpdateResponse::EventType::TaggedSymbol
          )
        TWEET_RETWEET =
          T.let(
            :"tweet.retweet",
            XTwitterScraper::Models::WebhookUpdateResponse::EventType::TaggedSymbol
          )
        TWEET_QUOTE =
          T.let(
            :"tweet.quote",
            XTwitterScraper::Models::WebhookUpdateResponse::EventType::TaggedSymbol
          )
        FOLLOWER_GAINED =
          T.let(
            :"follower.gained",
            XTwitterScraper::Models::WebhookUpdateResponse::EventType::TaggedSymbol
          )
        FOLLOWER_LOST =
          T.let(
            :"follower.lost",
            XTwitterScraper::Models::WebhookUpdateResponse::EventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::WebhookUpdateResponse::EventType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
