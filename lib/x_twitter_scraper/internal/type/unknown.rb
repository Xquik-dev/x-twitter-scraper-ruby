# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Internal
    module Type
      class Unknown
        extend XTwitterScraper::Internal::Type::Converter
        extend XTwitterScraper::Internal::Util::SorbetRuntimeSupport

        # rubocop:disable Lint/UnusedMethodArgument
        private_class_method :new

        # @api public
        #
        # @param other [Object]
        #
        # @return [Boolean]
        def self.===(other) = true

        # @api public
        #
        # @param other [Object]
        #
        # @return [Boolean]
        def self.==(other) = other.is_a?(Class) && other <= XTwitterScraper::Internal::Type::Unknown

        class << self
          def coerce(value, state:)
            state.fetch(:exactness)[:yes] += 1
            value
          end

          def to_sorbet_type
            T.anything
          end
        end
        # rubocop:enable Lint/UnusedMethodArgument
      end
    end
  end
end
