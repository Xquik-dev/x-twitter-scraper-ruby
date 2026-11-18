# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetListTopParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetListTopParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # What to rank tweets by. Defaults to likes. Singular names work too, such as
        # like.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::X::TweetListTopParams::Metric::TaggedSymbol
            )
          )
        end
        attr_reader :metric

        sig do
          params(
            metric:
              XTwitterScraper::Models::X::TweetListTopParams::Metric::OrSymbol
          ).void
        end
        attr_writer :metric

        # How far back to look. Defaults to day. Also takes 24h, 7d, 30d, daily, weekly
        # and monthly.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::X::TweetListTopParams::Window::TaggedSymbol
            )
          )
        end
        attr_reader :window

        sig do
          params(
            window:
              XTwitterScraper::Models::X::TweetListTopParams::Window::OrSymbol
          ).void
        end
        attr_writer :window

        # Only tweets from 1 country, as a 2- or 3-letter ISO 3166 code, such as US or
        # USA. Send country or language, not both.
        sig { returns(T.nilable(String)) }
        attr_reader :country

        sig { params(country: String).void }
        attr_writer :country

        # Only tweets in 1 language, as a 2-letter code, such as en. Send country or
        # language, not both.
        sig { returns(T.nilable(String)) }
        attr_reader :language

        sig { params(language: String).void }
        attr_writer :language

        # Pagination cursor for collection results. Also read as next_cursor, next_token,
        # pagination_token or continuation_token.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Items per page (1-100, default 20). Source, filters or credits can return fewer.
        # Follow next_cursor for more pages. Its aliases are limit, count, max_results,
        # maxItems, max_items & per_page.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

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
            metric:
              XTwitterScraper::Models::X::TweetListTopParams::Metric::OrSymbol,
            window:
              XTwitterScraper::Models::X::TweetListTopParams::Window::OrSymbol,
            country: String,
            language: String,
            cursor: String,
            page_size: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # What to rank tweets by. Defaults to likes. Singular names work too, such as
          # like.
          metric: nil,
          # How far back to look. Defaults to day. Also takes 24h, 7d, 30d, daily, weekly
          # and monthly.
          window: nil,
          # Only tweets from 1 country, as a 2- or 3-letter ISO 3166 code, such as US or
          # USA. Send country or language, not both.
          country: nil,
          # Only tweets in 1 language, as a 2-letter code, such as en. Send country or
          # language, not both.
          language: nil,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Items per page (1-100, default 20). Source, filters or credits can return fewer.
          # Follow next_cursor for more pages. Its aliases are limit, count, max_results,
          # maxItems, max_items & per_page.
          page_size: nil,
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
              metric:
                XTwitterScraper::Models::X::TweetListTopParams::Metric::TaggedSymbol,
              window:
                XTwitterScraper::Models::X::TweetListTopParams::Window::TaggedSymbol,
              country: String,
              language: String,
              cursor: String,
              page_size: Integer,
              fields: String,
              omit: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end

        module Metric
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::X::TweetListTopParams::Metric
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LIKES =
            T.let(
              :likes,
              XTwitterScraper::Models::X::TweetListTopParams::Metric::TaggedSymbol
            )
          REPLIES =
            T.let(
              :replies,
              XTwitterScraper::Models::X::TweetListTopParams::Metric::TaggedSymbol
            )
          QUOTES =
            T.let(
              :quotes,
              XTwitterScraper::Models::X::TweetListTopParams::Metric::TaggedSymbol
            )
          BOOKMARKS =
            T.let(
              :bookmarks,
              XTwitterScraper::Models::X::TweetListTopParams::Metric::TaggedSymbol
            )
          SHARES =
            T.let(
              :shares,
              XTwitterScraper::Models::X::TweetListTopParams::Metric::TaggedSymbol
            )
          VIEWS =
            T.let(
              :views,
              XTwitterScraper::Models::X::TweetListTopParams::Metric::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::X::TweetListTopParams::Metric::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Window
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::X::TweetListTopParams::Window
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DAY =
            T.let(
              :day,
              XTwitterScraper::Models::X::TweetListTopParams::Window::TaggedSymbol
            )
          WEEK =
            T.let(
              :week,
              XTwitterScraper::Models::X::TweetListTopParams::Window::TaggedSymbol
            )
          MONTH =
            T.let(
              :month,
              XTwitterScraper::Models::X::TweetListTopParams::Window::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::X::TweetListTopParams::Window::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
