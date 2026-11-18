# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class JobLocation < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::JobLocation,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Location ID, which the job search locationId takes.
      sig { returns(String) }
      attr_accessor :id

      # Place name with its region or country code.
      sig { returns(String) }
      attr_accessor :name

      sig { params(id: String, name: String).returns(T.attached_class) }
      def self.new(
        # Location ID, which the job search locationId takes.
        id:,
        # Place name with its region or country code.
        name:
      )
      end

      sig { override.returns({ id: String, name: String }) }
      def to_hash
      end
    end
  end
end
