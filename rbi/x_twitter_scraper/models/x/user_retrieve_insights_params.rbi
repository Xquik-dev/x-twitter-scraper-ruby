# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class UserRetrieveInsightsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::UserRetrieveInsightsParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # User ID, username with or without @, or URL-encoded profile URL, such as
        # x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a
        # username's ID before sending. Anything else gets 400 `invalid_user_id`.
        sig { returns(String) }
        attr_accessor :id

        # Recent posts to read for the averages and rates. The read stops at this count,
        # at the account's oldest post or after about 40 seconds. `sample.read` says how
        # many it read, and `sample.posts` how many of those the averages used.
        # `pageSize`, `count`, `max_results`, `maxItems`, `max_items` & `per_page` are
        # accepted aliases.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        sig { returns(T.nilable(String)) }
        attr_reader :fields

        sig { params(fields: String).void }
        attr_writer :fields

        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        sig { returns(T.nilable(String)) }
        attr_reader :omit

        sig { params(omit: String).void }
        attr_writer :omit

        sig do
          params(
            id: String,
            limit: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # User ID, username with or without @, or URL-encoded profile URL, such as
          # x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a
          # username's ID before sending. Anything else gets 400 `invalid_user_id`.
          id:,
          # Recent posts to read for the averages and rates. The read stops at this count,
          # at the account's oldest post or after about 40 seconds. `sample.read` says how
          # many it read, and `sample.posts` how many of those the averages used.
          # `pageSize`, `count`, `max_results`, `maxItems`, `max_items` & `per_page` are
          # accepted aliases.
          limit: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              limit: Integer,
              fields: String,
              omit: String,
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
