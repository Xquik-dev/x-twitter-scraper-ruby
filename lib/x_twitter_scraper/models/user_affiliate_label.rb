# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class UserAffiliateLabel < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute auxiliary_labels
      #   More labels X shows beside the affiliation, such as an automated account's
      #   owner.
      #
      #   @return [Array<XTwitterScraper::Models::UserAuxiliaryLabel>, nil]
      optional :auxiliary_labels, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::UserAuxiliaryLabel] }, api_name: :auxiliaryLabels

      # @!attribute badge_url
      #
      #   @return [String, nil]
      optional :badge_url, String, api_name: :badgeUrl

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute long_description
      #   Public text, ranges, references, and mention data.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :long_description,
               XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
               api_name: :longDescription

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String

      # @!attribute url_type
      #
      #   @return [String, nil]
      optional :url_type, String, api_name: :urlType

      # @!attribute user_label_display_type
      #
      #   @return [String, nil]
      optional :user_label_display_type, String, api_name: :userLabelDisplayType

      # @!attribute user_label_type
      #
      #   @return [String, nil]
      optional :user_label_type, String, api_name: :userLabelType

      # @!method initialize(auxiliary_labels: nil, badge_url: nil, description: nil, long_description: nil, url: nil, url_type: nil, user_label_display_type: nil, user_label_type: nil)
      #   Organization affiliation label shown on an X profile.
      #
      #   @param auxiliary_labels [Array<XTwitterScraper::Models::UserAuxiliaryLabel>] More labels X shows beside the affiliation, such as an automated account's owner.
      #
      #   @param badge_url [String]
      #
      #   @param description [String]
      #
      #   @param long_description [Hash{Symbol=>Object}] Public text, ranges, references, and mention data.
      #
      #   @param url [String]
      #
      #   @param url_type [String]
      #
      #   @param user_label_display_type [String]
      #
      #   @param user_label_type [String]
    end
  end
end
