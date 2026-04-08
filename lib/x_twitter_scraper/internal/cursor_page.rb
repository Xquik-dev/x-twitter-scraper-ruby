# frozen_string_literal: true

module XTwitterScraper
  module Internal
    # @generic Elem
    #
    # @example
    #   if cursor_page.has_next?
    #     cursor_page = cursor_page.next_page
    #   end
    #
    # @example
    #   cursor_page.auto_paging_each do |tweet|
    #     puts(tweet)
    #   end
    class CursorPage
      include XTwitterScraper::Internal::Type::BasePage

      # @return [String, nil]
      attr_accessor :next_cursor

      # @return [Boolean]
      attr_accessor :has_next_page

      # @return [Boolean]
      def next_page?
        !empty? && !next_cursor.to_s.empty?
      end

      # @raise [XTwitterScraper::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = XTwitterScraper::Internal::Util.deep_merge(@req, {query: {cursor: next_cursor}})
        @client.request(req)
      end

      # @param blk [Proc]
      #
      # @yieldparam [generic<Elem>]
      def auto_paging_each(&blk)
        unless block_given?
          raise ArgumentError.new("A block must be given to ##{__method__}")
        end

        page = self
        loop do
          page.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @param client [XTwitterScraper::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}]
      # @param page_data [Hash{Symbol=>Object}]
      def initialize(client:, req:, headers:, page_data:)
        super

        @next_cursor = page_data[:next_cursor]
        @has_next_page = page_data[:has_next_page]
      end

      # @api private
      #
      # @return [String]
      def inspect
        # rubocop:disable Layout/LineLength
        model = XTwitterScraper::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)} next_cursor=#{next_cursor.inspect} has_next_page=#{has_next_page.inspect}>"
        # rubocop:enable Layout/LineLength
      end
    end
  end
end
