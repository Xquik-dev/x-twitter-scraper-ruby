# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class BookmarkRetrieveFoldersResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder
            ]
          )
        end
        attr_accessor :folders

        # Always false for the current bookmark folder route
        sig { returns(T::Boolean) }
        attr_accessor :has_next_page

        # Always empty for the current bookmark folder route
        sig { returns(String) }
        attr_accessor :next_cursor

        sig do
          params(
            folders:
              T::Array[
                XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::OrHash
              ],
            has_next_page: T::Boolean,
            next_cursor: String
          ).returns(T.attached_class)
        end
        def self.new(
          folders:,
          # Always false for the current bookmark folder route
          has_next_page:,
          # Always empty for the current bookmark folder route
          next_cursor:
        )
        end

        sig do
          override.returns(
            {
              folders:
                T::Array[
                  XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder
                ],
              has_next_page: T::Boolean,
              next_cursor: String
            }
          )
        end
        def to_hash
        end

        class Folder < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :name

          # Public folder cover image metadata.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media
              )
            )
          end
          attr_reader :media

          sig do
            params(
              media:
                XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::OrHash
            ).void
          end
          attr_writer :media

          sig do
            params(
              id: String,
              name: String,
              media:
                XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            name:,
            # Public folder cover image metadata.
            media: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                name: String,
                media:
                  XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media
              }
            )
          end
          def to_hash
          end

          class Media < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # Media object ID.
            sig { returns(T.nilable(String)) }
            attr_reader :id

            sig { params(id: String).void }
            attr_writer :id

            # Media ID.
            sig { returns(T.nilable(String)) }
            attr_reader :media_id

            sig { params(media_id: String).void }
            attr_writer :media_id

            # Stable media key.
            sig { returns(T.nilable(String)) }
            attr_reader :media_key

            sig { params(media_key: String).void }
            attr_writer :media_key

            # Original image height.
            sig { returns(T.nilable(Integer)) }
            attr_reader :original_image_height

            sig { params(original_image_height: Integer).void }
            attr_writer :original_image_height

            # Original image URL.
            sig { returns(T.nilable(String)) }
            attr_reader :original_image_url

            sig { params(original_image_url: String).void }
            attr_writer :original_image_url

            # Original image width.
            sig { returns(T.nilable(Integer)) }
            attr_reader :original_image_width

            sig { params(original_image_width: Integer).void }
            attr_writer :original_image_width

            # Dominant image colors and their proportions.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette
                  ]
                )
              )
            end
            attr_reader :palette

            sig do
              params(
                palette:
                  T::Array[
                    XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette::OrHash
                  ]
              ).void
            end
            attr_writer :palette

            # Media object type.
            sig { returns(T.nilable(String)) }
            attr_reader :type

            sig { params(type: String).void }
            attr_writer :type

            # Public folder cover image metadata.
            sig do
              params(
                id: String,
                media_id: String,
                media_key: String,
                original_image_height: Integer,
                original_image_url: String,
                original_image_width: Integer,
                palette:
                  T::Array[
                    XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette::OrHash
                  ],
                type: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Media object ID.
              id: nil,
              # Media ID.
              media_id: nil,
              # Stable media key.
              media_key: nil,
              # Original image height.
              original_image_height: nil,
              # Original image URL.
              original_image_url: nil,
              # Original image width.
              original_image_width: nil,
              # Dominant image colors and their proportions.
              palette: nil,
              # Media object type.
              type: nil
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  media_id: String,
                  media_key: String,
                  original_image_height: Integer,
                  original_image_url: String,
                  original_image_width: Integer,
                  palette:
                    T::Array[
                      XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette
                    ],
                  type: String
                }
              )
            end
            def to_hash
            end

            class Palette < XTwitterScraper::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette,
                    XTwitterScraper::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(Float)) }
              attr_reader :percentage

              sig { params(percentage: Float).void }
              attr_writer :percentage

              sig do
                returns(
                  T.nilable(
                    XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette::Rgb
                  )
                )
              end
              attr_reader :rgb

              sig do
                params(
                  rgb:
                    XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette::Rgb::OrHash
                ).void
              end
              attr_writer :rgb

              sig do
                params(
                  percentage: Float,
                  rgb:
                    XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette::Rgb::OrHash
                ).returns(T.attached_class)
              end
              def self.new(percentage: nil, rgb: nil)
              end

              sig do
                override.returns(
                  {
                    percentage: Float,
                    rgb:
                      XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette::Rgb
                  }
                )
              end
              def to_hash
              end

              class Rgb < XTwitterScraper::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::Media::Palette::Rgb,
                      XTwitterScraper::Internal::AnyHash
                    )
                  end

                sig { returns(T.nilable(Float)) }
                attr_reader :blue

                sig { params(blue: Float).void }
                attr_writer :blue

                sig { returns(T.nilable(Float)) }
                attr_reader :green

                sig { params(green: Float).void }
                attr_writer :green

                sig { returns(T.nilable(Float)) }
                attr_reader :red

                sig { params(red: Float).void }
                attr_writer :red

                sig do
                  params(blue: Float, green: Float, red: Float).returns(
                    T.attached_class
                  )
                end
                def self.new(blue: nil, green: nil, red: nil)
                end

                sig do
                  override.returns({ blue: Float, green: Float, red: Float })
                end
                def to_hash
                end
              end
            end
          end
        end
      end
    end
  end
end
