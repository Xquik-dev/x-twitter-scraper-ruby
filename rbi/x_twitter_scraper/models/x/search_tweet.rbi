# typed: strong

module XTwitterScraper
  module Models
    module X
      class SearchTweet < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::SearchTweet,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :text

        sig { returns(T.nilable(XTwitterScraper::X::SearchTweet::Author)) }
        attr_reader :author

        sig do
          params(author: XTwitterScraper::X::SearchTweet::Author::OrHash).void
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

        sig do
          params(
            id: String,
            text: String,
            author: XTwitterScraper::X::SearchTweet::Author::OrHash,
            bookmark_count: Integer,
            created_at: String,
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
              author: XTwitterScraper::X::SearchTweet::Author,
              bookmark_count: Integer,
              created_at: String,
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
                XTwitterScraper::X::SearchTweet::Author,
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
