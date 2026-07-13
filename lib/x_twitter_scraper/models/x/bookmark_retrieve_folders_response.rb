# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Bookmarks#retrieve_folders
      class BookmarkRetrieveFoldersResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute folders
        #
        #   @return [Array<XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder>]
        required :folders,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder] }

        # @!attribute has_next_page
        #   Always false for the current bookmark folder route
        #
        #   @return [Boolean]
        required :has_next_page, XTwitterScraper::Internal::Type::Boolean

        # @!attribute next_cursor
        #   Always empty for the current bookmark folder route
        #
        #   @return [String]
        required :next_cursor, String

        # @!method initialize(folders:, has_next_page:, next_cursor:)
        #   @param folders [Array<XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder>]
        #
        #   @param has_next_page [Boolean] Always false for the current bookmark folder route
        #
        #   @param next_cursor [String] Always empty for the current bookmark folder route

        class Folder < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!method initialize(id:, name:)
          #   @param id [String]
          #   @param name [String]
        end
      end
    end
  end
end
