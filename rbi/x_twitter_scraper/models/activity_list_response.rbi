# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    ActivityListResponse =
      T.let(
        XTwitterScraper::Internal::Type::ArrayOf[
          XTwitterScraper::Models::ActivityLogRow
        ],
        XTwitterScraper::Internal::Type::Converter
      )
  end
end
