# typed: strong

module XTwitterScraper
  module Models
    class ExtractionEstimateCostResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ExtractionEstimateCostResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :allowed

      sig { returns(String) }
      attr_accessor :credits_available

      sig { returns(String) }
      attr_accessor :credits_required

      sig { returns(Integer) }
      attr_accessor :estimated_results

      sig { returns(String) }
      attr_accessor :source

      sig { returns(T.nilable(String)) }
      attr_reader :resolved_x_user_id

      sig { params(resolved_x_user_id: String).void }
      attr_writer :resolved_x_user_id

      sig do
        params(
          allowed: T::Boolean,
          credits_available: String,
          credits_required: String,
          estimated_results: Integer,
          source: String,
          resolved_x_user_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        allowed:,
        credits_available:,
        credits_required:,
        estimated_results:,
        source:,
        resolved_x_user_id: nil
      )
      end

      sig do
        override.returns(
          {
            allowed: T::Boolean,
            credits_available: String,
            credits_required: String,
            estimated_results: Integer,
            source: String,
            resolved_x_user_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
