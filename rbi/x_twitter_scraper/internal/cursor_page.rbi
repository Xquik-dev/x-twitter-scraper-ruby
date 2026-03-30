# typed: strong

module XTwitterScraper
  module Internal
    class CursorPage
      include XTwitterScraper::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T::Array[T.anything]) }
      attr_accessor :tweets

      sig { returns(T::Array[T.anything]) }
      attr_accessor :users

      sig { returns(String) }
      attr_accessor :next_cursor

      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      # @api private
      sig { returns(String) }
      def inspect
      end
    end
  end
end
