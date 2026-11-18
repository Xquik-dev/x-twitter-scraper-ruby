# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ExtractionCancelParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ExtractionCancelParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Extraction ID returned by `POST /extractions` or the extraction list. Another
      # shape gets 400 `invalid_id`.
      sig { returns(String) }
      attr_accessor :id

      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Extraction ID returned by `POST /extractions` or the extraction list. Another
        # shape gets 400 `invalid_id`.
        id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { id: String, request_options: XTwitterScraper::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
