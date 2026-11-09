# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetSubscriberBadge < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute creator_id
      #   Account ID of the creator the author subscribes to.
      #
      #   @return [String]
      required :creator_id, String, api_name: :creatorId

      # @!method initialize(creator_id:)
      #   The Subscriber badge X shows on a reply. The reply's author subscribes to the
      #   creator who started the conversation. Omitted on a post without the badge.
      #
      #   @param creator_id [String] Account ID of the creator the author subscribes to.
    end
  end
end
