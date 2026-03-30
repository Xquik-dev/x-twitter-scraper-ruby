# typed: strong

module XTwitterScraper
  module Internal
    class CursorPageLegacy
      include XTwitterScraper::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :items

      sig { returns(String) }
      attr_accessor :next_cursor

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      # @api private
      sig { returns(String) }
      def inspect
      end
    end
  end
end
