# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetAuthorUnavailable < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute reason
      #   X's reason code.
      #
      #   @return [String]
      required :reason, String

      # @!attribute message
      #   X's notice text for the reason.
      #
      #   @return [String, nil]
      optional :message, String

      # @!method initialize(reason:, message: nil)
      #   Why the tweet has no author. X serves a suspended or deleted account as an
      #   unavailable user with a reason such as Suspended or NotFound. Omitted when the
      #   author is available.
      #
      #   @param reason [String] X's reason code.
      #
      #   @param message [String] X's notice text for the reason.
    end
  end
end
