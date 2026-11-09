# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

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

          # @!attribute media
          #   Public folder cover image metadata.
          #
          #   @return [XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media, nil]
          optional :media, -> { XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media }

          # @!method initialize(id:, name:, media: nil)
          #   @param id [String]
          #   @param name [String]
          #   @param media [XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media] Public folder cover image metadata.

          # @see XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder#media
          class Media < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute id
            #   Media object ID.
            #
            #   @return [String, nil]
            optional :id, String

            # @!attribute media_id
            #   Media ID.
            #
            #   @return [String, nil]
            optional :media_id, String, api_name: :mediaId

            # @!attribute media_key
            #   Stable media key.
            #
            #   @return [String, nil]
            optional :media_key, String, api_name: :mediaKey

            # @!attribute original_image_height
            #   Original image height.
            #
            #   @return [Integer, nil]
            optional :original_image_height, Integer, api_name: :originalImageHeight

            # @!attribute original_image_url
            #   Original image URL.
            #
            #   @return [String, nil]
            optional :original_image_url, String, api_name: :originalImageUrl

            # @!attribute original_image_width
            #   Original image width.
            #
            #   @return [Integer, nil]
            optional :original_image_width, Integer, api_name: :originalImageWidth

            # @!attribute palette
            #   Dominant image colors and their proportions.
            #
            #   @return [Array<XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette>, nil]
            optional :palette,
                     -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette] }

            # @!attribute type
            #   Media object type.
            #
            #   @return [String, nil]
            optional :type, String

            # @!method initialize(id: nil, media_id: nil, media_key: nil, original_image_height: nil, original_image_url: nil, original_image_width: nil, palette: nil, type: nil)
            #   Public folder cover image metadata.
            #
            #   @param id [String] Media object ID.
            #
            #   @param media_id [String] Media ID.
            #
            #   @param media_key [String] Stable media key.
            #
            #   @param original_image_height [Integer] Original image height.
            #
            #   @param original_image_url [String] Original image URL.
            #
            #   @param original_image_width [Integer] Original image width.
            #
            #   @param palette [Array<XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette>] Dominant image colors and their proportions.
            #
            #   @param type [String] Media object type.

            # @see XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media#palette
            class Palette < XTwitterScraper::Internal::Type::BaseModel
              # @!attribute percentage
              #
              #   @return [Float, nil]
              optional :percentage, Float

              # @!attribute rgb
              #
              #   @return [XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette::Rgb, nil]
              optional :rgb,
                       -> { XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette::Rgb }

              # @!method initialize(percentage: nil, rgb: nil)
              #   @param percentage [Float]
              #   @param rgb [XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette::Rgb]

              # @see XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette#rgb
              class Rgb < XTwitterScraper::Internal::Type::BaseModel
                # @!attribute blue
                #
                #   @return [Float, nil]
                optional :blue, Float

                # @!attribute green
                #
                #   @return [Float, nil]
                optional :green, Float

                # @!attribute red
                #
                #   @return [Float, nil]
                optional :red, Float

                # @!method initialize(blue: nil, green: nil, red: nil)
                #   @param blue [Float]
                #   @param green [Float]
                #   @param red [Float]
              end
            end
          end
        end
      end
    end
  end
end
