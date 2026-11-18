# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#create_telegram_link
    class WebhookCreateTelegramLinkResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute url
      #   Opens @XquikBot with the link's code.
      #
      #   @return [String]
      required :url, String

      # @!attribute expires_at
      #   When the link stops working, 15 minutes after creation.
      #
      #   @return [Time]
      required :expires_at, Time, api_name: :expiresAt

      # @!method initialize(url:, expires_at:)
      #   @param url [String] Opens @XquikBot with the link's code.
      #
      #   @param expires_at [Time] When the link stops working, 15 minutes after creation.
    end
  end
end
