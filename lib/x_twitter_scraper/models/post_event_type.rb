# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # Type of post monitor event. post.reply.new & post.quote.new fire for each new
    # direct reply & quote. A metric's changed event fires at most once a minute &
    # covers the whole change since the last one. post.edited carries the text before
    # the edit. post.deleted fires once Xquik confirms the author deleted the post.
    module PostEventType
      extend XTwitterScraper::Internal::Type::Enum

      POST_REPLY_NEW = :"post.reply.new"
      POST_QUOTE_NEW = :"post.quote.new"
      POST_LIKES_CHANGED = :"post.likes.changed"
      POST_RETWEETS_CHANGED = :"post.retweets.changed"
      POST_REPLIES_CHANGED = :"post.replies.changed"
      POST_QUOTES_CHANGED = :"post.quotes.changed"
      POST_BOOKMARKS_CHANGED = :"post.bookmarks.changed"
      POST_VIEWS_CHANGED = :"post.views.changed"
      POST_EDITED = :"post.edited"
      POST_DELETED = :"post.deleted"

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
