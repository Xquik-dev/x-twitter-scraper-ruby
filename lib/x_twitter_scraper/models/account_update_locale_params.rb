# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Account#update_locale
    class AccountUpdateLocaleParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute locale
      #
      #   @return [Symbol, XTwitterScraper::Models::AccountUpdateLocaleParams::Locale]
      required :locale, enum: -> { XTwitterScraper::AccountUpdateLocaleParams::Locale }

      # @!method initialize(locale:, request_options: {})
      #   @param locale [Symbol, XTwitterScraper::Models::AccountUpdateLocaleParams::Locale]
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      module Locale
        extend XTwitterScraper::Internal::Type::Enum

        EN = :en
        TR = :tr
        ES = :es

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
