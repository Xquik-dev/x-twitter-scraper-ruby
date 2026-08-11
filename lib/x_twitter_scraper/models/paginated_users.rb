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
      #   @return [Array<XTwitterScraper::Models::UserProfile>]
      required :users, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::UserProfile] }

      # @!method initialize(has_next_page:, next_cursor:, users:)
      #   Paginated user profiles. No-mode follower, following, and verified follower
      #   requests merge independent views automatically. Response fields, page size,
      #   aliases, filters, and per-returned-profile billing stay unchanged. Existing
      #   unprefixed cursors retain legacy behavior. Follow next_cursor while
      #   has_next_page is true.
      #
      #   @param has_next_page [Boolean]
      #   @param next_cursor [String]
      #   @param users [Array<XTwitterScraper::Models::UserProfile>]
    end
  end
end
