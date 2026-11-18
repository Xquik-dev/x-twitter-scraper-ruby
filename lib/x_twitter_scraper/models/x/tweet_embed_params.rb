# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#embed
      class TweetEmbedParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #   Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com &
        #   twitter.com links with or without https://, www., mobile., a query or a
        #   fragment, & /i/status or /i/web/status links. Anything else gets 400
        #   `invalid_tweet_id`.
        #
        #   @return [String]
        required :id, String

        # @!attribute theme
        #   Color theme of the embed. X uses light when left out.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::TweetEmbedParams::Theme, nil]
        optional :theme, enum: -> { XTwitterScraper::Models::X::TweetEmbedParams::Theme }

        # @!attribute hide_media
        #   Set `true` to leave photos, videos, and link cards out.
        #
        #   @return [Boolean, nil]
        optional :hide_media, XTwitterScraper::Internal::Type::Boolean, api_name: :hideMedia

        # @!attribute hide_thread
        #   Set `true` to leave the tweet this one replies to out.
        #
        #   @return [Boolean, nil]
        optional :hide_thread, XTwitterScraper::Internal::Type::Boolean, api_name: :hideThread

        # @!attribute omit_script
        #   Set `true` to leave the widget script tag out, for pages that load it once
        #   themselves.
        #
        #   @return [Boolean, nil]
        optional :omit_script, XTwitterScraper::Internal::Type::Boolean, api_name: :omitScript

        # @!attribute fields
        #   Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #   author.username. A list keeps the field in each item. Case & underscores do not
        #   matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        #   always stay. An unknown name answers 400 unknown_field with the valid names,
        #   before any read. The price stays the same. SDK row types then hold only the
        #   named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        #   the fields you need with `fields` & `omit`.
        #
        #   @return [String, nil]
        optional :fields, String

        # @!attribute omit
        #   Fields to drop from each row, comma-separated. It takes the same names as
        #   fields. With fields, it drops from the kept fields. A longer URL fails at the
        #   edge before Xquik reads it.
        #
        #   @return [String, nil]
        optional :omit, String

        # @!method initialize(id:, theme: nil, hide_media: nil, hide_thread: nil, omit_script: nil, fields: nil, omit: nil, request_options: {})
        #   @param id [String] Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com & twitter.com links with or without https://, www., mobile., a query or a fragment, & /i/status or /i/web/status links. Anything else gets 400 `invalid_tweet_id`.
        #
        #   @param theme [Symbol, XTwitterScraper::Models::X::TweetEmbedParams::Theme] Color theme of the embed. X uses light when left out.
        #
        #   @param hide_media [Boolean] Set `true` to leave photos, videos, and link cards out.
        #
        #   @param hide_thread [Boolean] Set `true` to leave the tweet this one replies to out.
        #
        #   @param omit_script [Boolean] Set `true` to leave the widget script tag out, for pages that load it once themselves.
        #
        #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

        module Theme
          extend XTwitterScraper::Internal::Type::Enum

          LIGHT = :light
          DARK = :dark

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
