# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ImageFilterSummary < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::ImageFilterSummary,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # What you asked the photos to show.
      sig { returns(String) }
      attr_accessor :image_shows

      # The question asked of each post's photos.
      sig { returns(String) }
      attr_accessor :question

      # The lowest imageScore a kept post has.
      sig { returns(Float) }
      attr_accessor :cutoff

      # Posts whose photos were checked. Only kept posts are billed.
      sig { returns(Integer) }
      attr_accessor :checked

      # Posts whose photos show it, all returned & billed at 2 credits each.
      sig { returns(Integer) }
      attr_accessor :kept

      # Posts without a safe photo & posts the check couldn't answer. They aren't billed
      # or returned.
      sig { returns(T::Array[XTwitterScraper::ImageFilterSummary::Unchecked]) }
      attr_accessor :unchecked

      # What the image filter asked & how many posts it kept.
      sig do
        params(
          image_shows: String,
          question: String,
          cutoff: Float,
          checked: Integer,
          kept: Integer,
          unchecked:
            T::Array[XTwitterScraper::ImageFilterSummary::Unchecked::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # What you asked the photos to show.
        image_shows:,
        # The question asked of each post's photos.
        question:,
        # The lowest imageScore a kept post has.
        cutoff:,
        # Posts whose photos were checked. Only kept posts are billed.
        checked:,
        # Posts whose photos show it, all returned & billed at 2 credits each.
        kept:,
        # Posts without a safe photo & posts the check couldn't answer. They aren't billed
        # or returned.
        unchecked:
      )
      end

      sig do
        override.returns(
          {
            image_shows: String,
            question: String,
            cutoff: Float,
            checked: Integer,
            kept: Integer,
            unchecked: T::Array[XTwitterScraper::ImageFilterSummary::Unchecked]
          }
        )
      end
      def to_hash
      end

      class Unchecked < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::ImageFilterSummary::Unchecked,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :reason

        sig { params(id: String, reason: String).returns(T.attached_class) }
        def self.new(id:, reason:)
        end

        sig { override.returns({ id: String, reason: String }) }
        def to_hash
        end
      end
    end
  end
end
