# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetListResponse < XTwitterScraper::Models::PaginatedTweets
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetListResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Each `ids` entry that names no post, with why. Absent when every entry names a
        # post.
        sig do
          returns(
            T.nilable(
              T::Array[XTwitterScraper::Models::X::TweetListResponse::Skipped]
            )
          )
        end
        attr_reader :skipped

        sig do
          params(
            skipped:
              T::Array[
                XTwitterScraper::Models::X::TweetListResponse::Skipped::OrHash
              ]
          ).void
        end
        attr_writer :skipped

        # Requested tweets in request order.
        sig do
          params(
            skipped:
              T::Array[
                XTwitterScraper::Models::X::TweetListResponse::Skipped::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Each `ids` entry that names no post, with why. Absent when every entry names a
          # post.
          skipped: nil
        )
        end

        sig do
          override.returns(
            {
              skipped:
                T::Array[XTwitterScraper::Models::X::TweetListResponse::Skipped]
            }
          )
        end
        def to_hash
        end

        class Skipped < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::TweetListResponse::Skipped,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # The entry as sent.
          sig { returns(String) }
          attr_accessor :entry

          # Why the entry names no post.
          sig { returns(String) }
          attr_accessor :reason

          sig do
            params(entry: String, reason: String).returns(T.attached_class)
          end
          def self.new(
            # The entry as sent.
            entry:,
            # Why the entry names no post.
            reason:
          )
          end

          sig { override.returns({ entry: String, reason: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
