# typed: strong

module XTwitterScraper
  module Models
    class MonitorUpdateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::MonitorUpdateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig do
        returns(
          T.nilable(
            T::Array[XTwitterScraper::MonitorUpdateParams::EventType::OrSymbol]
          )
        )
      end
      attr_reader :event_types

      sig do
        params(
          event_types:
            T::Array[XTwitterScraper::MonitorUpdateParams::EventType::OrSymbol]
        ).void
      end
      attr_writer :event_types

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_active

      sig { params(is_active: T::Boolean).void }
      attr_writer :is_active

      sig do
        params(
          id: String,
          event_types:
            T::Array[XTwitterScraper::MonitorUpdateParams::EventType::OrSymbol],
          is_active: T::Boolean,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(id:, event_types: nil, is_active: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            id: String,
            event_types:
              T::Array[
                XTwitterScraper::MonitorUpdateParams::EventType::OrSymbol
              ],
            is_active: T::Boolean,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      module EventType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::MonitorUpdateParams::EventType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWEET_NEW =
          T.let(
            :"tweet.new",
            XTwitterScraper::MonitorUpdateParams::EventType::TaggedSymbol
          )
        TWEET_REPLY =
          T.let(
            :"tweet.reply",
            XTwitterScraper::MonitorUpdateParams::EventType::TaggedSymbol
          )
        TWEET_RETWEET =
          T.let(
            :"tweet.retweet",
            XTwitterScraper::MonitorUpdateParams::EventType::TaggedSymbol
          )
        TWEET_QUOTE =
          T.let(
            :"tweet.quote",
            XTwitterScraper::MonitorUpdateParams::EventType::TaggedSymbol
          )
        FOLLOWER_GAINED =
          T.let(
            :"follower.gained",
            XTwitterScraper::MonitorUpdateParams::EventType::TaggedSymbol
          )
        FOLLOWER_LOST =
          T.let(
            :"follower.lost",
            XTwitterScraper::MonitorUpdateParams::EventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::MonitorUpdateParams::EventType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
