# typed: strong

module XTwitterScraper
  module Models
    module X
      class UserProfile < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::UserProfile,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :name

        sig { returns(String) }
        attr_accessor :username

        sig { returns(T.nilable(String)) }
        attr_reader :created_at

        sig { params(created_at: String).void }
        attr_writer :created_at

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig { returns(T.nilable(Integer)) }
        attr_reader :followers

        sig { params(followers: Integer).void }
        attr_writer :followers

        sig { returns(T.nilable(Integer)) }
        attr_reader :following

        sig { params(following: Integer).void }
        attr_writer :following

        sig { returns(T.nilable(String)) }
        attr_reader :location

        sig { params(location: String).void }
        attr_writer :location

        sig { returns(T.nilable(String)) }
        attr_reader :profile_picture

        sig { params(profile_picture: String).void }
        attr_writer :profile_picture

        sig { returns(T.nilable(Integer)) }
        attr_reader :statuses_count

        sig { params(statuses_count: Integer).void }
        attr_writer :statuses_count

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :verified

        sig { params(verified: T::Boolean).void }
        attr_writer :verified

        sig do
          params(
            id: String,
            name: String,
            username: String,
            created_at: String,
            description: String,
            followers: Integer,
            following: Integer,
            location: String,
            profile_picture: String,
            statuses_count: Integer,
            verified: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          name:,
          username:,
          created_at: nil,
          description: nil,
          followers: nil,
          following: nil,
          location: nil,
          profile_picture: nil,
          statuses_count: nil,
          verified: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              name: String,
              username: String,
              created_at: String,
              description: String,
              followers: Integer,
              following: Integer,
              location: String,
              profile_picture: String,
              statuses_count: Integer,
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
