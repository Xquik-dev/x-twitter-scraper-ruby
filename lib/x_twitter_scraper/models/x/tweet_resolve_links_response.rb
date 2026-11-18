# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#resolve_links
      class TweetResolveLinksResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute links
        #
        #   @return [Array<XTwitterScraper::Models::ResolvedLink>]
        required :links, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::ResolvedLink] }

        # @!attribute unprocessed_urls
        #   Links not read, in the order sent. X did not answer for them in time, or
        #   available credits ran out. Send them again.
        #
        #   @return [Array<String>]
        required :unprocessed_urls,
                 XTwitterScraper::Internal::Type::ArrayOf[String],
                 api_name: :unprocessedUrls

        # @!method initialize(links:, unprocessed_urls:)
        #   @param links [Array<XTwitterScraper::Models::ResolvedLink>]
        #
        #   @param unprocessed_urls [Array<String>] Links not read, in the order sent. X did not answer for them in time, or available credits ran out. Send them again.
      end
    end
  end
end
