# typed: strong

module XTwitterScraper
  module Models
    class DrawRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::DrawRetrieveResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Full giveaway draw with tweet metrics, entries, and timing.
      sig { returns(XTwitterScraper::DrawDetail) }
      attr_reader :draw

      sig { params(draw: XTwitterScraper::DrawDetail::OrHash).void }
      attr_writer :draw

      sig { returns(T::Array[XTwitterScraper::Winner]) }
      attr_accessor :winners

      sig do
        params(
          draw: XTwitterScraper::DrawDetail::OrHash,
          winners: T::Array[XTwitterScraper::Winner::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Full giveaway draw with tweet metrics, entries, and timing.
        draw:,
        winners:
      )
      end

      sig do
        override.returns(
          {
            draw: XTwitterScraper::DrawDetail,
            winners: T::Array[XTwitterScraper::Winner]
          }
        )
      end
      def to_hash
      end
    end
  end
end
