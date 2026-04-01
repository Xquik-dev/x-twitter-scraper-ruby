# typed: strong

module XTwitterScraper
  module Models
    class MonitorCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::MonitorCreateResponse,
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
            XTwitterScraper::Models::MonitorCreateResponse::EventType::TaggedSymbol
          ]
        )
      end
      attr_accessor :event_types

      sig { returns(String) }
      attr_accessor :username

      sig { returns(String) }
      attr_accessor :x_user_id

      sig do
        params(
          id: String,
          created_at: Time,
          event_types:
            T::Array[
              XTwitterScraper::Models::MonitorCreateResponse::EventType::OrSymbol
            ],
          username: String,
          x_user_id: String
        ).returns(T.attached_class)
      end
      def self.new(id:, created_at:, event_types:, username:, x_user_id:)
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            event_types:
              T::Array[
                XTwitterScraper::Models::MonitorCreateResponse::EventType::TaggedSymbol
              ],
            username: String,
            x_user_id: String
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
              XTwitterScraper::Models::MonitorCreateResponse::EventType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWEET_NEW =
          T.let(
            :"tweet.new",
            XTwitterScraper::Models::MonitorCreateResponse::EventType::TaggedSymbol
          )
        TWEET_REPLY =
          T.let(
            :"tweet.reply",
            XTwitterScraper::Models::MonitorCreateResponse::EventType::TaggedSymbol
          )
        TWEET_RETWEET =
          T.let(
            :"tweet.retweet",
            XTwitterScraper::Models::MonitorCreateResponse::EventType::TaggedSymbol
          )
        TWEET_QUOTE =
          T.let(
            :"tweet.quote",
            XTwitterScraper::Models::MonitorCreateResponse::EventType::TaggedSymbol
          )
        FOLLOWER_GAINED =
          T.let(
            :"follower.gained",
            XTwitterScraper::Models::MonitorCreateResponse::EventType::TaggedSymbol
          )
        FOLLOWER_LOST =
          T.let(
            :"follower.lost",
            XTwitterScraper::Models::MonitorCreateResponse::EventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::MonitorCreateResponse::EventType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
