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

      sig { returns(Integer) }
      attr_accessor :estimated_results

      sig { returns(Float) }
      attr_accessor :projected_percent

      sig { returns(String) }
      attr_accessor :source

      sig { returns(Float) }
      attr_accessor :usage_percent

      sig do
        params(
          allowed: T::Boolean,
          estimated_results: Integer,
          projected_percent: Float,
          source: String,
          usage_percent: Float
        ).returns(T.attached_class)
      end
      def self.new(
        allowed:,
        estimated_results:,
        projected_percent:,
        source:,
        usage_percent:
      )
      end

      sig do
        override.returns(
          {
            allowed: T::Boolean,
            estimated_results: Integer,
            projected_percent: Float,
            source: String,
            usage_percent: Float
          }
        )
      end
      def to_hash
      end
    end
  end
end
