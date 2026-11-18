# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class UserLiveStatus < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute live
      #   True while the user's latest broadcast is running.
      #
      #   @return [Boolean]
      required :live, XTwitterScraper::Internal::Type::Boolean

      # @!attribute broadcast
      #   Latest broadcast, live or ended. Null when X shows none. Holds only its ID &
      #   state when X can't read it in full.
      #
      #   @return [XTwitterScraper::Models::Broadcast, nil]
      required :broadcast, -> { XTwitterScraper::Models::Broadcast }, nil?: true

      # @!attribute user_id
      #   ID of the user.
      #
      #   @return [String]
      required :user_id, String, api_name: :userId

      # @!attribute user_name
      #   Username of the user.
      #
      #   @return [String]
      required :user_name, String, api_name: :userName

      # @!method initialize(live:, broadcast:, user_id:, user_name:)
      #   Says whether a user broadcasts live video on X now. `broadcast` is their latest
      #   broadcast, live or ended, and null when X shows none.
      #
      #   @param live [Boolean] True while the user's latest broadcast is running.
      #
      #   @param broadcast [XTwitterScraper::Models::Broadcast, nil] Latest broadcast, live or ended. Null when X shows none. Holds only its ID & state when X can't read it in full.
      #
      #   @param user_id [String] ID of the user.
      #
      #   @param user_name [String] Username of the user.
    end
  end
end
