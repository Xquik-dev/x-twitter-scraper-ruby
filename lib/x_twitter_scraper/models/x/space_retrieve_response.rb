# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Spaces#retrieve
      class SpaceRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute space
        #   X Space
        #
        #   @return [XTwitterScraper::Models::Space]
        required :space, -> { XTwitterScraper::Models::Space }

        # @!method initialize(space:)
        #   @param space [XTwitterScraper::Models::Space] X Space
      end
    end
  end
end
