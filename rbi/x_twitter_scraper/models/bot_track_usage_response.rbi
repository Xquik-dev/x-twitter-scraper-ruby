# typed: strong

module XTwitterScraper
  module Models
    class BotTrackUsageResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::BotTrackUsageResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      sig { params(success: T::Boolean).returns(T.attached_class) }
      def self.new(success: nil)
      end

      sig { override.returns({ success: T::Boolean }) }
      def to_hash
      end
    end
  end
end
