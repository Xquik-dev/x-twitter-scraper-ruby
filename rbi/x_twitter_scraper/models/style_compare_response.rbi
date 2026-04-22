# typed: strong

module XTwitterScraper
  module Models
    class StyleCompareResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::StyleCompareResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Full style profile with sampled tweets used for tone analysis.
      sig { returns(XTwitterScraper::StyleProfile) }
      attr_reader :style1

      sig { params(style1: XTwitterScraper::StyleProfile::OrHash).void }
      attr_writer :style1

      # Full style profile with sampled tweets used for tone analysis.
      sig { returns(XTwitterScraper::StyleProfile) }
      attr_reader :style2

      sig { params(style2: XTwitterScraper::StyleProfile::OrHash).void }
      attr_writer :style2

      sig do
        params(
          style1: XTwitterScraper::StyleProfile::OrHash,
          style2: XTwitterScraper::StyleProfile::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Full style profile with sampled tweets used for tone analysis.
        style1:,
        # Full style profile with sampled tweets used for tone analysis.
        style2:
      )
      end

      sig do
        override.returns(
          {
            style1: XTwitterScraper::StyleProfile,
            style2: XTwitterScraper::StyleProfile
          }
        )
      end
      def to_hash
      end
    end
  end
end
