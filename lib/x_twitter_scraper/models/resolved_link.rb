# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class ResolvedLink < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute url
      #   The t.co link, as `https://t.co/<code>`.
      #
      #   @return [String]
      required :url, String

      # @!attribute resolved_url
      #   Target URL, as the link's author set it. Xquik does not check it. Absent for a
      #   link t.co does not have.
      #
      #   @return [String, nil]
      optional :resolved_url, String, api_name: :resolvedUrl

      # @!method initialize(url:, resolved_url: nil)
      #   Pairs 1 t.co link with the URL it leads to.
      #
      #   @param url [String] The t.co link, as `https://t.co/<code>`.
      #
      #   @param resolved_url [String] Target URL, as the link's author set it. Xquik does not check it. Absent for a link t.co does not have.
    end
  end
end
