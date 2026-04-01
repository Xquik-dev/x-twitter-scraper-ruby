# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetRetrieveResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(XTwitterScraper::Models::X::TweetRetrieveResponse::Tweet)
        end
        attr_reader :tweet

        sig do
          params(
            tweet:
              XTwitterScraper::Models::X::TweetRetrieveResponse::Tweet::OrHash
          ).void
        end
        attr_writer :tweet

        sig do
          returns(
            T.nilable(XTwitterScraper::Models::X::TweetRetrieveResponse::Author)
          )
        end
        attr_reader :author

        sig do
          params(
            author:
              XTwitterScraper::Models::X::TweetRetrieveResponse::Author::OrHash
          ).void
        end
        attr_writer :author

        sig do
          params(
            tweet:
              XTwitterScraper::Models::X::TweetRetrieveResponse::Tweet::OrHash,
            author:
              XTwitterScraper::Models::X::TweetRetrieveResponse::Author::OrHash
          ).returns(T.attached_class)
        end
        def self.new(tweet:, author: nil)
        end

        sig do
          override.returns(
            {
              tweet: XTwitterScraper::Models::X::TweetRetrieveResponse::Tweet,
              author: XTwitterScraper::Models::X::TweetRetrieveResponse::Author
            }
          )
        end
        def to_hash
        end

        class Tweet < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::TweetRetrieveResponse::Tweet,
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

          sig { returns(T.nilable(String)) }
          attr_reader :created_at

          sig { params(created_at: String).void }
          attr_writer :created_at

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
              created_at: String
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
            created_at: nil
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
                created_at: String
              }
            )
          end
          def to_hash
          end
        end

        class Author < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::TweetRetrieveResponse::Author,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(Integer) }
          attr_accessor :followers

          sig { returns(String) }
          attr_accessor :username

          sig { returns(T::Boolean) }
          attr_accessor :verified

          sig { returns(T.nilable(String)) }
          attr_reader :profile_picture

          sig { params(profile_picture: String).void }
          attr_writer :profile_picture

          sig do
            params(
              id: String,
              followers: Integer,
              username: String,
              verified: T::Boolean,
              profile_picture: String
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            followers:,
            username:,
            verified:,
            profile_picture: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                followers: Integer,
                username: String,
                verified: T::Boolean,
                profile_picture: String
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
