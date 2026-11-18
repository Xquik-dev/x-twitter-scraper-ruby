# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class UserAuxiliaryLabel < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute badge_url
      #
      #   @return [String, nil]
      optional :badge_url, String, api_name: :badgeUrl

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String

      # @!attribute user_label_display_type
      #
      #   @return [String, nil]
      optional :user_label_display_type, String, api_name: :userLabelDisplayType

      # @!attribute user_label_type
      #
      #   @return [String, nil]
      optional :user_label_type, String, api_name: :userLabelType

      # @!method initialize(badge_url: nil, description: nil, url: nil, user_label_display_type: nil, user_label_type: nil)
      #   A label X shows on an X profile beside its affiliation label.
      #
      #   @param badge_url [String]
      #
      #   @param description [String]
      #
      #   @param url [String]
      #
      #   @param user_label_display_type [String]
      #
      #   @param user_label_type [String]
    end
  end
end
