# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class UserTipJar < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::UserTipJar, XTwitterScraper::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :bandcamp_handle

      sig { params(bandcamp_handle: String).void }
      attr_writer :bandcamp_handle

      sig { returns(T.nilable(String)) }
      attr_reader :bitcoin_handle

      sig { params(bitcoin_handle: String).void }
      attr_writer :bitcoin_handle

      sig { returns(T.nilable(String)) }
      attr_reader :cash_app_handle

      sig { params(cash_app_handle: String).void }
      attr_writer :cash_app_handle

      sig { returns(T.nilable(String)) }
      attr_reader :ethereum_handle

      sig { params(ethereum_handle: String).void }
      attr_writer :ethereum_handle

      sig { returns(T.nilable(String)) }
      attr_reader :gofundme_handle

      sig { params(gofundme_handle: String).void }
      attr_writer :gofundme_handle

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_enabled

      sig { params(is_enabled: T::Boolean).void }
      attr_writer :is_enabled

      sig { returns(T.nilable(String)) }
      attr_reader :patreon_handle

      sig { params(patreon_handle: String).void }
      attr_writer :patreon_handle

      sig { returns(T.nilable(String)) }
      attr_reader :pay_pal_handle

      sig { params(pay_pal_handle: String).void }
      attr_writer :pay_pal_handle

      sig { returns(T.nilable(String)) }
      attr_reader :venmo_handle

      sig { params(venmo_handle: String).void }
      attr_writer :venmo_handle

      # Public payment and creator-support handles shown on X.
      sig do
        params(
          bandcamp_handle: String,
          bitcoin_handle: String,
          cash_app_handle: String,
          ethereum_handle: String,
          gofundme_handle: String,
          is_enabled: T::Boolean,
          patreon_handle: String,
          pay_pal_handle: String,
          venmo_handle: String
        ).returns(T.attached_class)
      end
      def self.new(
        bandcamp_handle: nil,
        bitcoin_handle: nil,
        cash_app_handle: nil,
        ethereum_handle: nil,
        gofundme_handle: nil,
        is_enabled: nil,
        patreon_handle: nil,
        pay_pal_handle: nil,
        venmo_handle: nil
      )
      end

      sig do
        override.returns(
          {
            bandcamp_handle: String,
            bitcoin_handle: String,
            cash_app_handle: String,
            ethereum_handle: String,
            gofundme_handle: String,
            is_enabled: T::Boolean,
            patreon_handle: String,
            pay_pal_handle: String,
            venmo_handle: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
