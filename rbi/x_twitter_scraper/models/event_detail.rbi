# typed: strong

module XTwitterScraper
  module Models
    class EventDetail < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::EventDetail,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Event payload — shape varies by event type (JSON)
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :data

      sig { returns(String) }
      attr_accessor :monitor_id

      sig { returns(Time) }
      attr_accessor :occurred_at

      sig { returns(XTwitterScraper::EventDetail::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :username

      sig { returns(T.nilable(String)) }
      attr_reader :x_event_id

      sig { params(x_event_id: String).void }
      attr_writer :x_event_id

      sig do
        params(
          id: String,
          data: T::Hash[Symbol, T.anything],
          monitor_id: String,
          occurred_at: Time,
          type: XTwitterScraper::EventDetail::Type::OrSymbol,
          username: String,
          x_event_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Event payload — shape varies by event type (JSON)
        data:,
        monitor_id:,
        occurred_at:,
        type:,
        username:,
        x_event_id: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            data: T::Hash[Symbol, T.anything],
            monitor_id: String,
            occurred_at: Time,
            type: XTwitterScraper::EventDetail::Type::OrSymbol,
            username: String,
            x_event_id: String
          }
        )
      end
      def to_hash
      end

      module Type
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::EventDetail::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWEET_NEW =
          T.let(:"tweet.new", XTwitterScraper::EventDetail::Type::TaggedSymbol)
        TWEET_REPLY =
          T.let(
            :"tweet.reply",
            XTwitterScraper::EventDetail::Type::TaggedSymbol
          )
        TWEET_RETWEET =
          T.let(
            :"tweet.retweet",
            XTwitterScraper::EventDetail::Type::TaggedSymbol
          )
        TWEET_QUOTE =
          T.let(
            :"tweet.quote",
            XTwitterScraper::EventDetail::Type::TaggedSymbol
          )
        FOLLOWER_GAINED =
          T.let(
            :"follower.gained",
            XTwitterScraper::EventDetail::Type::TaggedSymbol
          )
        FOLLOWER_LOST =
          T.let(
            :"follower.lost",
            XTwitterScraper::EventDetail::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::EventDetail::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
