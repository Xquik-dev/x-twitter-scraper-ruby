# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Account#update_locale
    class AccountUpdateLocaleResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!attribute ignored_fields
      #   Fields the request sent that this route does not read, in the order sent. They
      #   changed nothing. The answer leaves this out when the route read every field.
      #
      #   @return [Array<String>, nil]
      optional :ignored_fields, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :ignoredFields

      # @!method initialize(success: true, ignored_fields: nil)
      #   @param success [Boolean, true]
      #
      #   @param ignored_fields [Array<String>] Fields the request sent that this route does not read, in the order sent. They c
    end
  end
end
