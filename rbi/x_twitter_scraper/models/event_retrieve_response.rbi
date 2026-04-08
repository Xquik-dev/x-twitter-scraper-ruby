# typed: strong

module XTwitterScraper
  module Models
    class EventRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::EventRetrieveResponse,
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

      # Type of monitor event fired when account activity occurs.
      sig do
        returns(
          XTwitterScraper::Models::EventRetrieveResponse::Type::TaggedSymbol
        )
      end
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :username

      sig { returns(T.nilable(String)) }
      attr_reader :x_event_id

      sig { params(x_event_id: String).void }
      attr_writer :x_event_id

      # Full monitor event including payload data and optional X event ID.
      sig do
        params(
          id: String,
          data: T::Hash[Symbol, T.anything],
          monitor_id: String,
          occurred_at: Time,
          type: XTwitterScraper::Models::EventRetrieveResponse::Type::OrSymbol,
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
        # Type of monitor event fired when account activity occurs.
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
            type:
              XTwitterScraper::Models::EventRetrieveResponse::Type::TaggedSymbol,
            username: String,
            x_event_id: String
          }
        )
      end
      def to_hash
      end

      # Type of monitor event fired when account activity occurs.
      module Type
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::EventRetrieveResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWEET_NEW =
          T.let(
            :"tweet.new",
            XTwitterScraper::Models::EventRetrieveResponse::Type::TaggedSymbol
          )
        TWEET_REPLY =
          T.let(
            :"tweet.reply",
            XTwitterScraper::Models::EventRetrieveResponse::Type::TaggedSymbol
          )
        TWEET_RETWEET =
          T.let(
            :"tweet.retweet",
            XTwitterScraper::Models::EventRetrieveResponse::Type::TaggedSymbol
          )
        TWEET_QUOTE =
          T.let(
            :"tweet.quote",
            XTwitterScraper::Models::EventRetrieveResponse::Type::TaggedSymbol
          )
        FOLLOWER_GAINED =
          T.let(
            :"follower.gained",
            XTwitterScraper::Models::EventRetrieveResponse::Type::TaggedSymbol
          )
        FOLLOWER_LOST =
          T.let(
            :"follower.lost",
            XTwitterScraper::Models::EventRetrieveResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::EventRetrieveResponse::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
