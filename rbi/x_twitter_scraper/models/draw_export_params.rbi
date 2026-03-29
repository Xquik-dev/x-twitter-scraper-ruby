# typed: strong

module XTwitterScraper
  module Models
    class DrawExportParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::DrawExportParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig do
        returns(T.nilable(XTwitterScraper::DrawExportParams::Format::OrSymbol))
      end
      attr_reader :format_

      sig do
        params(
          format_: XTwitterScraper::DrawExportParams::Format::OrSymbol
        ).void
      end
      attr_writer :format_

      # Export winners or all entries
      sig do
        returns(T.nilable(XTwitterScraper::DrawExportParams::Type::OrSymbol))
      end
      attr_reader :type

      sig do
        params(type: XTwitterScraper::DrawExportParams::Type::OrSymbol).void
      end
      attr_writer :type

      sig do
        params(
          id: String,
          format_: XTwitterScraper::DrawExportParams::Format::OrSymbol,
          type: XTwitterScraper::DrawExportParams::Type::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        format_: nil,
        # Export winners or all entries
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            format_: XTwitterScraper::DrawExportParams::Format::OrSymbol,
            type: XTwitterScraper::DrawExportParams::Type::OrSymbol,
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
            T.all(Symbol, XTwitterScraper::DrawExportParams::Format)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CSV =
          T.let(:csv, XTwitterScraper::DrawExportParams::Format::TaggedSymbol)
        JSON =
          T.let(:json, XTwitterScraper::DrawExportParams::Format::TaggedSymbol)
        MD = T.let(:md, XTwitterScraper::DrawExportParams::Format::TaggedSymbol)
        MD_DOCUMENT =
          T.let(
            :"md-document",
            XTwitterScraper::DrawExportParams::Format::TaggedSymbol
          )
        PDF =
          T.let(:pdf, XTwitterScraper::DrawExportParams::Format::TaggedSymbol)
        TXT =
          T.let(:txt, XTwitterScraper::DrawExportParams::Format::TaggedSymbol)
        XLSX =
          T.let(:xlsx, XTwitterScraper::DrawExportParams::Format::TaggedSymbol)

        sig do
          override.returns(
            T::Array[XTwitterScraper::DrawExportParams::Format::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Export winners or all entries
      module Type
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::DrawExportParams::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WINNERS =
          T.let(:winners, XTwitterScraper::DrawExportParams::Type::TaggedSymbol)
        ENTRIES =
          T.let(:entries, XTwitterScraper::DrawExportParams::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[XTwitterScraper::DrawExportParams::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
