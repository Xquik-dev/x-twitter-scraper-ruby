# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Internal
    module Type
      class Unknown
        extend XTwitterScraper::Internal::Type::Converter
        extend XTwitterScraper::Internal::Util::SorbetRuntimeSupport

        abstract!

        sig { params(other: T.anything).returns(T::Boolean) }
        def self.===(other)
        end

        sig { params(other: T.anything).returns(T::Boolean) }
        def self.==(other)
        end

        class << self
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
        end
      end
    end
  end
end
