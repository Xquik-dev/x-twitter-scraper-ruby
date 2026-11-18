# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Internal
    class Stream
      include Enumerable

      def initialize(model:, stream:, **)
        @model = model
        @stream = stream
      end

      def each
        return enum_for(__method__) unless block_given?

        @stream.each do |message|
          data = message.fetch(:data)
          next if data.nil? || data.strip.empty?

          yield(XTwitterScraper::Internal::Type::Converter.coerce(
            @model,
            JSON.parse(data, symbolize_names: true)
          ))
        end
      end

      def close = XTwitterScraper::Internal::Util.close_fused!(@stream)
    end
  end
end
