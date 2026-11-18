# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class JobLocation < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   Location ID, which the job search locationId takes.
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Place name with its region or country code.
      #
      #   @return [String]
      required :name, String

      # @!method initialize(id:, name:)
      #   A place a job search can name by its ID.
      #
      #   @param id [String] Location ID, which the job search locationId takes.
      #
      #   @param name [String] Place name with its region or country code.
    end
  end
end
