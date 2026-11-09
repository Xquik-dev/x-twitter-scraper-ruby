# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class ReplyTweet < XTwitterScraper::Models::SearchTweet
      # @!attribute hidden_by_author
      #   Present on a reply the post's author hid. Complete-mode replies carry it when
      #   includeHidden asks for them.
      #
      #   @return [Boolean, nil]
      optional :hidden_by_author, XTwitterScraper::Internal::Type::Boolean, api_name: :hiddenByAuthor

      # @!method initialize(hidden_by_author: nil)
      #   Reply row. A reply the post's author hid carries hiddenByAuthor.
      #
      #   @param hidden_by_author [Boolean] Present on a reply the post's author hid. Complete-mode replies carry it when
    end
  end
end
