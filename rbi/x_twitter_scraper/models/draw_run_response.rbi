# typed: strong

module XTwitterScraper
  module Models
    class DrawRunResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::DrawRunResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Integer) }
      attr_accessor :total_entries

      sig { returns(String) }
      attr_accessor :tweet_id

      sig { returns(Integer) }
      attr_accessor :valid_entries

      sig do
        returns(T::Array[XTwitterScraper::Models::DrawRunResponse::Winner])
      end
      attr_accessor :winners

      sig do
        params(
          id: String,
          total_entries: Integer,
          tweet_id: String,
          valid_entries: Integer,
          winners:
            T::Array[XTwitterScraper::Models::DrawRunResponse::Winner::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(id:, total_entries:, tweet_id:, valid_entries:, winners:)
      end

      sig do
        override.returns(
          {
            id: String,
            total_entries: Integer,
            tweet_id: String,
            valid_entries: Integer,
            winners: T::Array[XTwitterScraper::Models::DrawRunResponse::Winner]
          }
        )
      end
      def to_hash
      end

      class Winner < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::DrawRunResponse::Winner,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :author_username

        sig { returns(T::Boolean) }
        attr_accessor :is_backup

        sig { returns(Integer) }
        attr_accessor :position

        sig { returns(String) }
        attr_accessor :tweet_id

        sig do
          params(
            author_username: String,
            is_backup: T::Boolean,
            position: Integer,
            tweet_id: String
          ).returns(T.attached_class)
        end
        def self.new(author_username:, is_backup:, position:, tweet_id:)
        end

        sig do
          override.returns(
            {
              author_username: String,
              is_backup: T::Boolean,
              position: Integer,
              tweet_id: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
