# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetGetRetweeterIdsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetGetRetweeterIdsParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com &
        # twitter.com links with or without https://, www., mobile., a query or a
        # fragment, & /i/status or /i/web/status links. Anything else gets 400
        # `invalid_tweet_id`.
        sig { returns(String) }
        attr_accessor :id

        # Pagination cursor for collection results. Also read as next_cursor, next_token,
        # pagination_token or continuation_token.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Profiles to request from this page. A page holds up to 10,000, so a larger
        # pageSize gets the largest page. Default 200. Source, filters or credits can
        # return fewer. Follow next_cursor for more pages. Its aliases are limit, count,
        # max_results, maxItems, max_items & per_page.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com &
          # twitter.com links with or without https://, www., mobile., a query or a
          # fragment, & /i/status or /i/web/status links. Anything else gets 400
          # `invalid_tweet_id`.
          id:,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Profiles to request from this page. A page holds up to 10,000, so a larger
          # pageSize gets the largest page. Default 200. Source, filters or credits can
          # return fewer. Follow next_cursor for more pages. Its aliases are limit, count,
          # max_results, maxItems, max_items & per_page.
          page_size: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              cursor: String,
              page_size: Integer,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
