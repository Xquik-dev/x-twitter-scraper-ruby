# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Profile#update_avatar
      class ProfileUpdateAvatarParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute account
        #   X account (@username or ID) receiving avatar from URL
        #
        #   @return [String]
        required :account, String

        # @!attribute url
        #   HTTPS URL to the avatar image to download
        #
        #   @return [String, nil]
        optional :url, String

        # @!attribute idempotency_key
        #
        #   @return [String]
        required :idempotency_key, String

        # @!attribute file
        #   Avatar image (max 95 MiB)
        #
        #   @return [Pathname, StringIO, IO, String, XTwitterScraper::FilePart, nil]
        optional :file, XTwitterScraper::Internal::Type::FileInput

        # @!method initialize(account:, idempotency_key:, file: nil, url: nil, request_options: {})
        #   @param account [String] X account (@username or ID) receiving avatar from URL
        #
        #   @param url [String] HTTPS URL to the avatar image to download
        #
        #   @param idempotency_key [String]
        #
        #   @param file [Pathname, StringIO, IO, String, XTwitterScraper::FilePart] Avatar image (max 95 MiB)
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
