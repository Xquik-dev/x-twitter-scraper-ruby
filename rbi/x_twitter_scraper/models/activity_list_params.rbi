# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ActivityListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ActivityListParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Answer format. JSON by default.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::ActivityListParams::Format::TaggedSymbol
          )
        )
      end
      attr_reader :format_

      sig do
        params(
          format_: XTwitterScraper::Models::ActivityListParams::Format::OrSymbol
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
      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::ActivityListParams::Since::Variants
          )
        )
      end
      attr_reader :since

      sig { params(since: T.any(String, Time)).void }
      attr_writer :since

      # Newest time, ISO 8601.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::ActivityListParams::Until::Variants
          )
        )
      end
      attr_reader :until_

      sig { params(until_: T.any(String, Time)).void }
      attr_writer :until_

      sig do
        params(
          format_:
            XTwitterScraper::Models::ActivityListParams::Format::OrSymbol,
          limit: Integer,
          category: String,
          status: String,
          q: String,
          since: T.any(String, Time),
          until_: T.any(String, Time),
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Answer format. JSON by default.
        format_: nil,
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
              XTwitterScraper::Models::ActivityListParams::Format::TaggedSymbol,
            limit: Integer,
            category: String,
            status: String,
            q: String,
            since: XTwitterScraper::Models::ActivityListParams::Since::Variants,
            until_:
              XTwitterScraper::Models::ActivityListParams::Until::Variants,
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
            T.all(Symbol, XTwitterScraper::Models::ActivityListParams::Format)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        JSON =
          T.let(
            :json,
            XTwitterScraper::Models::ActivityListParams::Format::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::ActivityListParams::Format::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      module Since
        extend XTwitterScraper::Internal::Type::Union

        Variants = T.type_alias { T.any(String, Time) }

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::ActivityListParams::Since::Variants
            ]
          )
        end
        def self.variants
        end
      end

      module Until
        extend XTwitterScraper::Internal::Type::Union

        Variants = T.type_alias { T.any(String, Time) }

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::ActivityListParams::Until::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
