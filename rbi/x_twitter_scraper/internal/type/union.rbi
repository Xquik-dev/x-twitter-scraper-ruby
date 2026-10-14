# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Internal
    module Type
      module Union
        include XTwitterScraper::Internal::Type::Converter
        include XTwitterScraper::Internal::Util::SorbetRuntimeSupport

        sig do
          returns(
            T::Array[
              [
                T.nilable(Symbol),
                T.proc.returns(
                  XTwitterScraper::Internal::Type::Converter::Input
                ),
                XTwitterScraper::Internal::AnyHash
              ]
            ]
          )
        end
        private def known_variants
        end

        sig do
          returns(
            T::Array[
              [
                T.nilable(Symbol),
                T.anything,
                XTwitterScraper::Internal::AnyHash
              ]
            ]
          )
        end
        protected def derefed_variants
        end

        sig { overridable.returns(T::Array[T.anything]) }
        def variants
        end

        sig { params(property: Symbol).void }
        private def discriminator(property)
        end

        sig do
          params(
            key:
              T.any(
                Symbol,
                XTwitterScraper::Internal::AnyHash,
                T.proc.returns(T.anything),
                T.anything
              ),
            spec:
              T.any(
                XTwitterScraper::Internal::AnyHash,
                T.proc.returns(T.anything),
                T.anything
              )
          ).void
        end
        private def variant(key, spec = nil)
        end

        sig { params(value: T.anything).returns(T.nilable(T.anything)) }
        private def resolve_variant(value)
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
              value: T.anything,
              state: XTwitterScraper::Internal::Type::Converter::CoerceState
            )
            .returns(T.anything)
        end
        def coerce(value, state:)
        end

        sig do
          override
            .params(
              value: T.anything,
              state: XTwitterScraper::Internal::Type::Converter::DumpState
            )
            .returns(T.anything)
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
