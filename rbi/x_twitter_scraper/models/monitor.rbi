# typed: strong

module XTwitterScraper
  module Models
    class Monitor < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::Monitor, XTwitterScraper::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      # Array of event types to subscribe to.
      sig { returns(T::Array[XTwitterScraper::Monitor::EventType::OrSymbol]) }
      attr_accessor :event_types

      sig { returns(T::Boolean) }
      attr_accessor :is_active

      sig { returns(String) }
      attr_accessor :username

      sig { returns(String) }
      attr_accessor :x_user_id

      # Account monitor that tracks activity for a given X user.
      sig do
        params(
          id: String,
          created_at: Time,
          event_types: T::Array[XTwitterScraper::Monitor::EventType::OrSymbol],
          is_active: T::Boolean,
          username: String,
          x_user_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        # Array of event types to subscribe to.
        event_types:,
        is_active:,
        username:,
        x_user_id:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            event_types:
              T::Array[XTwitterScraper::Monitor::EventType::OrSymbol],
            is_active: T::Boolean,
            username: String,
            x_user_id: String
          }
        )
      end
      def to_hash
      end

      # Type of monitor event fired when account activity occurs.
      module EventType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::Monitor::EventType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWEET_NEW =
          T.let(:"tweet.new", XTwitterScraper::Monitor::EventType::TaggedSymbol)
        TWEET_REPLY =
          T.let(
            :"tweet.reply",
            XTwitterScraper::Monitor::EventType::TaggedSymbol
          )
        TWEET_RETWEET =
          T.let(
            :"tweet.retweet",
            XTwitterScraper::Monitor::EventType::TaggedSymbol
          )
        TWEET_QUOTE =
          T.let(
            :"tweet.quote",
            XTwitterScraper::Monitor::EventType::TaggedSymbol
          )
        FOLLOWER_GAINED =
          T.let(
            :"follower.gained",
            XTwitterScraper::Monitor::EventType::TaggedSymbol
          )
        FOLLOWER_LOST =
          T.let(
            :"follower.lost",
            XTwitterScraper::Monitor::EventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::Monitor::EventType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
