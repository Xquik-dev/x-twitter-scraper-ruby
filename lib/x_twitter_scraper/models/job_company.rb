# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class JobCompany < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   X company profile ID.
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Company name.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute logo_url
      #   Company logo URL.
      #
      #   @return [String, nil]
      optional :logo_url, String, api_name: :logoUrl

      # @!method initialize(id:, name: nil, logo_url: nil)
      #   The company profile of a job X imported from a job board.
      #
      #   @param id [String] X company profile ID.
      #
      #   @param name [String] Company name.
      #
      #   @param logo_url [String] Company logo URL.
    end
  end
end
