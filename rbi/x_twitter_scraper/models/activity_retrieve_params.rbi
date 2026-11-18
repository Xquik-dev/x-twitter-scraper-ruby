# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ActivityRetrieveParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ActivityRetrieveParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Activity ID. It is the id of an Activity log row and the last part of the
      # dashboard's activity page URL.
      sig { returns(String) }
      attr_accessor :id

      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Activity ID. It is the id of an Activity log row and the last part of the
        # dashboard's activity page URL.
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
