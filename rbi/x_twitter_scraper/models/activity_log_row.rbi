# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ActivityLogRow < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ActivityLogRow,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # ISO 8601 time in UTC to the millisecond. Empty on the notice row.
      sig { returns(String) }
      attr_accessor :time

      sig { returns(String) }
      attr_accessor :category

      sig { returns(String) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :activity

      sig { returns(String) }
      attr_accessor :status

      sig { returns(String) }
      attr_accessor :source

      sig { returns(String) }
      attr_accessor :target

      sig do
        returns(XTwitterScraper::Models::ActivityLogRow::Results::Variants)
      end
      attr_reader :results

      sig { params(results: T.any(Integer, String)).void }
      attr_writer :results

      sig do
        returns(XTwitterScraper::Models::ActivityLogRow::Credits::Variants)
      end
      attr_reader :credits

      sig { params(credits: T.any(Integer, String)).void }
      attr_writer :credits

      sig { returns(String) }
      attr_accessor :details

      # Activity ID. GET /activity/{id} returns its full record.
      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :link

      sig do
        params(
          time: String,
          category: String,
          type: String,
          activity: String,
          status: String,
          source: String,
          target: String,
          results: T.any(Integer, String),
          credits: T.any(Integer, String),
          details: String,
          id: String,
          link: String
        ).returns(T.attached_class)
      end
      def self.new(
        # ISO 8601 time in UTC to the millisecond. Empty on the notice row.
        time:,
        category:,
        type:,
        activity:,
        status:,
        source:,
        target:,
        results:,
        credits:,
        details:,
        # Activity ID. GET /activity/{id} returns its full record.
        id:,
        link:
      )
      end

      sig do
        override.returns(
          {
            time: String,
            category: String,
            type: String,
            activity: String,
            status: String,
            source: String,
            target: String,
            results: XTwitterScraper::Models::ActivityLogRow::Results::Variants,
            credits: XTwitterScraper::Models::ActivityLogRow::Credits::Variants,
            details: String,
            id: String,
            link: String
          }
        )
      end
      def to_hash
      end

      module Results
        extend XTwitterScraper::Internal::Type::Union

        Variants = T.type_alias { T.any(Integer, String) }

        sig do
          override.returns(
            T::Array[XTwitterScraper::Models::ActivityLogRow::Results::Variants]
          )
        end
        def self.variants
        end
      end

      module Credits
        extend XTwitterScraper::Internal::Type::Union

        Variants = T.type_alias { T.any(Integer, String) }

        sig do
          override.returns(
            T::Array[XTwitterScraper::Models::ActivityLogRow::Credits::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
