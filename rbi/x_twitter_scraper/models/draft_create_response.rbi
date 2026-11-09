# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class DraftCreateResponse < XTwitterScraper::Models::DraftDetail
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::DraftCreateResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Fields the request sent that this route does not read, in the order sent. They
      # changed nothing. The answer leaves this out when the route read every field.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :ignored_fields

      sig { params(ignored_fields: T::Array[String]).void }
      attr_writer :ignored_fields

      # The fields a write did not read, when the request sent any.
      sig do
        params(ignored_fields: T::Array[String]).returns(T.attached_class)
      end
      def self.new(
        # Fields the request sent that this route does not read, in the order sent. They
        # changed nothing. The answer leaves this out when the route read every field.
        ignored_fields: nil
      )
      end

      sig { override.returns({ ignored_fields: T::Array[String] }) }
      def to_hash
      end
    end
  end
end
