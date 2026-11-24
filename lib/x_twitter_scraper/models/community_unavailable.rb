# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class CommunityUnavailable < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute reason
      #   X's reason, as X writes it.
      #
      #   @return [String]
      required :reason, String

      # @!method initialize(reason:)
      #   Why X shows no Community for the post. Omitted when X names no reason.
      #
      #   @param reason [String] X's reason, as X writes it.
    end
  end
end
