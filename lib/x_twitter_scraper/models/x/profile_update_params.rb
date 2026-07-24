# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Profile#update
      class ProfileUpdateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute account
        #   X account (@username or ID) to update profile
        #
        #   @return [String]
        required :account, String

        # @!attribute idempotency_key
        #
        #   @return [String]
        required :idempotency_key, String

        # @!attribute description
        #   Bio description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute location
        #
        #   @return [String, nil]
        optional :location, String

        # @!attribute name
        #   Display name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute url
        #   Website URL
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(account:, idempotency_key:, description: nil, location: nil, name: nil, url: nil, request_options: {})
        #   @param account [String] X account (@username or ID) to update profile
        #
        #   @param idempotency_key [String]
        #
        #   @param description [String] Bio description
        #
        #   @param location [String]
        #
        #   @param name [String] Display name
        #
        #   @param url [String] Website URL
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
