# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class AccountUpdateLocaleResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::AccountUpdateLocaleResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :success

      # Fields the request sent that this route does not read, in the order sent. They
      # changed nothing. The answer leaves this out when the route read every field.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :ignored_fields

      sig { params(ignored_fields: T::Array[String]).void }
      attr_writer :ignored_fields

      sig do
        params(success: T::Boolean, ignored_fields: T::Array[String]).returns(
          T.attached_class
        )
      end
      def self.new(
        success: true,
        # Fields the request sent that this route does not read, in the order sent. They
        # changed nothing. The answer leaves this out when the route read every field.
        ignored_fields: nil
      )
      end

      sig do
        override.returns(
          { success: T::Boolean, ignored_fields: T::Array[String] }
        )
      end
      def to_hash
      end
    end
  end
end
