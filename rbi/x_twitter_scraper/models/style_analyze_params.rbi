# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class StyleAnalyzeParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::StyleAnalyzeParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X username to analyze
      sig { returns(String) }
      attr_accessor :username

      sig do
        params(
          username: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # X username to analyze
        username:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { username: String, request_options: XTwitterScraper::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
