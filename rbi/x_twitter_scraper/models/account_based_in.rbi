# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class AccountBasedIn < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::AccountBasedIn,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :value

      sig { returns(XTwitterScraper::AccountBasedIn::Level::TaggedSymbol) }
      attr_accessor :level

      sig { returns(Time) }
      attr_accessor :observed_at

      # Null when X shows no label.
      sig do
        params(
          value: String,
          level: XTwitterScraper::AccountBasedIn::Level::OrSymbol,
          observed_at: Time
        ).returns(T.attached_class)
      end
      def self.new(value:, level:, observed_at:)
      end

      sig do
        override.returns(
          {
            value: String,
            level: XTwitterScraper::AccountBasedIn::Level::TaggedSymbol,
            observed_at: Time
          }
        )
      end
      def to_hash
      end

      module Level
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::AccountBasedIn::Level) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COUNTRY =
          T.let(:country, XTwitterScraper::AccountBasedIn::Level::TaggedSymbol)
        REGION =
          T.let(:region, XTwitterScraper::AccountBasedIn::Level::TaggedSymbol)

        sig do
          override.returns(
            T::Array[XTwitterScraper::AccountBasedIn::Level::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
