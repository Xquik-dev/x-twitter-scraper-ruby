# typed: strong

module XTwitterScraper
  module Models
    class APIKeyListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::APIKeyListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig do
        returns(T::Array[XTwitterScraper::Models::APIKeyListResponse::Key])
      end
      attr_accessor :keys

      sig do
        params(
          keys:
            T::Array[XTwitterScraper::Models::APIKeyListResponse::Key::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(keys:)
      end

      sig do
        override.returns(
          { keys: T::Array[XTwitterScraper::Models::APIKeyListResponse::Key] }
        )
      end
      def to_hash
      end

      class Key < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::APIKeyListResponse::Key,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(T::Boolean) }
        attr_accessor :is_active

        sig { returns(String) }
        attr_accessor :name

        sig { returns(String) }
        attr_accessor :prefix

        sig { returns(T.nilable(Time)) }
        attr_reader :last_used_at

        sig { params(last_used_at: Time).void }
        attr_writer :last_used_at

        # API key metadata returned when listing keys.
        sig do
          params(
            id: String,
            created_at: Time,
            is_active: T::Boolean,
            name: String,
            prefix: String,
            last_used_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          is_active:,
          name:,
          prefix:,
          last_used_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              is_active: T::Boolean,
              name: String,
              prefix: String,
              last_used_at: Time
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
