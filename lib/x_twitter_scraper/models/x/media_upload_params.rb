# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Media#upload
      class MediaUploadParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute account
        #   X account (@username or ID) uploading media from URL
        #
        #   @return [String]
        required :account, String

        # @!attribute url
        #   HTTPS URL to download and upload as media
        #
        #   @return [String]
        required :url, String

        # @!attribute idempotency_key
        #
        #   @return [String]
        required :idempotency_key, String

        # @!method initialize(account:, url:, idempotency_key:, request_options: {})
        #   @param account [String] X account (@username or ID) uploading media from URL
        #
        #   @param url [String] HTTPS URL to download and upload as media
        #
        #   @param idempotency_key [String]
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
