# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Draws#export
    class DrawExportParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute format_
      #   Export output format
      #
      #   @return [Symbol, XTwitterScraper::Models::DrawExportParams::Format]
      required :format_, enum: -> { XTwitterScraper::DrawExportParams::Format }

      # @!attribute type
      #   Export winners or all entries
      #
      #   @return [Symbol, XTwitterScraper::Models::DrawExportParams::Type, nil]
      optional :type, enum: -> { XTwitterScraper::DrawExportParams::Type }

      # @!method initialize(id:, format_:, type: nil, request_options: {})
      #   @param id [String]
      #
      #   @param format_ [Symbol, XTwitterScraper::Models::DrawExportParams::Format] Export output format
      #
      #   @param type [Symbol, XTwitterScraper::Models::DrawExportParams::Type] Export winners or all entries
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      # Export output format
      module Format
        extend XTwitterScraper::Internal::Type::Enum

        CSV = :csv
        JSON = :json
        MD = :md
        MD_DOCUMENT = :"md-document"
        PDF = :pdf
        TXT = :txt
        XLSX = :xlsx

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Export winners or all entries
      module Type
        extend XTwitterScraper::Internal::Type::Enum

        WINNERS = :winners
        ENTRIES = :entries

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
