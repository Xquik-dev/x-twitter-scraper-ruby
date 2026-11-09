# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Drafts#create
    class DraftCreateResponse < XTwitterScraper::Models::DraftDetail
      # @!attribute ignored_fields
      #   Fields the request sent that this route does not read, in the order sent. They
      #   changed nothing. The answer leaves this out when the route read every field.
      #
      #   @return [Array<String>, nil]
      optional :ignored_fields, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :ignoredFields

      # @!method initialize(ignored_fields: nil)
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::DraftCreateResponse} for more details.
      #
      #   The fields a write did not read, when the request sent any.
      #
      #   @param ignored_fields [Array<String>] Fields the request sent that this route does not read, in the order sent. They c
    end
  end
end
