# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Internal
    module Type
      class Boolean
        extend XTwitterScraper::Internal::Type::Converter
        extend XTwitterScraper::Internal::Util::SorbetRuntimeSupport

        private_class_method :new

        # @api public
        #
        # @param other [Object]
        #
        # @return [Boolean]
        def self.===(other) = other == true || other == false

        # @api public
        #
        # @param other [Object]
        #
        # @return [Boolean]
        def self.==(other) = other.is_a?(Class) && other <= XTwitterScraper::Internal::Type::Boolean

        class << self
          def coerce(value, state:)
            state.fetch(:exactness)[value == true || value == false ? :yes : :no] += 1
            value
          end

          def to_sorbet_type
            T::Boolean
          end
        end
      end
    end
  end
end
