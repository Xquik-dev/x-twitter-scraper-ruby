# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ResolvedLink < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ResolvedLink,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The t.co link, as `https://t.co/<code>`.
      sig { returns(String) }
      attr_accessor :url

      # Target URL, as the link's author set it. Xquik does not check it. Absent for a
      # link t.co does not have.
      sig { returns(T.nilable(String)) }
      attr_reader :resolved_url

      sig { params(resolved_url: String).void }
      attr_writer :resolved_url

      sig do
        params(url: String, resolved_url: String).returns(T.attached_class)
      end
      def self.new(
        # The t.co link, as `https://t.co/<code>`.
        url:,
        # Target URL, as the link's author set it. Xquik does not check it. Absent for a
        # link t.co does not have.
        resolved_url: nil
      )
      end

      sig { override.returns({ url: String, resolved_url: String }) }
      def to_hash
      end
    end
  end
end
