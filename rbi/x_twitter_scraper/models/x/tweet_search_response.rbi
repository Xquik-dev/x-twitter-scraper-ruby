# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetSearchResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetSearchResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :has_next_page

        sig { returns(String) }
        attr_accessor :next_cursor

        sig do
          returns(
            T::Array[XTwitterScraper::Models::X::TweetSearchResponse::Tweet]
          )
        end
        attr_accessor :tweets

        # Paginated list of tweets with cursor-based navigation.
        sig do
          params(
            has_next_page: T::Boolean,
            next_cursor: String,
            tweets:
              T::Array[
                XTwitterScraper::Models::X::TweetSearchResponse::Tweet::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(has_next_page:, next_cursor:, tweets:)
        end

        sig do
          override.returns(
            {
              has_next_page: T::Boolean,
              next_cursor: String,
              tweets:
                T::Array[XTwitterScraper::Models::X::TweetSearchResponse::Tweet]
            }
          )
        end
        def to_hash
        end

        class Tweet < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::TweetSearchResponse::Tweet,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :text

          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::TweetSearchResponse::Tweet::Author
              )
            )
          end
          attr_reader :author

          sig do
            params(
              author:
                XTwitterScraper::Models::X::TweetSearchResponse::Tweet::Author::OrHash
            ).void
          end
          attr_writer :author

          sig { returns(T.nilable(Integer)) }
          attr_reader :bookmark_count

          sig { params(bookmark_count: Integer).void }
          attr_writer :bookmark_count

          sig { returns(T.nilable(String)) }
          attr_reader :created_at

          sig { params(created_at: String).void }
          attr_writer :created_at

          # True for Note Tweets (long-form content, up to 25,000 characters)
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :is_note_tweet

          sig { params(is_note_tweet: T::Boolean).void }
          attr_writer :is_note_tweet

          sig { returns(T.nilable(Integer)) }
          attr_reader :like_count

          sig { params(like_count: Integer).void }
          attr_writer :like_count

          sig { returns(T.nilable(Integer)) }
          attr_reader :quote_count

          sig { params(quote_count: Integer).void }
          attr_writer :quote_count

          sig { returns(T.nilable(Integer)) }
          attr_reader :reply_count

          sig { params(reply_count: Integer).void }
          attr_writer :reply_count

          sig { returns(T.nilable(Integer)) }
          attr_reader :retweet_count

          sig { params(retweet_count: Integer).void }
          attr_writer :retweet_count

          sig { returns(T.nilable(Integer)) }
          attr_reader :view_count

          sig { params(view_count: Integer).void }
          attr_writer :view_count

          # Tweet returned from search results with inline author info.
          sig do
            params(
              id: String,
              text: String,
              author:
                XTwitterScraper::Models::X::TweetSearchResponse::Tweet::Author::OrHash,
              bookmark_count: Integer,
              created_at: String,
              is_note_tweet: T::Boolean,
              like_count: Integer,
              quote_count: Integer,
              reply_count: Integer,
              retweet_count: Integer,
              view_count: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            text:,
            author: nil,
            bookmark_count: nil,
            created_at: nil,
            # True for Note Tweets (long-form content, up to 25,000 characters)
            is_note_tweet: nil,
            like_count: nil,
            quote_count: nil,
            reply_count: nil,
            retweet_count: nil,
            view_count: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                text: String,
                author:
                  XTwitterScraper::Models::X::TweetSearchResponse::Tweet::Author,
                bookmark_count: Integer,
                created_at: String,
                is_note_tweet: T::Boolean,
                like_count: Integer,
                quote_count: Integer,
                reply_count: Integer,
                retweet_count: Integer,
                view_count: Integer
              }
            )
          end
          def to_hash
          end

          class Author < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::TweetSearchResponse::Tweet::Author,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :id

            sig { returns(String) }
            attr_accessor :name

            sig { returns(String) }
            attr_accessor :username

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :verified

            sig { params(verified: T::Boolean).void }
            attr_writer :verified

            sig do
              params(
                id: String,
                name: String,
                username: String,
                verified: T::Boolean
              ).returns(T.attached_class)
            end
            def self.new(id:, name:, username:, verified: nil)
            end

            sig do
              override.returns(
                {
                  id: String,
                  name: String,
                  username: String,
                  verified: T::Boolean
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
