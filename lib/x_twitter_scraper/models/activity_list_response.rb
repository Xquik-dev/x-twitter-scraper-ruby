# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Activity#list
    # @type [XTwitterScraper::Internal::Type::Converter]
    ActivityListResponse = XTwitterScraper::Internal::Type::ArrayOf[-> { XTwitterScraper::Models::ActivityLogRow }]
  end
end
