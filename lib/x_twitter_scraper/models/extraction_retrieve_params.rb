# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#retrieve
    class ExtractionRetrieveParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute cursor
      #   Previous nextCursor.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute field_style
      #   Preserve source keys or convert result field names.
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionRetrieveParams::FieldStyle, nil]
      optional :field_style, enum: -> { XTwitterScraper::ExtractionRetrieveParams::FieldStyle }

      # @!attribute include_raw
      #   Use outputMode=raw instead.
      #
      #   @return [Boolean, nil]
      optional :include_raw, XTwitterScraper::Internal::Type::Boolean

      # @!attribute limit
      #   Maximum number of results to return (1-1000, default 100)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute output_mode
      #   Select compact, full, or raw-compatible result fields.
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionRetrieveParams::OutputMode, nil]
      optional :output_mode, enum: -> { XTwitterScraper::ExtractionRetrieveParams::OutputMode }

      # @!attribute output_preset
      #   Keep enrichment nested or merge it into each result.
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionRetrieveParams::OutputPreset, nil]
      optional :output_preset, enum: -> { XTwitterScraper::ExtractionRetrieveParams::OutputPreset }

      # @!method initialize(id:, cursor: nil, field_style: nil, include_raw: nil, limit: nil, output_mode: nil, output_preset: nil, request_options: {})
      #   @param id [String]
      #
      #   @param cursor [String] Previous nextCursor.
      #
      #   @param field_style [Symbol, XTwitterScraper::Models::ExtractionRetrieveParams::FieldStyle] Preserve source keys or convert result field names.
      #
      #   @param include_raw [Boolean] Use outputMode=raw instead.
      #
      #   @param limit [Integer] Maximum number of results to return (1-1000, default 100)
      #
      #   @param output_mode [Symbol, XTwitterScraper::Models::ExtractionRetrieveParams::OutputMode] Select compact, full, or raw-compatible result fields.
      #
      #   @param output_preset [Symbol, XTwitterScraper::Models::ExtractionRetrieveParams::OutputPreset] Keep enrichment nested or merge it into each result.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      # Preserve source keys or convert result field names.
      module FieldStyle
        extend XTwitterScraper::Internal::Type::Enum

        SOURCE = :source
        CAMEL_CASE = :camelCase
        SNAKE_CASE = :snake_case

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Select compact, full, or raw-compatible result fields.
      module OutputMode
        extend XTwitterScraper::Internal::Type::Enum

        COMPACT = :compact
        FULL = :full
        RAW = :raw

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Keep enrichment nested or merge it into each result.
      module OutputPreset
        extend XTwitterScraper::Internal::Type::Enum

        NESTED = :nested
        FLAT = :flat

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
