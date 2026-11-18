# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class WebhookCreateTelegramLinkResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::WebhookCreateTelegramLinkResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Opens @XquikBot with the link's code.
      sig { returns(String) }
      attr_accessor :url

      # When the link stops working, 15 minutes after creation.
      sig { returns(Time) }
      attr_accessor :expires_at

      sig { params(url: String, expires_at: Time).returns(T.attached_class) }
      def self.new(
        # Opens @XquikBot with the link's code.
        url:,
        # When the link stops working, 15 minutes after creation.
        expires_at:
      )
      end

      sig { override.returns({ url: String, expires_at: Time }) }
      def to_hash
      end
    end
  end
end
