# typed: strong

module XTwitterScraper
  module Models
    class ExtractionRetrieveParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::ExtractionRetrieveParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Previous nextCursor.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Preserve source keys or convert result field names.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::ExtractionRetrieveParams::FieldStyle::OrSymbol
          )
        )
      end
      attr_reader :field_style

      sig do
        params(
          field_style:
            XTwitterScraper::ExtractionRetrieveParams::FieldStyle::OrSymbol
        ).void
      end
      attr_writer :field_style

      # Use outputMode=raw instead.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_raw

      sig { params(include_raw: T::Boolean).void }
      attr_writer :include_raw

      # Maximum number of results to return (1-1000, default 100)
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Select compact, full, or raw-compatible result fields.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::ExtractionRetrieveParams::OutputMode::OrSymbol
          )
        )
      end
      attr_reader :output_mode

      sig do
        params(
          output_mode:
            XTwitterScraper::ExtractionRetrieveParams::OutputMode::OrSymbol
        ).void
      end
      attr_writer :output_mode

      # Keep enrichment nested or merge it into each result.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::ExtractionRetrieveParams::OutputPreset::OrSymbol
          )
        )
      end
      attr_reader :output_preset

      sig do
        params(
          output_preset:
            XTwitterScraper::ExtractionRetrieveParams::OutputPreset::OrSymbol
        ).void
      end
      attr_writer :output_preset

      sig do
        params(
          id: String,
          cursor: String,
          field_style:
            XTwitterScraper::ExtractionRetrieveParams::FieldStyle::OrSymbol,
          include_raw: T::Boolean,
          limit: Integer,
          output_mode:
            XTwitterScraper::ExtractionRetrieveParams::OutputMode::OrSymbol,
          output_preset:
            XTwitterScraper::ExtractionRetrieveParams::OutputPreset::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Previous nextCursor.
        cursor: nil,
        # Preserve source keys or convert result field names.
        field_style: nil,
        # Use outputMode=raw instead.
        include_raw: nil,
        # Maximum number of results to return (1-1000, default 100)
        limit: nil,
        # Select compact, full, or raw-compatible result fields.
        output_mode: nil,
        # Keep enrichment nested or merge it into each result.
        output_preset: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            cursor: String,
            field_style:
              XTwitterScraper::ExtractionRetrieveParams::FieldStyle::OrSymbol,
            include_raw: T::Boolean,
            limit: Integer,
            output_mode:
              XTwitterScraper::ExtractionRetrieveParams::OutputMode::OrSymbol,
            output_preset:
              XTwitterScraper::ExtractionRetrieveParams::OutputPreset::OrSymbol,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Preserve source keys or convert result field names.
      module FieldStyle
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionRetrieveParams::FieldStyle)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SOURCE =
          T.let(
            :source,
            XTwitterScraper::ExtractionRetrieveParams::FieldStyle::TaggedSymbol
          )
        CAMEL_CASE =
          T.let(
            :camelCase,
            XTwitterScraper::ExtractionRetrieveParams::FieldStyle::TaggedSymbol
          )
        SNAKE_CASE =
          T.let(
            :snake_case,
            XTwitterScraper::ExtractionRetrieveParams::FieldStyle::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionRetrieveParams::FieldStyle::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Select compact, full, or raw-compatible result fields.
      module OutputMode
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionRetrieveParams::OutputMode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COMPACT =
          T.let(
            :compact,
            XTwitterScraper::ExtractionRetrieveParams::OutputMode::TaggedSymbol
          )
        FULL =
          T.let(
            :full,
            XTwitterScraper::ExtractionRetrieveParams::OutputMode::TaggedSymbol
          )
        RAW =
          T.let(
            :raw,
            XTwitterScraper::ExtractionRetrieveParams::OutputMode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionRetrieveParams::OutputMode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Keep enrichment nested or merge it into each result.
      module OutputPreset
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::ExtractionRetrieveParams::OutputPreset
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NESTED =
          T.let(
            :nested,
            XTwitterScraper::ExtractionRetrieveParams::OutputPreset::TaggedSymbol
          )
        FLAT =
          T.let(
            :flat,
            XTwitterScraper::ExtractionRetrieveParams::OutputPreset::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionRetrieveParams::OutputPreset::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
