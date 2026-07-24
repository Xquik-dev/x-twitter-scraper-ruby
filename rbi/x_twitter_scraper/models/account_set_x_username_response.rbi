# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class AccountSetXUsernameResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::AccountSetXUsernameResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig { returns(String) }
      attr_accessor :x_username

      sig do
        params(x_username: String, success: T::Boolean).returns(
          T.attached_class
        )
      end
      def self.new(x_username:, success: true)
      end

      sig { override.returns({ success: T::Boolean, x_username: String }) }
      def to_hash
      end
    end
  end
end
