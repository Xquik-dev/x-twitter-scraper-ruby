# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class JobCompany < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::JobCompany,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X company profile ID.
      sig { returns(String) }
      attr_accessor :id

      # Company name.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Company logo URL.
      sig { returns(T.nilable(String)) }
      attr_reader :logo_url

      sig { params(logo_url: String).void }
      attr_writer :logo_url

      sig do
        params(id: String, name: String, logo_url: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # X company profile ID.
        id:,
        # Company name.
        name: nil,
        # Company logo URL.
        logo_url: nil
      )
      end

      sig { override.returns({ id: String, name: String, logo_url: String }) }
      def to_hash
      end
    end
  end
end
