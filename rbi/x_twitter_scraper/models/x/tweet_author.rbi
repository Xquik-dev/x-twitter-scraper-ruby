# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetAuthor < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::TweetAuthor,
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
