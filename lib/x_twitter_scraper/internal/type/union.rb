# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Internal
    module Type
      module Union
        include XTwitterScraper::Internal::Type::Converter
        include XTwitterScraper::Internal::Util::SorbetRuntimeSupport

        private def known_variants = (@known_variants ||= [])

        protected def derefed_variants
          known_variants.map { |key, variant_fn, meta| [key, variant_fn.call, meta] }
        end

        def variants = derefed_variants.map { _2 }

        private def discriminator(property)
          case property
          in Symbol
            @discriminator = property
          end
        end

        private def variant(key, spec = nil)
          meta = XTwitterScraper::Internal::Type::Converter.meta_info(nil, spec)
          variant_info =
            case key
            in Symbol
              [key, XTwitterScraper::Internal::Type::Converter.type_info(spec), meta]
            in Proc | XTwitterScraper::Internal::Type::Converter | Class | Hash
              [nil, XTwitterScraper::Internal::Type::Converter.type_info(key), meta]
            end

          known_variants << variant_info
        end

        private def resolve_variant(value)
          case [@discriminator, value]
          in [_, XTwitterScraper::Internal::Type::BaseModel]
            value.class
          in [Symbol, Hash]
            key = value.fetch(@discriminator) do
              value.fetch(@discriminator.to_s, XTwitterScraper::Internal::OMIT)
            end

            return nil if key == XTwitterScraper::Internal::OMIT

            key = key.to_sym if key.is_a?(String)
            _, found = known_variants.find { |k,| k == key }
            found&.call
          else
            nil
          end
        end

        # rubocop:disable Style/HashEachMethods
        # rubocop:disable Style/CaseEquality

        # @api public
        #
        # @param other [Object]
        #
        # @return [Boolean]
        def ===(other)
          known_variants.any? do |_, variant_fn|
            variant_fn.call === other
          end
        end

        # @api public
        #
        # @param other [Object]
        #
        # @return [Boolean]
        def ==(other)
          XTwitterScraper::Internal::Type::Union === other && other.derefed_variants == derefed_variants
        end

        # @api public
        #
        # @return [Integer]
        def hash = variants.hash

        def coerce(value, state:)
          if (target = resolve_variant(value))
            return XTwitterScraper::Internal::Type::Converter.coerce(target, value, state: state)
          end

          strictness = state.fetch(:strictness)
          exactness = state.fetch(:exactness)

          alternatives = []
          known_variants.each do |_, variant_fn|
            target = variant_fn.call
            exact = state[:exactness] = {yes: 0, no: 0, maybe: 0}
            state[:branched] += 1

            coerced = XTwitterScraper::Internal::Type::Converter.coerce(target, value, state: state)
            yes, no, maybe = exact.values
            if (no + maybe).zero? || (!strictness && yes.positive?)
              exact.each { exactness[_1] += _2 }
              state[:exactness] = exactness
              return coerced
            elsif maybe.positive?
              alternatives << [[-yes, -maybe, no], exact, coerced]
            end
          end

          case alternatives.sort_by!(&:first)
          in []
            exactness[:no] += 1
            state[:error] = ArgumentError.new("no matching variant for #{value.inspect}")
            value
          in [[_, exact, coerced], *]
            exact.each { exactness[_1] += _2 }
            coerced
          end
            .tap { state[:exactness] = exactness }
        ensure
          state[:strictness] = strictness
        end

        def dump(value, state:)
          if (target = resolve_variant(value))
            return XTwitterScraper::Internal::Type::Converter.dump(target, value, state: state)
          end

          known_variants.each do
            target = _2.call
            if target === value
              return XTwitterScraper::Internal::Type::Converter.dump(
                target,
                value,
                state: state
              )
            end
          end

          super
        end

        def to_sorbet_type
          types = variants.map do
            XTwitterScraper::Internal::Util::SorbetRuntimeSupport.to_sorbet_type(_1)
          end.uniq
          case types
          in []
            T.noreturn
          in [type]
            type
          else
            T.any(*types)
          end
        end

        # rubocop:enable Style/CaseEquality
        # rubocop:enable Style/HashEachMethods

        def inspect(depth: 0)
          if depth.positive?
            return is_a?(Module) ? super() : self.class.name
          end

          members = variants.map { XTwitterScraper::Internal::Type::Converter.inspect(_1, depth: depth.succ) }
          prefix = is_a?(Module) ? name : self.class.name

          "#{prefix}[#{members.join(' | ')}]"
        end
      end
    end
  end
end
