# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Broadcasts#retrieve
      class BroadcastRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute broadcast
        #   X broadcast, a live video
        #
        #   @return [XTwitterScraper::Models::Broadcast]
        required :broadcast, -> { XTwitterScraper::Models::Broadcast }

        # @!method initialize(broadcast:)
        #   @param broadcast [XTwitterScraper::Models::Broadcast] X broadcast, a live video
      end
    end
  end
end
