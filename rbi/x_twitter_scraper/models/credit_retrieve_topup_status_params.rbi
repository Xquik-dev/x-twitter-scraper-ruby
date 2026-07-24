# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CreditRetrieveTopupStatusParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::CreditRetrieveTopupStatusParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Top-up session ID to inspect.
      sig { returns(String) }
      attr_accessor :session_id

      sig do
        params(
          session_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Top-up session ID to inspect.
        session_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            session_id: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
