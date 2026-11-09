# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class AccountBasedIn < XTwitterScraper::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(XTwitterScraper::AccountBasedIn, XTwitterScraper::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :value

      sig { returns(XTwitterScraper::AccountBasedIn::Level::TaggedSymbol) }
      attr_accessor :level

      sig { returns(Time) }
      attr_accessor :observed_at

      # Null when X shows no label.
      sig { params(value: String, level: XTwitterScraper::AccountBasedIn::Level::OrSymbol, observed_at: Time).returns(T.attached_class) }
      def self.new(
        value:,
        level:,
        observed_at:
      )
      end

      sig { override.returns({ value: String, level: XTwitterScraper::AccountBasedIn::Level::TaggedSymbol, observed_at: Time }) }
      def to_hash
      end

      module Level
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, XTwitterScraper::AccountBasedIn::Level) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COUNTRY = T.let(:country, XTwitterScraper::AccountBasedIn::Level::TaggedSymbol)
        REGION = T.let(:region, XTwitterScraper::AccountBasedIn::Level::TaggedSymbol)

        sig { override.returns(T::Array[XTwitterScraper::AccountBasedIn::Level::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
