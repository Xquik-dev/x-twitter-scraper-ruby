# typed: strong

module XTwitterScraper
  module Models
    class IntegrationRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::IntegrationRetrieveResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Integration config — shape varies by type (JSON)
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :config

      sig { returns(Time) }
      attr_accessor :created_at

      # Array of event types to subscribe to.
      sig do
        returns(
          T::Array[
            XTwitterScraper::Models::IntegrationRetrieveResponse::EventType::TaggedSymbol
          ]
        )
      end
      attr_accessor :event_types

      sig { returns(T::Boolean) }
      attr_accessor :is_active

      sig { returns(String) }
      attr_accessor :name

      sig do
        returns(
          XTwitterScraper::Models::IntegrationRetrieveResponse::Type::TaggedSymbol
        )
      end
      attr_accessor :type

      # Event filter rules (JSON)
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :filters

      sig { params(filters: T::Hash[Symbol, T.anything]).void }
      attr_writer :filters

      sig { returns(T.nilable(String)) }
      attr_reader :message_template

      sig { params(message_template: String).void }
      attr_writer :message_template

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :scope_all_monitors

      sig { params(scope_all_monitors: T::Boolean).void }
      attr_writer :scope_all_monitors

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :silent_push

      sig { params(silent_push: T::Boolean).void }
      attr_writer :silent_push

      # Third-party integration (e.g. Telegram) subscribed to monitor events.
      sig do
        params(
          id: String,
          config: T::Hash[Symbol, T.anything],
          created_at: Time,
          event_types:
            T::Array[
              XTwitterScraper::Models::IntegrationRetrieveResponse::EventType::OrSymbol
            ],
          is_active: T::Boolean,
          name: String,
          type:
            XTwitterScraper::Models::IntegrationRetrieveResponse::Type::OrSymbol,
          filters: T::Hash[Symbol, T.anything],
          message_template: String,
          scope_all_monitors: T::Boolean,
          silent_push: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Integration config — shape varies by type (JSON)
        config:,
        created_at:,
        # Array of event types to subscribe to.
        event_types:,
        is_active:,
        name:,
        type:,
        # Event filter rules (JSON)
        filters: nil,
        message_template: nil,
        scope_all_monitors: nil,
        silent_push: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            config: T::Hash[Symbol, T.anything],
            created_at: Time,
            event_types:
              T::Array[
                XTwitterScraper::Models::IntegrationRetrieveResponse::EventType::TaggedSymbol
              ],
            is_active: T::Boolean,
            name: String,
            type:
              XTwitterScraper::Models::IntegrationRetrieveResponse::Type::TaggedSymbol,
            filters: T::Hash[Symbol, T.anything],
            message_template: String,
            scope_all_monitors: T::Boolean,
            silent_push: T::Boolean
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
              XTwitterScraper::Models::IntegrationRetrieveResponse::EventType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWEET_NEW =
          T.let(
            :"tweet.new",
            XTwitterScraper::Models::IntegrationRetrieveResponse::EventType::TaggedSymbol
          )
        TWEET_REPLY =
          T.let(
            :"tweet.reply",
            XTwitterScraper::Models::IntegrationRetrieveResponse::EventType::TaggedSymbol
          )
        TWEET_RETWEET =
          T.let(
            :"tweet.retweet",
            XTwitterScraper::Models::IntegrationRetrieveResponse::EventType::TaggedSymbol
          )
        TWEET_QUOTE =
          T.let(
            :"tweet.quote",
            XTwitterScraper::Models::IntegrationRetrieveResponse::EventType::TaggedSymbol
          )
        FOLLOWER_GAINED =
          T.let(
            :"follower.gained",
            XTwitterScraper::Models::IntegrationRetrieveResponse::EventType::TaggedSymbol
          )
        FOLLOWER_LOST =
          T.let(
            :"follower.lost",
            XTwitterScraper::Models::IntegrationRetrieveResponse::EventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::IntegrationRetrieveResponse::EventType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      module Type
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::IntegrationRetrieveResponse::Type
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TELEGRAM =
          T.let(
            :telegram,
            XTwitterScraper::Models::IntegrationRetrieveResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::IntegrationRetrieveResponse::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
