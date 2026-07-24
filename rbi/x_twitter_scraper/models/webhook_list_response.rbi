# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class WebhookListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::WebhookListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::Webhook]) }
      attr_accessor :webhooks

      sig do
        params(webhooks: T::Array[XTwitterScraper::Webhook::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(webhooks:)
      end

      sig { override.returns({ webhooks: T::Array[XTwitterScraper::Webhook] }) }
      def to_hash
      end
    end
  end
end
