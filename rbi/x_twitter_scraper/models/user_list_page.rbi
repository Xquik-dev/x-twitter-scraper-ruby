# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class UserListPage < XTwitterScraper::Models::PaginatedUsers
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::UserListPage,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Present on the last page of a filtered automatic read that sent no maxScan, once
      # the list scanned 100,000 profiles across its pages. That page is the list's
      # last.
      sig do
        returns(T.nilable(XTwitterScraper::Models::UserListPage::ScanLimit))
      end
      attr_reader :scan_limit

      sig do
        params(
          scan_limit: XTwitterScraper::Models::UserListPage::ScanLimit::OrHash
        ).void
      end
      attr_writer :scan_limit

      # A relationship page. A filtered read's last page may name the scan limit that
      # ended it.
      sig do
        params(
          scan_limit: XTwitterScraper::Models::UserListPage::ScanLimit::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Present on the last page of a filtered automatic read that sent no maxScan, once
        # the list scanned 100,000 profiles across its pages. That page is the list's
        # last.
        scan_limit: nil
      )
      end

      sig do
        override.returns(
          { scan_limit: XTwitterScraper::Models::UserListPage::ScanLimit }
        )
      end
      def to_hash
      end

      class ScanLimit < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::UserListPage::ScanLimit,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The profiles a filtered read scans of a list without maxScan.
        sig { returns(Integer) }
        attr_accessor :limit

        # What stopped the list & how to read further.
        sig { returns(String) }
        attr_accessor :message

        # Profiles the list read across its pages, kept or dropped by the filters. The
        # last page may read past the limit.
        sig { returns(Integer) }
        attr_accessor :rows_read

        # Present on the last page of a filtered automatic read that sent no maxScan, once
        # the list scanned 100,000 profiles across its pages. That page is the list's
        # last.
        sig do
          params(message: String, rows_read: Integer, limit: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # What stopped the list & how to read further.
          message:,
          # Profiles the list read across its pages, kept or dropped by the filters. The
          # last page may read past the limit.
          rows_read:,
          # The profiles a filtered read scans of a list without maxScan.
          limit: 100_000
        )
        end

        sig do
          override.returns(
            { limit: Integer, message: String, rows_read: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
