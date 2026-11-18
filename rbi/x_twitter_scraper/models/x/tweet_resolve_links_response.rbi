# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetResolveLinksResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetResolveLinksResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T::Array[XTwitterScraper::Models::ResolvedLink]) }
        attr_reader :links

        sig do
          params(
            links: T::Array[XTwitterScraper::Models::ResolvedLink::OrHash]
          ).void
        end
        attr_writer :links

        # Links not read, in the order sent. X did not answer for them in time, or
        # available credits ran out. Send them again.
        sig { returns(T::Array[String]) }
        attr_accessor :unprocessed_urls

        sig do
          params(
            links: T::Array[XTwitterScraper::Models::ResolvedLink::OrHash],
            unprocessed_urls: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          links:,
          # Links not read, in the order sent. X did not answer for them in time, or
          # available credits ran out. Send them again.
          unprocessed_urls:
        )
        end

        sig do
          override.returns(
            {
              links: T::Array[XTwitterScraper::Models::ResolvedLink],
              unprocessed_urls: T::Array[String]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
