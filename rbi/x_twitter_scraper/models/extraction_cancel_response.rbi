# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ExtractionCancelResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ExtractionCancelResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Symbol) }
      attr_accessor :status

      sig { params(id: String, status: Symbol).returns(T.attached_class) }
      def self.new(id:, status: :canceled)
      end

      sig { override.returns({ id: String, status: Symbol }) }
      def to_hash
      end
    end
  end
end
