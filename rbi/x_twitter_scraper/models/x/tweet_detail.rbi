# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetDetail < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::TweetDetail,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Integer) }
        attr_accessor :bookmark_count

        sig { returns(Integer) }
        attr_accessor :like_count

        sig { returns(Integer) }
        attr_accessor :quote_count

        sig { returns(Integer) }
        attr_accessor :reply_count

        sig { returns(Integer) }
        attr_accessor :retweet_count

        sig { returns(String) }
        attr_accessor :text

        sig { returns(Integer) }
        attr_accessor :view_count

        # ID of the root tweet in the conversation thread
        sig { returns(T.nilable(String)) }
        attr_reader :conversation_id

        sig { params(conversation_id: String).void }
        attr_writer :conversation_id

        sig { returns(T.nilable(String)) }
        attr_reader :created_at

        sig { params(created_at: String).void }
        attr_writer :created_at

        # Parsed entities from the tweet text (URLs, mentions, hashtags, media)
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :entities

        sig { params(entities: T::Hash[Symbol, T.anything]).void }
        attr_writer :entities

        # Whether this is a Note Tweet (long-form post, up to 25,000 characters)
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_note_tweet

        sig { params(is_note_tweet: T::Boolean).void }
        attr_writer :is_note_tweet

        # Whether this tweet quotes another tweet
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_quote_status

        sig { params(is_quote_status: T::Boolean).void }
        attr_writer :is_quote_status

        # Whether this tweet is a reply to another tweet
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_reply

        sig { params(is_reply: T::Boolean).void }
        attr_writer :is_reply

        # Attached media items, omitted when the tweet has no media
        sig do
          returns(T.nilable(T::Array[XTwitterScraper::X::TweetDetail::Media]))
        end
        attr_reader :media

        sig do
          params(
            media: T::Array[XTwitterScraper::X::TweetDetail::Media::OrHash]
          ).void
        end
        attr_writer :media

        # The quoted tweet object, present when isQuoteStatus is true
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :quoted_tweet

        sig { params(quoted_tweet: T::Hash[Symbol, T.anything]).void }
        attr_writer :quoted_tweet

        # Client application used to post this tweet
        sig { returns(T.nilable(String)) }
        attr_reader :source

        sig { params(source: String).void }
        attr_writer :source

        # Full tweet with text, engagement metrics, media, and metadata.
        sig do
          params(
            id: String,
            bookmark_count: Integer,
            like_count: Integer,
            quote_count: Integer,
            reply_count: Integer,
            retweet_count: Integer,
            text: String,
            view_count: Integer,
            conversation_id: String,
            created_at: String,
            entities: T::Hash[Symbol, T.anything],
            is_note_tweet: T::Boolean,
            is_quote_status: T::Boolean,
            is_reply: T::Boolean,
            media: T::Array[XTwitterScraper::X::TweetDetail::Media::OrHash],
            quoted_tweet: T::Hash[Symbol, T.anything],
            source: String
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          bookmark_count:,
          like_count:,
          quote_count:,
          reply_count:,
          retweet_count:,
          text:,
          view_count:,
          # ID of the root tweet in the conversation thread
          conversation_id: nil,
          created_at: nil,
          # Parsed entities from the tweet text (URLs, mentions, hashtags, media)
          entities: nil,
          # Whether this is a Note Tweet (long-form post, up to 25,000 characters)
          is_note_tweet: nil,
          # Whether this tweet quotes another tweet
          is_quote_status: nil,
          # Whether this tweet is a reply to another tweet
          is_reply: nil,
          # Attached media items, omitted when the tweet has no media
          media: nil,
          # The quoted tweet object, present when isQuoteStatus is true
          quoted_tweet: nil,
          # Client application used to post this tweet
          source: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              bookmark_count: Integer,
              like_count: Integer,
              quote_count: Integer,
              reply_count: Integer,
              retweet_count: Integer,
              text: String,
              view_count: Integer,
              conversation_id: String,
              created_at: String,
              entities: T::Hash[Symbol, T.anything],
              is_note_tweet: T::Boolean,
              is_quote_status: T::Boolean,
              is_reply: T::Boolean,
              media: T::Array[XTwitterScraper::X::TweetDetail::Media],
              quoted_tweet: T::Hash[Symbol, T.anything],
              source: String
            }
          )
        end
        def to_hash
        end

        class Media < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::X::TweetDetail::Media,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :media_url

          sig { params(media_url: String).void }
          attr_writer :media_url

          sig do
            returns(
              T.nilable(
                XTwitterScraper::X::TweetDetail::Media::Type::TaggedSymbol
              )
            )
          end
          attr_reader :type

          sig do
            params(
              type: XTwitterScraper::X::TweetDetail::Media::Type::OrSymbol
            ).void
          end
          attr_writer :type

          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          sig do
            params(
              media_url: String,
              type: XTwitterScraper::X::TweetDetail::Media::Type::OrSymbol,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(media_url: nil, type: nil, url: nil)
          end

          sig do
            override.returns(
              {
                media_url: String,
                type:
                  XTwitterScraper::X::TweetDetail::Media::Type::TaggedSymbol,
                url: String
              }
            )
          end
          def to_hash
          end

          module Type
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, XTwitterScraper::X::TweetDetail::Media::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PHOTO =
              T.let(
                :photo,
                XTwitterScraper::X::TweetDetail::Media::Type::TaggedSymbol
              )
            VIDEO =
              T.let(
                :video,
                XTwitterScraper::X::TweetDetail::Media::Type::TaggedSymbol
              )
            ANIMATED_GIF =
              T.let(
                :animated_gif,
                XTwitterScraper::X::TweetDetail::Media::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::X::TweetDetail::Media::Type::TaggedSymbol
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
end
