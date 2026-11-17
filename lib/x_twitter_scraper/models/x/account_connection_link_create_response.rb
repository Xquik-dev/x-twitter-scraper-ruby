# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::AccountConnectionLinks#create
      class AccountConnectionLinkCreateResponse < XTwitterScraper::Models::X::XAccountConnectionLink
        # @!attribute url
        #   The page to open. Its fragment holds the token, so treat it as a secret and keep
        #   it out of logs.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(url:)
        #   A new connect link and the only copy of its page URL.
        #
        #   @param url [String] The page to open. Its fragment holds the token, so treat it as a secret and keep it out of logs.
      end
    end
  end
end
