# typed: strong

module XTwitterScraper
  module Models
    module X
      class FollowerRetrieveCheckResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::FollowerRetrieveCheckResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :is_followed_by

        sig { returns(T::Boolean) }
        attr_accessor :is_following

        sig { returns(String) }
        attr_accessor :source_username

        sig { returns(String) }
        attr_accessor :target_username

        sig do
          params(
            is_followed_by: T::Boolean,
            is_following: T::Boolean,
            source_username: String,
            target_username: String
          ).returns(T.attached_class)
        end
        def self.new(
          is_followed_by:,
          is_following:,
          source_username:,
          target_username:
        )
        end

        sig do
          override.returns(
            {
              is_followed_by: T::Boolean,
              is_following: T::Boolean,
              source_username: String,
              target_username: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
