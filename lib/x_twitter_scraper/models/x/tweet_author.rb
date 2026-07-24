# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      class TweetAuthor < XTwitterScraper::Models::UserProfile
        # @!method initialize
        #   Tweet author profile. The lookup route always includes follower count and
        #   verification state. Other profile fields appear when available.
      end
    end
  end
end
