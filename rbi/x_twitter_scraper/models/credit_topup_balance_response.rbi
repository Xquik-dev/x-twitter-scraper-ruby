# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CreditTopupBalanceResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CreditTopupBalanceResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Stable Xquik redirect URL for the active checkout.
      sig { returns(String) }
      attr_accessor :redirect_url

      # Same stable Xquik redirect URL as redirect_url. The response never exposes the
      # hosted checkout URL.
      sig { returns(String) }
      attr_accessor :url

      sig do
        params(redirect_url: String, url: String).returns(T.attached_class)
      end
      def self.new(
        # Stable Xquik redirect URL for the active checkout.
        redirect_url:,
        # Same stable Xquik redirect URL as redirect_url. The response never exposes the
        # hosted checkout URL.
        url:
      )
      end

      sig { override.returns({ redirect_url: String, url: String }) }
      def to_hash
      end
    end
  end
end
