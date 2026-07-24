# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetAuthor < XTwitterScraper::Models::UserProfile
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::TweetAuthor,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Tweet author profile. The lookup route always includes follower count and
        # verification state. Other profile fields appear when available.
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end
    end
  end
end
