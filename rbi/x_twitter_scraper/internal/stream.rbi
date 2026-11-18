# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Internal
    class Stream
      extend T::Generic
      include Enumerable

      Elem = type_member(:out)

      sig do
        params(
          model: XTwitterScraper::Internal::Type::Converter::Input,
          stream: T::Enumerable[T::Hash[Symbol, T.anything]],
          rest: T.anything
        ).void
      end
      def initialize(model:, stream:, **rest)
      end

      sig do
        override
          .params(blk: T.proc.params(arg0: Elem).returns(BasicObject))
          .returns(T.self_type)
      end
      def each(&blk)
      end

      sig { void }
      def close
      end
    end
  end
end
