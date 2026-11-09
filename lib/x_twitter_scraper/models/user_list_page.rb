# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class UserListPage < XTwitterScraper::Models::PaginatedUsers
      # @!attribute scan_limit
      #   Present on the last page of a filtered automatic read that sent no maxScan, once
      #   the list scanned 100,000 profiles across its pages. That page is the list's
      #   last.
      #
      #   @return [XTwitterScraper::Models::UserListPage::ScanLimit, nil]
      optional :scan_limit, -> { XTwitterScraper::Models::UserListPage::ScanLimit }, api_name: :scanLimit

      # @!method initialize(scan_limit: nil)
      #   A relationship page. A filtered read's last page may name the scan limit that
      #   ended it.
      #
      #   @param scan_limit [XTwitterScraper::Models::UserListPage::ScanLimit] Present on the last page of a filtered automatic read that sent no maxScan, once

      # @see XTwitterScraper::Models::UserListPage#scan_limit
      class ScanLimit < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute limit
        #   The profiles a filtered read scans of a list without maxScan.
        #
        #   @return [Integer, 100000]
        required :limit, const: 100_000

        # @!attribute message
        #   What stopped the list & how to read further.
        #
        #   @return [String]
        required :message, String

        # @!attribute rows_read
        #   Profiles the list read across its pages, kept or dropped by the filters. The
        #   last page may read past the limit.
        #
        #   @return [Integer]
        required :rows_read, Integer, api_name: :rowsRead

        # @!method initialize(message:, rows_read:, limit: 100000)
        #   Present on the last page of a filtered automatic read that sent no maxScan, once
        #   the list scanned 100,000 profiles across its pages. That page is the list's
        #   last.
        #
        #   @param message [String] What stopped the list & how to read further.
        #
        #   @param rows_read [Integer] Profiles the list read across its pages, kept or dropped by the filters. The
        #
        #   @param limit [Integer, 100000] The profiles a filtered read scans of a list without maxScan.
      end
    end
  end
end
