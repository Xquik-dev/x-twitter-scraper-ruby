# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetGetFavoritersResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetGetFavoritersResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :has_next_page

        sig { returns(String) }
        attr_accessor :next_cursor

        sig { returns(T::Array[T.anything]) }
        attr_accessor :users

        sig do
          params(
            has_next_page: T::Boolean,
            next_cursor: String,
            users: T::Array[T.anything]
          ).returns(T.attached_class)
        end
        def self.new(has_next_page:, next_cursor:, users:)
        end

        sig do
          override.returns(
            {
              has_next_page: T::Boolean,
              next_cursor: String,
              users: T::Array[T.anything]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
