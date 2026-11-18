# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # What 1 follower looks like from its public profile.
    module FollowerClass
      extend XTwitterScraper::Internal::Type::Enum

      AUTOMATED = :automated
      INACTIVE = :inactive
      LIKELYFAKE = :likelyFake
      LIKELYREAL = :likelyReal
      TOONEW = :tooNew

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
