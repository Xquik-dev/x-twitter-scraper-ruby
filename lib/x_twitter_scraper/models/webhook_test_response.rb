# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#test_
    class WebhookTestResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute status_code
      #
      #   @return [Integer]
      required :status_code, Integer, api_name: :statusCode

      # @!attribute success
      #
      #   @return [Boolean]
      required :success, XTwitterScraper::Internal::Type::Boolean

      # @!attribute error
      #
      #   @return [String, nil]
      optional :error, String

      # @!method initialize(status_code:, success:, error: nil)
      #   @param status_code [Integer]
      #   @param success [Boolean]
      #   @param error [String]
    end
  end
end
