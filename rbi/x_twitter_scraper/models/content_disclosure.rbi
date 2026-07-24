# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ContentDisclosure < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::ContentDisclosure,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig do
        returns(T.nilable(XTwitterScraper::ContentDisclosure::Advertising))
      end
      attr_reader :advertising

      sig do
        params(
          advertising: XTwitterScraper::ContentDisclosure::Advertising::OrHash
        ).void
      end
      attr_writer :advertising

      sig do
        returns(T.nilable(XTwitterScraper::ContentDisclosure::AIGenerated))
      end
      attr_reader :ai_generated

      sig do
        params(
          ai_generated: XTwitterScraper::ContentDisclosure::AIGenerated::OrHash
        ).void
      end
      attr_writer :ai_generated

      # Content disclosure metadata shown by X when a tweet is labeled as paid
      # partnership content or AI-generated media.
      sig do
        params(
          advertising: XTwitterScraper::ContentDisclosure::Advertising::OrHash,
          ai_generated: XTwitterScraper::ContentDisclosure::AIGenerated::OrHash
        ).returns(T.attached_class)
      end
      def self.new(advertising: nil, ai_generated: nil)
      end

      sig do
        override.returns(
          {
            advertising: XTwitterScraper::ContentDisclosure::Advertising,
            ai_generated: XTwitterScraper::ContentDisclosure::AIGenerated
          }
        )
      end
      def to_hash
      end

      class Advertising < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::ContentDisclosure::Advertising,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # True when X labels the tweet as paid promotion content.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_paid_promotion

        sig { params(is_paid_promotion: T::Boolean).void }
        attr_writer :is_paid_promotion

        sig { params(is_paid_promotion: T::Boolean).returns(T.attached_class) }
        def self.new(
          # True when X labels the tweet as paid promotion content.
          is_paid_promotion: nil
        )
        end

        sig { override.returns({ is_paid_promotion: T::Boolean }) }
        def to_hash
        end
      end

      class AIGenerated < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::ContentDisclosure::AIGenerated,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Whether the disclosure can be edited on X.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :can_edit

        sig { params(can_edit: T::Boolean).void }
        attr_writer :can_edit

        # Source of the AI-generated media disclosure.
        sig { returns(T.nilable(String)) }
        attr_reader :detection_source

        sig { params(detection_source: String).void }
        attr_writer :detection_source

        # True when X labels the tweet as containing AI-generated media.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_ai_generated_media

        sig { params(has_ai_generated_media: T::Boolean).void }
        attr_writer :has_ai_generated_media

        sig do
          params(
            can_edit: T::Boolean,
            detection_source: String,
            has_ai_generated_media: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the disclosure can be edited on X.
          can_edit: nil,
          # Source of the AI-generated media disclosure.
          detection_source: nil,
          # True when X labels the tweet as containing AI-generated media.
          has_ai_generated_media: nil
        )
        end

        sig do
          override.returns(
            {
              can_edit: T::Boolean,
              detection_source: String,
              has_ai_generated_media: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
