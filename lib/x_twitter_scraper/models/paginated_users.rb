# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PaginatedUsers < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute has_next_page
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #
      #   @return [String]
      required :next_cursor, String

      # @!attribute users
      #
      #   @return [Array<Object>]
      required :users, XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Internal::Type::Unknown]

      # @!method initialize(has_next_page:, next_cursor:, users:)
      #   @param has_next_page [Boolean]
      #   @param next_cursor [String]
      #   @param users [Array<Object>]
    end
  end
end
