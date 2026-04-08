# typed: strong

module XTwitterScraper
  module Models
    class MonitorListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::MonitorListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig do
        returns(T::Array[XTwitterScraper::Models::MonitorListResponse::Monitor])
      end
      attr_accessor :monitors

      sig { returns(Integer) }
      attr_accessor :total

      sig do
        params(
          monitors:
            T::Array[
              XTwitterScraper::Models::MonitorListResponse::Monitor::OrHash
            ],
          total: Integer
        ).returns(T.attached_class)
      end
      def self.new(monitors:, total:)
      end

      sig do
        override.returns(
          {
            monitors:
              T::Array[XTwitterScraper::Models::MonitorListResponse::Monitor],
            total: Integer
          }
        )
      end
      def to_hash
      end

      class Monitor < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::MonitorListResponse::Monitor,
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
              XTwitterScraper::Models::MonitorListResponse::Monitor::EventType::TaggedSymbol
            ]
          )
        end
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
            event_types:
              T::Array[
                XTwitterScraper::Models::MonitorListResponse::Monitor::EventType::OrSymbol
              ],
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
                T::Array[
                  XTwitterScraper::Models::MonitorListResponse::Monitor::EventType::TaggedSymbol
                ],
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
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::MonitorListResponse::Monitor::EventType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TWEET_NEW =
            T.let(
              :"tweet.new",
              XTwitterScraper::Models::MonitorListResponse::Monitor::EventType::TaggedSymbol
            )
          TWEET_REPLY =
            T.let(
              :"tweet.reply",
              XTwitterScraper::Models::MonitorListResponse::Monitor::EventType::TaggedSymbol
            )
          TWEET_RETWEET =
            T.let(
              :"tweet.retweet",
              XTwitterScraper::Models::MonitorListResponse::Monitor::EventType::TaggedSymbol
            )
          TWEET_QUOTE =
            T.let(
              :"tweet.quote",
              XTwitterScraper::Models::MonitorListResponse::Monitor::EventType::TaggedSymbol
            )
          FOLLOWER_GAINED =
            T.let(
              :"follower.gained",
              XTwitterScraper::Models::MonitorListResponse::Monitor::EventType::TaggedSymbol
            )
          FOLLOWER_LOST =
            T.let(
              :"follower.lost",
              XTwitterScraper::Models::MonitorListResponse::Monitor::EventType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::MonitorListResponse::Monitor::EventType::TaggedSymbol
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
