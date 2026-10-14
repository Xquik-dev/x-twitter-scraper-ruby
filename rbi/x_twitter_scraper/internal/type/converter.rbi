# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Internal
    module Type
      module Converter
        extend XTwitterScraper::Internal::Util::SorbetRuntimeSupport

        Input =
          T.type_alias do
            T.any(
              XTwitterScraper::Internal::Type::Converter,
              T::Class[T.anything]
            )
          end

        CoerceState =
          T.type_alias do
            {
              translate_names: T::Boolean,
              strictness: T::Boolean,
              exactness: {
                yes: Integer,
                no: Integer,
                maybe: Integer
              },
              error: T::Class[StandardError],
              branched: Integer
            }
          end

        DumpState = T.type_alias { { can_retry: T::Boolean } }

        sig do
          overridable
            .params(
              value: T.anything,
              state: XTwitterScraper::Internal::Type::Converter::CoerceState
            )
            .returns(T.anything)
        end
        def coerce(value, state:)
        end

        sig do
          overridable
            .params(
              value: T.anything,
              state: XTwitterScraper::Internal::Type::Converter::DumpState
            )
            .returns(T.anything)
        end
        def dump(value, state:)
        end

        sig { params(depth: Integer).returns(String) }
        def inspect(depth: 0)
        end

        class << self
          sig do
            params(
              spec:
                T.any(
                  {
                    const:
                      T.nilable(
                        T.any(NilClass, T::Boolean, Integer, Float, Symbol)
                      ),
                    enum:
                      T.nilable(
                        T.proc.returns(
                          XTwitterScraper::Internal::Type::Converter::Input
                        )
                      ),
                    union:
                      T.nilable(
                        T.proc.returns(
                          XTwitterScraper::Internal::Type::Converter::Input
                        )
                      )
                  },
                  T.proc.returns(
                    XTwitterScraper::Internal::Type::Converter::Input
                  ),
                  XTwitterScraper::Internal::Type::Converter::Input
                )
            ).returns(T.proc.returns(T.anything))
          end
          def self.type_info(spec)
          end

          sig do
            params(
              type_info:
                T.any(
                  {
                    const:
                      T.nilable(
                        T.any(NilClass, T::Boolean, Integer, Float, Symbol)
                      ),
                    enum:
                      T.nilable(
                        T.proc.returns(
                          XTwitterScraper::Internal::Type::Converter::Input
                        )
                      ),
                    union:
                      T.nilable(
                        T.proc.returns(
                          XTwitterScraper::Internal::Type::Converter::Input
                        )
                      )
                  },
                  T.proc.returns(
                    XTwitterScraper::Internal::Type::Converter::Input
                  ),
                  XTwitterScraper::Internal::Type::Converter::Input
                ),
              spec:
                T.any(
                  {
                    const:
                      T.nilable(
                        T.any(NilClass, T::Boolean, Integer, Float, Symbol)
                      ),
                    enum:
                      T.nilable(
                        T.proc.returns(
                          XTwitterScraper::Internal::Type::Converter::Input
                        )
                      ),
                    union:
                      T.nilable(
                        T.proc.returns(
                          XTwitterScraper::Internal::Type::Converter::Input
                        )
                      )
                  },
                  T.proc.returns(
                    XTwitterScraper::Internal::Type::Converter::Input
                  ),
                  XTwitterScraper::Internal::Type::Converter::Input
                )
            ).returns(XTwitterScraper::Internal::AnyHash)
          end
          def self.meta_info(type_info, spec)
          end

          sig do
            params(translate_names: T::Boolean).returns(
              XTwitterScraper::Internal::Type::Converter::CoerceState
            )
          end
          def self.new_coerce_state(translate_names: true)
          end

          sig do
            params(
              target: XTwitterScraper::Internal::Type::Converter::Input,
              value: T.anything,
              state: XTwitterScraper::Internal::Type::Converter::CoerceState
            ).returns(T.anything)
          end
          def self.coerce(
            target,
            value,
            state: XTwitterScraper::Internal::Type::Converter.new_coerce_state
          )
          end

          sig do
            params(
              target: XTwitterScraper::Internal::Type::Converter::Input,
              value: T.anything,
              state: XTwitterScraper::Internal::Type::Converter::DumpState
            ).returns(T.anything)
          end
          def self.dump(target, value, state: { can_retry: true })
          end

          sig { params(target: T.anything, depth: Integer).returns(String) }
          def self.inspect(target, depth:)
          end
        end
      end
    end
  end
end
