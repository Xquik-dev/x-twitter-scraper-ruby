# typed: strong

module XTwitterScraper
  module Models
    class EventListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::EventListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig do
        returns(T::Array[XTwitterScraper::Models::EventListResponse::Event])
      end
      attr_accessor :events

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      sig do
        params(
          events:
            T::Array[XTwitterScraper::Models::EventListResponse::Event::OrHash],
          has_more: T::Boolean,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(events:, has_more:, next_cursor: nil)
      end

      sig do
        override.returns(
          {
            events: T::Array[XTwitterScraper::Models::EventListResponse::Event],
            has_more: T::Boolean,
            next_cursor: String
          }
        )
      end
      def to_hash
      end

      class Event < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::EventListResponse::Event,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T::Hash[Symbol, T.anything]) }
        attr_accessor :data

        sig { returns(String) }
        attr_accessor :monitor_id

        sig { returns(Time) }
        attr_accessor :occurred_at

        # Type of monitor event fired when account activity occurs.
        sig do
          returns(
            XTwitterScraper::Models::EventListResponse::Event::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig { returns(String) }
        attr_accessor :username

        # Monitor event summary with type, username, and occurrence time.
        sig do
          params(
            id: String,
            data: T::Hash[Symbol, T.anything],
            monitor_id: String,
            occurred_at: Time,
            type:
              XTwitterScraper::Models::EventListResponse::Event::Type::OrSymbol,
            username: String
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          data:,
          monitor_id:,
          occurred_at:,
          # Type of monitor event fired when account activity occurs.
          type:,
          username:
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
                XTwitterScraper::Models::EventListResponse::Event::Type::TaggedSymbol,
              username: String
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
              T.all(
                Symbol,
                XTwitterScraper::Models::EventListResponse::Event::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TWEET_NEW =
            T.let(
              :"tweet.new",
              XTwitterScraper::Models::EventListResponse::Event::Type::TaggedSymbol
            )
          TWEET_REPLY =
            T.let(
              :"tweet.reply",
              XTwitterScraper::Models::EventListResponse::Event::Type::TaggedSymbol
            )
          TWEET_RETWEET =
            T.let(
              :"tweet.retweet",
              XTwitterScraper::Models::EventListResponse::Event::Type::TaggedSymbol
            )
          TWEET_QUOTE =
            T.let(
              :"tweet.quote",
              XTwitterScraper::Models::EventListResponse::Event::Type::TaggedSymbol
            )
          FOLLOWER_GAINED =
            T.let(
              :"follower.gained",
              XTwitterScraper::Models::EventListResponse::Event::Type::TaggedSymbol
            )
          FOLLOWER_LOST =
            T.let(
              :"follower.lost",
              XTwitterScraper::Models::EventListResponse::Event::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::EventListResponse::Event::Type::TaggedSymbol
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
