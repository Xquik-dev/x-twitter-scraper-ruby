# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Monitors
      # @see XTwitterScraper::Resources::Monitors::Posts#delete
      class PostDeleteResponse < XTwitterScraper::Internal::Type::BaseModel
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
        #   @return [Boolean]
        required :success, XTwitterScraper::Internal::Type::Boolean

        # @!method initialize(status_url:, success:, deletion_status: :deleting)
        #   @param status_url [String] Poll this monitor URL until it returns 404.
        #
        #   @param success [Boolean]
        #
        #   @param deletion_status [Symbol, :deleting]
      end
    end
  end
end
