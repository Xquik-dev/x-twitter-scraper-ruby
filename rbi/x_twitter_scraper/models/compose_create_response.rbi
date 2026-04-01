# typed: strong

module XTwitterScraper
  module Models
    class ComposeCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ComposeCreateResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # AI feedback on the draft
      sig { returns(T.nilable(String)) }
      attr_reader :feedback

      sig { params(feedback: String).void }
      attr_writer :feedback

      # Engagement score (0-100)
      sig { returns(T.nilable(Float)) }
      attr_reader :score

      sig { params(score: Float).void }
      attr_writer :score

      # Improvement suggestions
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :suggestions

      sig { params(suggestions: T::Array[String]).void }
      attr_writer :suggestions

      # Generated or refined tweet text
      sig { returns(T.nilable(String)) }
      attr_reader :text

      sig { params(text: String).void }
      attr_writer :text

      sig do
        params(
          feedback: String,
          score: Float,
          suggestions: T::Array[String],
          text: String
        ).returns(T.attached_class)
      end
      def self.new(
        # AI feedback on the draft
        feedback: nil,
        # Engagement score (0-100)
        score: nil,
        # Improvement suggestions
        suggestions: nil,
        # Generated or refined tweet text
        text: nil
      )
      end

      sig do
        override.returns(
          {
            feedback: String,
            score: Float,
            suggestions: T::Array[String],
            text: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
