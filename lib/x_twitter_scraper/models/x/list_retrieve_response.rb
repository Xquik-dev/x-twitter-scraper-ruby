# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Lists#retrieve
      class ListRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute list
        #   Public X List with its owner's public profile. It holds public fields only.
        #
        #   @return [XTwitterScraper::Models::XList]
        required :list, -> { XTwitterScraper::Models::XList }

        # @!method initialize(list:)
        #   @param list [XTwitterScraper::Models::XList] Public X List with its owner's public profile. It holds public fields only.
      end
    end
  end
end
