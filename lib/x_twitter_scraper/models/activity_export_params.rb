# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Activity#export
    class ActivityExportParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute format_
      #   Answer format. JSON by default.
      #
      #   @return [Symbol, XTwitterScraper::Models::ActivityExportParams::Format]
      required :format_, enum: -> { XTwitterScraper::Models::ActivityExportParams::Format }, api_name: :format

      # @!attribute limit
      #   Most rows to return, with no upper limit. A PDF above 10,000 rows comes as a ZIP
      #   of PDF parts.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute category
      #   Activity group, like the Activity page's tabs. `all` by default, or `actions`,
      #   `extractions`, `monitors`, `webhooks` or `billing`.
      #
      #   @return [String, nil]
      optional :category, String

      # @!attribute status
      #   Comma-separated statuses.
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute q
      #   Search text.
      #
      #   @return [String, nil]
      optional :q, String

      # @!attribute since
      #   Oldest time, ISO 8601.
      #
      #   @return [String, nil]
      optional :since, String

      # @!attribute until_
      #   Newest time, ISO 8601.
      #
      #   @return [String, nil]
      optional :until_, String, api_name: :until

      # @!method initialize(format_:, limit: nil, category: nil, status: nil, q: nil, since: nil, until_: nil, request_options: {})
      #   @param format_ [Symbol, XTwitterScraper::Models::ActivityExportParams::Format] Answer format. JSON by default.
      #
      #   @param limit [Integer] Most rows to return, with no upper limit. A PDF above 10,000 rows comes as a ZIP of PDF parts.
      #
      #   @param category [String] Activity group, like the Activity page's tabs. `all` by default, or `actions`, `extractions`, `monitors`, `webhooks` or `billing`.
      #
      #   @param status [String] Comma-separated statuses.
      #
      #   @param q [String] Search text.
      #
      #   @param since [String] Oldest time, ISO 8601.
      #
      #   @param until_ [String] Newest time, ISO 8601.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      module Format
        extend XTwitterScraper::Internal::Type::Enum

        JSON = :json
        CSV = :csv
        XLSX = :xlsx
        MD = :md
        MD_DOCUMENT = :"md-document"
        PDF = :pdf
        TXT = :txt

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
