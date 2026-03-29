# typed: strong

module XTwitterScraper
  module Models
    class MonitorCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::MonitorCreateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig do
        returns(
          T::Array[XTwitterScraper::MonitorCreateParams::EventType::OrSymbol]
        )
      end
      attr_accessor :event_types

      # X username (without @)
      sig { returns(String) }
      attr_accessor :username

      sig do
        params(
          event_types:
            T::Array[XTwitterScraper::MonitorCreateParams::EventType::OrSymbol],
          username: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        event_types:,
        # X username (without @)
        username:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            event_types:
              T::Array[
                XTwitterScraper::MonitorCreateParams::EventType::OrSymbol
              ],
            username: String,
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
            T.all(Symbol, XTwitterScraper::MonitorCreateParams::EventType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWEET_NEW =
          T.let(
            :"tweet.new",
            XTwitterScraper::MonitorCreateParams::EventType::TaggedSymbol
          )
        TWEET_REPLY =
          T.let(
            :"tweet.reply",
            XTwitterScraper::MonitorCreateParams::EventType::TaggedSymbol
          )
        TWEET_RETWEET =
          T.let(
            :"tweet.retweet",
            XTwitterScraper::MonitorCreateParams::EventType::TaggedSymbol
          )
        TWEET_QUOTE =
          T.let(
            :"tweet.quote",
            XTwitterScraper::MonitorCreateParams::EventType::TaggedSymbol
          )
        FOLLOWER_GAINED =
          T.let(
            :"follower.gained",
            XTwitterScraper::MonitorCreateParams::EventType::TaggedSymbol
          )
        FOLLOWER_LOST =
          T.let(
            :"follower.lost",
            XTwitterScraper::MonitorCreateParams::EventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::MonitorCreateParams::EventType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
