# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ActivityExportParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ActivityExportParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Answer format. JSON by default.
      sig do
        returns(
          XTwitterScraper::Models::ActivityExportParams::Format::TaggedSymbol
        )
      end
      attr_reader :format_

      sig do
        params(
          format_:
            XTwitterScraper::Models::ActivityExportParams::Format::OrSymbol
        ).void
      end
      attr_writer :format_

      # Most rows to return, with no upper limit. A PDF above 10,000 rows comes as a ZIP
      # of PDF parts.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Activity group, like the Activity page's tabs. `all` by default, or `actions`,
      # `extractions`, `monitors`, `webhooks` or `billing`.
      sig { returns(T.nilable(String)) }
      attr_reader :category

      sig { params(category: String).void }
      attr_writer :category

      # Comma-separated statuses.
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # Search text.
      sig { returns(T.nilable(String)) }
      attr_reader :q

      sig { params(q: String).void }
      attr_writer :q

      # Oldest time, ISO 8601.
      sig { returns(T.nilable(String)) }
      attr_reader :since

      sig { params(since: String).void }
      attr_writer :since

      # Newest time, ISO 8601.
      sig { returns(T.nilable(String)) }
      attr_reader :until_

      sig { params(until_: String).void }
      attr_writer :until_

      sig do
        params(
          format_:
            XTwitterScraper::Models::ActivityExportParams::Format::OrSymbol,
          limit: Integer,
          category: String,
          status: String,
          q: String,
          since: String,
          until_: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Answer format. JSON by default.
        format_:,
        # Most rows to return, with no upper limit. A PDF above 10,000 rows comes as a ZIP
        # of PDF parts.
        limit: nil,
        # Activity group, like the Activity page's tabs. `all` by default, or `actions`,
        # `extractions`, `monitors`, `webhooks` or `billing`.
        category: nil,
        # Comma-separated statuses.
        status: nil,
        # Search text.
        q: nil,
        # Oldest time, ISO 8601.
        since: nil,
        # Newest time, ISO 8601.
        until_: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            format_:
              XTwitterScraper::Models::ActivityExportParams::Format::TaggedSymbol,
            limit: Integer,
            category: String,
            status: String,
            q: String,
            since: String,
            until_: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Format
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::ActivityExportParams::Format)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        JSON =
          T.let(
            :json,
            XTwitterScraper::Models::ActivityExportParams::Format::TaggedSymbol
          )
        CSV =
          T.let(
            :csv,
            XTwitterScraper::Models::ActivityExportParams::Format::TaggedSymbol
          )
        XLSX =
          T.let(
            :xlsx,
            XTwitterScraper::Models::ActivityExportParams::Format::TaggedSymbol
          )
        MD =
          T.let(
            :md,
            XTwitterScraper::Models::ActivityExportParams::Format::TaggedSymbol
          )
        MD_DOCUMENT =
          T.let(
            :"md-document",
            XTwitterScraper::Models::ActivityExportParams::Format::TaggedSymbol
          )
        PDF =
          T.let(
            :pdf,
            XTwitterScraper::Models::ActivityExportParams::Format::TaggedSymbol
          )
        TXT =
          T.let(
            :txt,
            XTwitterScraper::Models::ActivityExportParams::Format::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::ActivityExportParams::Format::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
