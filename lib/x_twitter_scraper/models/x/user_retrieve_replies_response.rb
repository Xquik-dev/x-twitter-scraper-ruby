# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # User timeline with replies
      #
      # @see XTwitterScraper::Resources::X::Users#retrieve_replies
      module UserRetrieveRepliesResponse
        extend XTwitterScraper::Internal::Type::Union

        # Posts kept by the topic filter. Each kept post carries its topicScore. Follow next_cursor to check the next posts.
        variant -> { XTwitterScraper::TopicFilteredTweets }

        # Posts kept by the image filter. Each kept post carries its imageScore. Follow next_cursor to check the next posts.
        variant -> { XTwitterScraper::ImageFilteredTweets }

        # Follow next_cursor while the response reports more pages. A page can hold fewer rows than its limit & still report more. That report decides, not the row count. A page can be empty & still report more, filtered or not. Automatic search, user Tweet & reply coverage keeps shape, filters, aliases & billing. Cursors from before automatic mode keep their old behavior.
        variant -> { XTwitterScraper::PaginatedTweets }

        # @!method self.variants
        #   @return [Array(XTwitterScraper::Models::TopicFilteredTweets, XTwitterScraper::Models::ImageFilteredTweets, XTwitterScraper::Models::PaginatedTweets)]
      end
    end
  end
end
