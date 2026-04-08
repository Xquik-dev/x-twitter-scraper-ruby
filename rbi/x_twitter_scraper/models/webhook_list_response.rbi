# typed: strong

module XTwitterScraper
  module Models
    class WebhookListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::WebhookListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig do
        returns(T::Array[XTwitterScraper::Models::WebhookListResponse::Webhook])
      end
      attr_accessor :webhooks

      sig do
        params(
          webhooks:
            T::Array[
              XTwitterScraper::Models::WebhookListResponse::Webhook::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(webhooks:)
      end

      sig do
        override.returns(
          {
            webhooks:
              T::Array[XTwitterScraper::Models::WebhookListResponse::Webhook]
          }
        )
      end
      def to_hash
      end

      class Webhook < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::WebhookListResponse::Webhook,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        # Array of event types to subscribe to.
        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::WebhookListResponse::Webhook::EventType::TaggedSymbol
            ]
          )
        end
        attr_accessor :event_types

        sig { returns(T::Boolean) }
        attr_accessor :is_active

        sig { returns(String) }
        attr_accessor :url

        # Webhook endpoint registered to receive event deliveries.
        sig do
          params(
            id: String,
            created_at: Time,
            event_types:
              T::Array[
                XTwitterScraper::Models::WebhookListResponse::Webhook::EventType::OrSymbol
              ],
            is_active: T::Boolean,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          # Array of event types to subscribe to.
          event_types:,
          is_active:,
          url:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              event_types:
                T::Array[
                  XTwitterScraper::Models::WebhookListResponse::Webhook::EventType::TaggedSymbol
                ],
              is_active: T::Boolean,
              url: String
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
              T.all(
                Symbol,
                XTwitterScraper::Models::WebhookListResponse::Webhook::EventType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TWEET_NEW =
            T.let(
              :"tweet.new",
              XTwitterScraper::Models::WebhookListResponse::Webhook::EventType::TaggedSymbol
            )
          TWEET_REPLY =
            T.let(
              :"tweet.reply",
              XTwitterScraper::Models::WebhookListResponse::Webhook::EventType::TaggedSymbol
            )
          TWEET_RETWEET =
            T.let(
              :"tweet.retweet",
              XTwitterScraper::Models::WebhookListResponse::Webhook::EventType::TaggedSymbol
            )
          TWEET_QUOTE =
            T.let(
              :"tweet.quote",
              XTwitterScraper::Models::WebhookListResponse::Webhook::EventType::TaggedSymbol
            )
          FOLLOWER_GAINED =
            T.let(
              :"follower.gained",
              XTwitterScraper::Models::WebhookListResponse::Webhook::EventType::TaggedSymbol
            )
          FOLLOWER_LOST =
            T.let(
              :"follower.lost",
              XTwitterScraper::Models::WebhookListResponse::Webhook::EventType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::WebhookListResponse::Webhook::EventType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
