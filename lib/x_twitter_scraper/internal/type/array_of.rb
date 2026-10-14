# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Internal
    module Type
      class ArrayOf
        include XTwitterScraper::Internal::Type::Converter
        include XTwitterScraper::Internal::Util::SorbetRuntimeSupport

        private_class_method :new

        def self.[](...) = new(...)

        # @api public
        #
        # @param other [Object]
        #
        # @return [Boolean]
        def ===(other) = other.is_a?(Array) && other.all?(item_type)

        # @api public
        #
        # @param other [Object]
        #
        # @return [Boolean]
        def ==(other)
          # rubocop:disable-next Layout/LineLength
          other.is_a?(XTwitterScraper::Internal::Type::ArrayOf) && other.nilable? == nilable? && other.item_type == item_type
        end

        # @api public
        #
        # @return [Integer]
        def hash = [self.class, item_type].hash

        def coerce(value, state:)
          exactness = state.fetch(:exactness)

          unless value.is_a?(Array)
            exactness[:no] += 1
            state[:error] = TypeError.new("#{value.class} can't be coerced into #{Array}")
            return value
          end

          target = item_type
          exactness[:yes] += 1
          value
            .map do |item|
              case [nilable?, item]
              in [true, nil]
                exactness[:yes] += 1
                nil
              else
                XTwitterScraper::Internal::Type::Converter.coerce(target, item, state: state)
              end
            end
        end

        def dump(value, state:)
          target = item_type
          if value.is_a?(Array)
            value.map do
              XTwitterScraper::Internal::Type::Converter.dump(target, _1, state: state)
            end
          else
            super
          end
        end

        def to_sorbet_type
          T::Array[XTwitterScraper::Internal::Util::SorbetRuntimeSupport.to_sorbet_type(item_type)]
        end

        protected def item_type = @item_type_fn.call

        protected def nilable? = @nilable

        def initialize(type_info, spec = {})
          @item_type_fn = XTwitterScraper::Internal::Type::Converter.type_info(type_info || spec)
          @meta = XTwitterScraper::Internal::Type::Converter.meta_info(type_info, spec)
          @nilable = spec.fetch(:nil?, false)
        end

        def inspect(depth: 0)
          items = XTwitterScraper::Internal::Type::Converter.inspect(item_type, depth: depth.succ)

          "#{self.class}[#{[items, nilable? ? 'nil' : nil].compact.join(' | ')}]"
        end
      end
    end
  end
end
