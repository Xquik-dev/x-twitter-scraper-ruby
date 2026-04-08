# typed: strong

module XTwitterScraper
  module Models
    class EventListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::EventListParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Cursor for keyset pagination
      sig { returns(T.nilable(String)) }
      attr_reader :after

      sig { params(after: String).void }
      attr_writer :after

      # Filter events by type
      sig do
        returns(
          T.nilable(XTwitterScraper::EventListParams::EventType::OrSymbol)
        )
      end
      attr_reader :event_type

      sig do
        params(
          event_type: XTwitterScraper::EventListParams::EventType::OrSymbol
        ).void
      end
      attr_writer :event_type

      # Maximum number of items to return (1-100, default 50)
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter events by monitor ID
      sig { returns(T.nilable(String)) }
      attr_reader :monitor_id

      sig { params(monitor_id: String).void }
      attr_writer :monitor_id

      sig do
        params(
          after: String,
          event_type: XTwitterScraper::EventListParams::EventType::OrSymbol,
          limit: Integer,
          monitor_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor for keyset pagination
        after: nil,
        # Filter events by type
        event_type: nil,
        # Maximum number of items to return (1-100, default 50)
        limit: nil,
        # Filter events by monitor ID
        monitor_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            after: String,
            event_type: XTwitterScraper::EventListParams::EventType::OrSymbol,
            limit: Integer,
            monitor_id: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter events by type
      module EventType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::EventListParams::EventType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWEET_NEW =
          T.let(
            :"tweet.new",
            XTwitterScraper::EventListParams::EventType::TaggedSymbol
          )
        TWEET_REPLY =
          T.let(
            :"tweet.reply",
            XTwitterScraper::EventListParams::EventType::TaggedSymbol
          )
        TWEET_RETWEET =
          T.let(
            :"tweet.retweet",
            XTwitterScraper::EventListParams::EventType::TaggedSymbol
          )
        TWEET_QUOTE =
          T.let(
            :"tweet.quote",
            XTwitterScraper::EventListParams::EventType::TaggedSymbol
          )
        FOLLOWER_GAINED =
          T.let(
            :"follower.gained",
            XTwitterScraper::EventListParams::EventType::TaggedSymbol
          )
        FOLLOWER_LOST =
          T.let(
            :"follower.lost",
            XTwitterScraper::EventListParams::EventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::EventListParams::EventType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
