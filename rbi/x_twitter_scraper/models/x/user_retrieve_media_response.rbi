# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      # List of media tweets
      module UserRetrieveMediaResponse
        extend XTwitterScraper::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              XTwitterScraper::TopicFilteredTweets,
              XTwitterScraper::ImageFilteredTweets,
              XTwitterScraper::PaginatedTweets
            )
          end

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::X::UserRetrieveMediaResponse::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
