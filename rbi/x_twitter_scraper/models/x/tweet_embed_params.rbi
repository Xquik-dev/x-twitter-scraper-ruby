# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetEmbedParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetEmbedParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com &
        # twitter.com links with or without https://, www., mobile., a query or a
        # fragment, & /i/status or /i/web/status links. Anything else gets 400
        # `invalid_tweet_id`.
        sig { returns(String) }
        attr_accessor :id

        # Color theme of the embed. X uses light when left out.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::X::TweetEmbedParams::Theme::TaggedSymbol
            )
          )
        end
        attr_reader :theme

        sig do
          params(
            theme: XTwitterScraper::Models::X::TweetEmbedParams::Theme::OrSymbol
          ).void
        end
        attr_writer :theme

        # Set `true` to leave photos, videos, and link cards out.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :hide_media

        sig { params(hide_media: T::Boolean).void }
        attr_writer :hide_media

        # Set `true` to leave the tweet this one replies to out.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :hide_thread

        sig { params(hide_thread: T::Boolean).void }
        attr_writer :hide_thread

        # Set `true` to leave the widget script tag out, for pages that load it once
        # themselves.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :omit_script

        sig { params(omit_script: T::Boolean).void }
        attr_writer :omit_script

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
            theme:
              XTwitterScraper::Models::X::TweetEmbedParams::Theme::OrSymbol,
            hide_media: T::Boolean,
            hide_thread: T::Boolean,
            omit_script: T::Boolean,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com &
          # twitter.com links with or without https://, www., mobile., a query or a
          # fragment, & /i/status or /i/web/status links. Anything else gets 400
          # `invalid_tweet_id`.
          id:,
          # Color theme of the embed. X uses light when left out.
          theme: nil,
          # Set `true` to leave photos, videos, and link cards out.
          hide_media: nil,
          # Set `true` to leave the tweet this one replies to out.
          hide_thread: nil,
          # Set `true` to leave the widget script tag out, for pages that load it once
          # themselves.
          omit_script: nil,
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
              theme:
                XTwitterScraper::Models::X::TweetEmbedParams::Theme::TaggedSymbol,
              hide_media: T::Boolean,
              hide_thread: T::Boolean,
              omit_script: T::Boolean,
              fields: String,
              omit: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end

        module Theme
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, XTwitterScraper::Models::X::TweetEmbedParams::Theme)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LIGHT =
            T.let(
              :light,
              XTwitterScraper::Models::X::TweetEmbedParams::Theme::TaggedSymbol
            )
          DARK =
            T.let(
              :dark,
              XTwitterScraper::Models::X::TweetEmbedParams::Theme::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::X::TweetEmbedParams::Theme::TaggedSymbol
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
