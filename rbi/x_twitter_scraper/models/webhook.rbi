# typed: strong

module XTwitterScraper
  module Models
    class Webhook < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::Webhook, XTwitterScraper::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(T::Array[XTwitterScraper::Webhook::EventType::OrSymbol]) }
      attr_accessor :event_types

      sig { returns(T::Boolean) }
      attr_accessor :is_active

      sig { returns(String) }
      attr_accessor :url

      sig do
        params(
          id: String,
          created_at: Time,
          event_types: T::Array[XTwitterScraper::Webhook::EventType::OrSymbol],
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
              T::Array[XTwitterScraper::Webhook::EventType::OrSymbol],
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
          T.type_alias { T.all(Symbol, XTwitterScraper::Webhook::EventType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWEET_NEW =
          T.let(:"tweet.new", XTwitterScraper::Webhook::EventType::TaggedSymbol)
        TWEET_REPLY =
          T.let(
            :"tweet.reply",
            XTwitterScraper::Webhook::EventType::TaggedSymbol
          )
        TWEET_RETWEET =
          T.let(
            :"tweet.retweet",
            XTwitterScraper::Webhook::EventType::TaggedSymbol
          )
        TWEET_QUOTE =
          T.let(
            :"tweet.quote",
            XTwitterScraper::Webhook::EventType::TaggedSymbol
          )
        FOLLOWER_GAINED =
          T.let(
            :"follower.gained",
            XTwitterScraper::Webhook::EventType::TaggedSymbol
          )
        FOLLOWER_LOST =
          T.let(
            :"follower.lost",
            XTwitterScraper::Webhook::EventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::Webhook::EventType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
