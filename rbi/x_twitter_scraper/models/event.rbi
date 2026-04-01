# typed: strong

module XTwitterScraper
  module Models
    class Event < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::Event, XTwitterScraper::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :data

      sig { returns(String) }
      attr_accessor :monitor_id

      sig { returns(Time) }
      attr_accessor :occurred_at

      sig { returns(XTwitterScraper::Event::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :username

      sig do
        params(
          id: String,
          data: T::Hash[Symbol, T.anything],
          monitor_id: String,
          occurred_at: Time,
          type: XTwitterScraper::Event::Type::OrSymbol,
          username: String
        ).returns(T.attached_class)
      end
      def self.new(id:, data:, monitor_id:, occurred_at:, type:, username:)
      end

      sig do
        override.returns(
          {
            id: String,
            data: T::Hash[Symbol, T.anything],
            monitor_id: String,
            occurred_at: Time,
            type: XTwitterScraper::Event::Type::OrSymbol,
            username: String
          }
        )
      end
      def to_hash
      end

      module Type
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::Event::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWEET_NEW =
          T.let(:"tweet.new", XTwitterScraper::Event::Type::TaggedSymbol)
        TWEET_REPLY =
          T.let(:"tweet.reply", XTwitterScraper::Event::Type::TaggedSymbol)
        TWEET_RETWEET =
          T.let(:"tweet.retweet", XTwitterScraper::Event::Type::TaggedSymbol)
        TWEET_QUOTE =
          T.let(:"tweet.quote", XTwitterScraper::Event::Type::TaggedSymbol)
        FOLLOWER_GAINED =
          T.let(:"follower.gained", XTwitterScraper::Event::Type::TaggedSymbol)
        FOLLOWER_LOST =
          T.let(:"follower.lost", XTwitterScraper::Event::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[XTwitterScraper::Event::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
