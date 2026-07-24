# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class AccountUpdateLocaleParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::AccountUpdateLocaleParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig do
        returns(XTwitterScraper::AccountUpdateLocaleParams::Locale::OrSymbol)
      end
      attr_accessor :locale

      sig do
        params(
          locale: XTwitterScraper::AccountUpdateLocaleParams::Locale::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(locale:, request_options: {})
      end

      sig do
        override.returns(
          {
            locale:
              XTwitterScraper::AccountUpdateLocaleParams::Locale::OrSymbol,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Locale
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::AccountUpdateLocaleParams::Locale)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EN =
          T.let(
            :en,
            XTwitterScraper::AccountUpdateLocaleParams::Locale::TaggedSymbol
          )
        TR =
          T.let(
            :tr,
            XTwitterScraper::AccountUpdateLocaleParams::Locale::TaggedSymbol
          )
        ES =
          T.let(
            :es,
            XTwitterScraper::AccountUpdateLocaleParams::Locale::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::AccountUpdateLocaleParams::Locale::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
