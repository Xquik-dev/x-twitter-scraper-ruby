# typed: strong

module XTwitterScraper
  module Models
    class ExtractionExportResultsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::ExtractionExportResultsParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig do
        returns(
          T.nilable(
            XTwitterScraper::ExtractionExportResultsParams::Format::OrSymbol
          )
        )
      end
      attr_reader :format_

      sig do
        params(
          format_:
            XTwitterScraper::ExtractionExportResultsParams::Format::OrSymbol
        ).void
      end
      attr_writer :format_

      sig do
        params(
          id: String,
          format_:
            XTwitterScraper::ExtractionExportResultsParams::Format::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(id:, format_: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            id: String,
            format_:
              XTwitterScraper::ExtractionExportResultsParams::Format::OrSymbol,
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
            T.all(
              Symbol,
              XTwitterScraper::ExtractionExportResultsParams::Format
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CSV =
          T.let(
            :csv,
            XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
          )
        JSON =
          T.let(
            :json,
            XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
          )
        MD =
          T.let(
            :md,
            XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
          )
        MD_DOCUMENT =
          T.let(
            :"md-document",
            XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
          )
        PDF =
          T.let(
            :pdf,
            XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
          )
        TXT =
          T.let(
            :txt,
            XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
          )
        XLSX =
          T.let(
            :xlsx,
            XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
