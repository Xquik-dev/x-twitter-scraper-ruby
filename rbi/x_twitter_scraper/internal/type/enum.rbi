# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Internal
    module Type
      module Enum
        include XTwitterScraper::Internal::Type::Converter
        include XTwitterScraper::Internal::Util::SorbetRuntimeSupport

        sig do
          overridable.returns(
            T::Array[T.any(NilClass, T::Boolean, Integer, Float, Symbol)]
          )
        end
        def values
        end

        sig { params(other: T.anything).returns(T::Boolean) }
        def ===(other)
        end

        sig { params(other: T.anything).returns(T::Boolean) }
        def ==(other)
        end

        sig { returns(Integer) }
        def hash
        end

        sig do
          override
            .params(
              value: T.any(String, Symbol, T.anything),
              state: XTwitterScraper::Internal::Type::Converter::CoerceState
            )
            .returns(T.any(Symbol, T.anything))
        end
        def coerce(value, state:)
        end

        sig do
          override
            .params(
              value: T.any(Symbol, T.anything),
              state: XTwitterScraper::Internal::Type::Converter::DumpState
            )
            .returns(T.any(Symbol, T.anything))
        end
        def dump(value, state:)
        end

        sig { returns(T.anything) }
        def to_sorbet_type
        end

        sig { params(depth: Integer).returns(String) }
        def inspect(depth: 0)
        end
      end
    end
  end
end
