# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Internal
    module Type
      module BasePage
        # rubocop:disable Lint/UnusedMethodArgument

        # @api public
        #
        # @return [Boolean]
        def next_page? = (raise NotImplementedError)

        # @api public
        #
        # @raise [XTwitterScraper::Errors::APIError]
        # @return [self]
        def next_page = (raise NotImplementedError)

        # @api public
        #
        # @param blk [Proc]
        #
        # @yieldparam [generic<Elem>]
        # @return [void]
        def auto_paging_each(&blk) = (raise NotImplementedError)

        def to_enum = super(:auto_paging_each)

        alias_method :enum_for, :to_enum

        def initialize(client:, req:, headers:, page_data:)
          @client = client
          @req = req
          @model = req.fetch(:model)
          super()
        end
        # rubocop:enable Lint/UnusedMethodArgument
      end
    end
  end
end
