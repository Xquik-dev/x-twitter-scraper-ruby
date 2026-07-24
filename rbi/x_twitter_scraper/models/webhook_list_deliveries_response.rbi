# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class WebhookListDeliveriesResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::WebhookListDeliveriesResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::Delivery]) }
      attr_accessor :deliveries

      sig do
        params(deliveries: T::Array[XTwitterScraper::Delivery::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(deliveries:)
      end

      sig do
        override.returns({ deliveries: T::Array[XTwitterScraper::Delivery] })
      end
      def to_hash
      end
    end
  end
end
