# frozen_string_literal: true

module XTwitterScraper
  module Models
    class ContentDisclosure < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute advertising
      #
      #   @return [XTwitterScraper::Models::ContentDisclosure::Advertising, nil]
      optional :advertising, -> { XTwitterScraper::ContentDisclosure::Advertising }

      # @!attribute ai_generated
      #
      #   @return [XTwitterScraper::Models::ContentDisclosure::AIGenerated, nil]
      optional :ai_generated, -> { XTwitterScraper::ContentDisclosure::AIGenerated }, api_name: :aiGenerated

      # @!method initialize(advertising: nil, ai_generated: nil)
      #   Content disclosure metadata shown by X when a tweet is labeled as paid
      #   partnership content or AI-generated media.
      #
      #   @param advertising [XTwitterScraper::Models::ContentDisclosure::Advertising]
      #   @param ai_generated [XTwitterScraper::Models::ContentDisclosure::AIGenerated]

      # @see XTwitterScraper::Models::ContentDisclosure#advertising
      class Advertising < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute is_paid_promotion
        #   True when X labels the tweet as paid promotion content.
        #
        #   @return [Boolean, nil]
        optional :is_paid_promotion, XTwitterScraper::Internal::Type::Boolean, api_name: :isPaidPromotion

        # @!method initialize(is_paid_promotion: nil)
        #   @param is_paid_promotion [Boolean] True when X labels the tweet as paid promotion content.
      end

      # @see XTwitterScraper::Models::ContentDisclosure#ai_generated
      class AIGenerated < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute can_edit
        #   Whether the disclosure can be edited on X.
        #
        #   @return [Boolean, nil]
        optional :can_edit, XTwitterScraper::Internal::Type::Boolean, api_name: :canEdit

        # @!attribute detection_source
        #   Source of the AI-generated media disclosure.
        #
        #   @return [String, nil]
        optional :detection_source, String, api_name: :detectionSource

        # @!attribute has_ai_generated_media
        #   True when X labels the tweet as containing AI-generated media.
        #
        #   @return [Boolean, nil]
        optional :has_ai_generated_media,
                 XTwitterScraper::Internal::Type::Boolean,
                 api_name: :hasAiGeneratedMedia

        # @!method initialize(can_edit: nil, detection_source: nil, has_ai_generated_media: nil)
        #   @param can_edit [Boolean] Whether the disclosure can be edited on X.
        #
        #   @param detection_source [String] Source of the AI-generated media disclosure.
        #
        #   @param has_ai_generated_media [Boolean] True when X labels the tweet as containing AI-generated media.
      end
    end
  end
end
