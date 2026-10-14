# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Internal
    module Type
      module Converter
        extend XTwitterScraper::Internal::Util::SorbetRuntimeSupport

        # rubocop:disable Lint/UnusedMethodArgument
        def coerce(value, state:) = (raise NotImplementedError)

        def dump(value, state:)
          case value
          in Array
            value.map { XTwitterScraper::Internal::Type::Unknown.dump(_1, state: state) }
          in Hash
            value.transform_values { XTwitterScraper::Internal::Type::Unknown.dump(_1, state: state) }
          in XTwitterScraper::Internal::Type::BaseModel
            value.class.dump(value, state: state)
          in StringIO
            value.string
          in Pathname | IO
            state[:can_retry] = false if value.is_a?(IO)
            XTwitterScraper::FilePart.new(value)
          in XTwitterScraper::FilePart
            state[:can_retry] = false if value.content.is_a?(IO)
            value
          else
            value
          end
        end

        def inspect(depth: 0)
          super()
        end

        # rubocop:enable Lint/UnusedMethodArgument
        class << self
          def type_info(spec)
            case spec
            in Proc
              spec
            in Hash
              type_info(spec.slice(:const, :enum, :union).first&.last)
            in true | false
              -> { XTwitterScraper::Internal::Type::Boolean }
            in XTwitterScraper::Internal::Type::Converter | Class | Symbol
              -> { spec }
            in NilClass | Integer | Float
              -> { spec.class }
            end
          end

          def meta_info(type_info, spec)
            [spec, type_info].grep(Hash).first.to_h.except(:const, :enum, :union, :nil?)
          end

          def new_coerce_state(translate_names: true)
            {
              translate_names: translate_names,
              strictness: true,
              exactness: {yes: 0, no: 0, maybe: 0},
              error: nil,
              branched: 0
            }
          end

          def coerce(target, value, state: XTwitterScraper::Internal::Type::Converter.new_coerce_state)
            # rubocop:disable Metrics/BlockNesting
            exactness = state.fetch(:exactness)

            case target
            in XTwitterScraper::Internal::Type::Converter
              return target.coerce(value, state: state)
            in Class
              if value.is_a?(target)
                exactness[:yes] += 1
                return value
              end

              case target
              in -> { _1 <= NilClass }
                exactness[value.nil? ? :yes : :maybe] += 1
                return nil
              in -> { _1 <= Integer }
                case value
                in Integer
                  exactness[:yes] += 1
                  return value
                else
                  Kernel.then do
                    return Integer(value).tap { exactness[:maybe] += 1 }
                  rescue ArgumentError, TypeError => e
                    state[:error] = e
                  end
                end
              in -> { _1 <= Float }
                if value.is_a?(Numeric)
                  exactness[:yes] += 1
                  return Float(value)
                else
                  Kernel.then do
                    return Float(value).tap { exactness[:maybe] += 1 }
                  rescue ArgumentError, TypeError => e
                    state[:error] = e
                  end
                end
              in -> { _1 <= String }
                case value
                in String | Symbol | Numeric
                  exactness[value.is_a?(Numeric) ? :maybe : :yes] += 1
                  return value.to_s
                in StringIO
                  exactness[:yes] += 1
                  return value.string
                else
                  state[:error] = TypeError.new("#{value.class} can't be coerced into #{String}")
                end
              in -> { _1 <= Date || _1 <= Time }
                Kernel.then do
                  return target.parse(value).tap { exactness[:yes] += 1 }
                rescue ArgumentError, TypeError => e
                  state[:error] = e
                end
              in -> { _1 <= StringIO } if value.is_a?(String)
                exactness[:yes] += 1
                return StringIO.new(value.b)
              else
              end
            in Symbol
              case value
              in Symbol | String
                if value.to_sym == target
                  exactness[:yes] += 1
                  return target
                else
                  exactness[:maybe] += 1
                  return value
                end
              else
                message = "cannot convert non-matching #{value.class} into #{target.inspect}"
                state[:error] = ArgumentError.new(message)
              end
            else
            end

            exactness[:no] += 1
            value
            # rubocop:enable Metrics/BlockNesting
          end

          def dump(target, value, state: {can_retry: true})
            case target
            in XTwitterScraper::Internal::Type::Converter
              target.dump(value, state: state)
            else
              XTwitterScraper::Internal::Type::Unknown.dump(value, state: state)
            end
          end

          def inspect(target, depth:)
            case target
            in XTwitterScraper::Internal::Type::Converter
              target.inspect(depth: depth.succ)
            else
              target.inspect
            end
          end
        end

        define_sorbet_constant!(:Input) do
          T.type_alias { T.any(XTwitterScraper::Internal::Type::Converter, T::Class[T.anything]) }
        end
        define_sorbet_constant!(:CoerceState) do
          T.type_alias do
            {
              translate_names: T::Boolean,
              strictness: T::Boolean,
              exactness: {yes: Integer, no: Integer, maybe: Integer},
              error: T::Class[StandardError],
              branched: Integer
            }
          end
        end
        define_sorbet_constant!(:DumpState) do
          T.type_alias { {can_retry: T::Boolean} }
        end
      end
    end
  end
end
