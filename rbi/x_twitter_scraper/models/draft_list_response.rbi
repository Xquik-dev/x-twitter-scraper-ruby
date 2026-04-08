# typed: strong

module XTwitterScraper
  module Models
    class DraftListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::DraftListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig do
        returns(T::Array[XTwitterScraper::Models::DraftListResponse::Draft])
      end
      attr_accessor :drafts

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      sig do
        params(
          drafts:
            T::Array[XTwitterScraper::Models::DraftListResponse::Draft::OrHash],
          has_more: T::Boolean,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(drafts:, has_more:, next_cursor: nil)
      end

      sig do
        override.returns(
          {
            drafts: T::Array[XTwitterScraper::Models::DraftListResponse::Draft],
            has_more: T::Boolean,
            next_cursor: String
          }
        )
      end
      def to_hash
      end

      class Draft < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::DraftListResponse::Draft,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :text

        sig { returns(T.nilable(String)) }
        attr_reader :goal

        sig { params(goal: String).void }
        attr_writer :goal

        sig { returns(T.nilable(String)) }
        attr_reader :topic

        sig { params(topic: String).void }
        attr_writer :topic

        # Saved tweet draft with optional topic and goal.
        sig do
          params(
            id: String,
            created_at: Time,
            text: String,
            goal: String,
            topic: String
          ).returns(T.attached_class)
        end
        def self.new(id:, created_at:, text:, goal: nil, topic: nil)
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              text: String,
              goal: String,
              topic: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
