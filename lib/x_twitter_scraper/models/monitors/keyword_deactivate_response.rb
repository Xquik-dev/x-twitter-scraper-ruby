# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Monitors
      # @see XTwitterScraper::Resources::Monitors::Keywords#deactivate
      class KeywordDeactivateResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute deletion_status
        #
        #   @return [Symbol, :deleting]
        required :deletion_status, const: :deleting, api_name: :deletionStatus

        # @!attribute status_url
        #   Poll this monitor URL until it returns 404.
        #
        #   @return [String]
        required :status_url, String, api_name: :statusUrl

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(deletion_status: :deleting, status_url:, success: true)
        #   @param deletion_status [Symbol, :deleting]
        #
        #   @param status_url [String] Poll this monitor URL until it returns 404.
        #
        #   @param success [Boolean, true]
      end
    end
  end
end
