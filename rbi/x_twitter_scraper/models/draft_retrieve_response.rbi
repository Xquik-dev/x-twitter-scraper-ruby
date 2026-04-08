# typed: strong

module XTwitterScraper
  module Models
    class DraftRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::DraftRetrieveResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(String) }
      attr_accessor :text

      sig { returns(Time) }
      attr_accessor :updated_at

      sig { returns(T.nilable(String)) }
      attr_reader :goal

      sig { params(goal: String).void }
      attr_writer :goal

      sig { returns(T.nilable(String)) }
      attr_reader :topic

      sig { params(topic: String).void }
      attr_writer :topic

      # Full tweet draft including update timestamp.
      sig do
        params(
          id: String,
          created_at: Time,
          text: String,
          updated_at: Time,
          goal: String,
          topic: String
        ).returns(T.attached_class)
      end
      def self.new(id:, created_at:, text:, updated_at:, goal: nil, topic: nil)
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            text: String,
            updated_at: Time,
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
