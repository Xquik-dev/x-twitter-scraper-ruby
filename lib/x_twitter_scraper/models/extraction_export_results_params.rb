# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#export_results
    class ExtractionExportResultsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute format_
      #   Export file format
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionExportResultsParams::Format]
      required :format_, enum: -> { XTwitterScraper::ExtractionExportResultsParams::Format }

      # @!method initialize(id:, format_:, request_options: {})
      #   @param id [String]
      #
      #   @param format_ [Symbol, XTwitterScraper::Models::ExtractionExportResultsParams::Format] Export file format
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      # Export file format
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
    end
  end
end
