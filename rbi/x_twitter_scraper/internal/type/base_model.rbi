# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Internal
    module Type
      class BaseModel
        extend XTwitterScraper::Internal::Type::Converter
        extend XTwitterScraper::Internal::Util::SorbetRuntimeSupport

        abstract!

        KnownField =
          T.type_alias do
            {
              mode: T.nilable(Symbol),
              required: T::Boolean,
              nilable: T::Boolean
            }
          end

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Internal::Type::BaseModel,
              XTwitterScraper::Internal::AnyHash
            )
          end

        class << self
          sig { params(child: XTwitterScraper::Internal::Type::BaseModel).void }
          def inherited(child)
          end

          sig do
            returns(
              T::Hash[
                Symbol,
                T.all(
                  XTwitterScraper::Internal::Type::BaseModel::KnownField,
                  {
                    type_fn:
                      T.proc.returns(
                        XTwitterScraper::Internal::Type::Converter::Input
                      )
                  }
                )
              ]
            )
          end
          def known_fields
          end

          sig do
            returns(
              T::Hash[
                Symbol,
                T.all(
                  XTwitterScraper::Internal::Type::BaseModel::KnownField,
                  { type: XTwitterScraper::Internal::Type::Converter::Input }
                )
              ]
            )
          end
          def fields
          end

          sig do
            params(
              name_sym: Symbol,
              required: T::Boolean,
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
                      ),
                    api_name: Symbol,
                    nil?: T::Boolean
                  },
                  T.proc.returns(
                    XTwitterScraper::Internal::Type::Converter::Input
                  ),
                  XTwitterScraper::Internal::Type::Converter::Input
                ),
              spec: XTwitterScraper::Internal::AnyHash
            ).void
          end
          private def add_field(name_sym, required:, type_info:, spec:)
          end

          sig do
            params(
              name_sym: Symbol,
              type_info:
                T.any(
                  XTwitterScraper::Internal::AnyHash,
                  T.proc.returns(
                    XTwitterScraper::Internal::Type::Converter::Input
                  ),
                  XTwitterScraper::Internal::Type::Converter::Input
                ),
              spec: XTwitterScraper::Internal::AnyHash
            ).void
          end
          def required(name_sym, type_info, spec = {})
          end

          sig do
            params(
              name_sym: Symbol,
              type_info:
                T.any(
                  XTwitterScraper::Internal::AnyHash,
                  T.proc.returns(
                    XTwitterScraper::Internal::Type::Converter::Input
                  ),
                  XTwitterScraper::Internal::Type::Converter::Input
                ),
              spec: XTwitterScraper::Internal::AnyHash
            ).void
          end
          def optional(name_sym, type_info, spec = {})
          end

          sig { params(blk: T.proc.void).void }
          private def request_only(&blk)
          end

          sig { params(blk: T.proc.void).void }
          private def response_only(&blk)
          end

          sig { params(other: T.anything).returns(T::Boolean) }
          def ==(other)
          end

          sig { returns(Integer) }
          def hash
          end
        end

        sig { params(other: T.anything).returns(T::Boolean) }
        def ==(other)
        end

        sig { returns(Integer) }
        def hash
        end

        class << self
          sig do
            override
              .params(
                value:
                  T.any(
                    XTwitterScraper::Internal::Type::BaseModel,
                    T::Hash[T.anything, T.anything],
                    T.anything
                  ),
                state: XTwitterScraper::Internal::Type::Converter::CoerceState
              )
              .returns(T.any(T.attached_class, T.anything))
          end
          def coerce(value, state:)
          end

          sig do
            override
              .params(
                value: T.any(T.attached_class, T.anything),
                state: XTwitterScraper::Internal::Type::Converter::DumpState
              )
              .returns(T.any(T::Hash[T.anything, T.anything], T.anything))
          end
          def dump(value, state:)
          end

          sig { returns(T.anything) }
          def to_sorbet_type
          end
        end

        class << self
          sig do
            params(
              model: XTwitterScraper::Internal::Type::BaseModel,
              convert: T::Boolean
            ).returns(XTwitterScraper::Internal::AnyHash)
          end
          def recursively_to_h(model, convert:)
          end
        end

        sig { params(key: Symbol).returns(T.nilable(T.anything)) }
        def [](key)
        end

        sig { overridable.returns(XTwitterScraper::Internal::AnyHash) }
        def to_h
        end

        sig { overridable.returns(XTwitterScraper::Internal::AnyHash) }
        def to_hash
        end

        sig { overridable.returns(XTwitterScraper::Internal::AnyHash) }
        def deep_to_h
        end

        sig do
          params(keys: T.nilable(T::Array[Symbol])).returns(
            XTwitterScraper::Internal::AnyHash
          )
        end
        def deconstruct_keys(keys)
        end

        sig { params(a: T.anything).returns(String) }
        def to_json(*a)
        end

        sig { params(a: T.anything).returns(String) }
        def to_yaml(*a)
        end

        sig do
          params(
            data:
              T.any(
                T::Hash[Symbol, T.anything],
                XTwitterScraper::Internal::Type::BaseModel
              )
          ).returns(T.attached_class)
        end
        def self.new(data = {})
        end

        class << self
          sig { params(depth: Integer).returns(String) }
          def inspect(depth: 0)
          end
        end

        sig { returns(String) }
        def to_s
        end

        sig { returns(String) }
        def inspect
        end
      end
    end
  end
end
