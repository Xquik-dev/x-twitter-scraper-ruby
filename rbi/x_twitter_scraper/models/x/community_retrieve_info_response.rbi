# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class CommunityRetrieveInfoResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::CommunityRetrieveInfoResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Community info object
        sig do
          returns(
            XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community
          )
        end
        attr_reader :community

        sig do
          params(
            community:
              XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::OrHash
          ).void
        end
        attr_writer :community

        sig do
          params(
            community:
              XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Community info object
          community:
        )
        end

        sig do
          override.returns(
            {
              community:
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community
            }
          )
        end
        def to_hash
        end

        class Community < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Unique community identifier
          sig { returns(String) }
          attr_accessor :id

          sig { returns(T.nilable(XTwitterScraper::Models::UserProfile)) }
          attr_reader :admin

          sig do
            params(admin: XTwitterScraper::Models::UserProfile::OrHash).void
          end
          attr_writer :admin

          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner
              )
            )
          end
          attr_reader :banner

          sig do
            params(
              banner:
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::OrHash
            ).void
          end
          attr_writer :banner

          # Community banner image URL
          sig { returns(T.nilable(String)) }
          attr_reader :banner_url

          sig { params(banner_url: String).void }
          attr_writer :banner_url

          # Community creation timestamp
          sig { returns(T.nilable(String)) }
          attr_reader :created_at

          sig { params(created_at: String).void }
          attr_writer :created_at

          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Creator
              )
            )
          end
          attr_reader :creator

          sig do
            params(
              creator:
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Creator::OrHash
            ).void
          end
          attr_writer :creator

          # About text for the community
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          # Invitation policy
          sig { returns(T.nilable(String)) }
          attr_reader :invites_policy

          sig { params(invites_policy: String).void }
          attr_writer :invites_policy

          # Whether the community is marked sensitive
          sig { returns(T::Boolean) }
          attr_accessor :is_nsfw

          # Join policy (open or restricted)
          sig { returns(T.nilable(String)) }
          attr_reader :join_policy

          sig { params(join_policy: String).void }
          attr_writer :join_policy

          # Total member count
          sig { returns(Integer) }
          attr_accessor :member_count

          # The members X previews beside the member count. A keyword or topic result gives
          # each member's ID & picture only.
          sig do
            returns(
              T.nilable(
                T::Array[
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::MembersFacepile::Variants
                ]
              )
            )
          end
          attr_reader :members_facepile

          sig do
            params(
              members_facepile:
                T::Array[
                  T.any(
                    XTwitterScraper::Models::UserProfile::OrHash,
                    XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::MembersFacepile::CommunityMemberPreview::OrHash
                  )
                ]
            ).void
          end
          attr_writer :members_facepile

          # Total moderator count
          sig { returns(T.nilable(Integer)) }
          attr_reader :moderator_count

          sig { params(moderator_count: Integer).void }
          attr_writer :moderator_count

          # Display name of the community
          sig { returns(String) }
          attr_accessor :name

          # Primary topic
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic
              )
            )
          end
          attr_reader :primary_topic

          sig do
            params(
              primary_topic:
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic::OrHash
            ).void
          end
          attr_writer :primary_topic

          # What the community asks a user who joins
          sig { returns(T.nilable(String)) }
          attr_reader :question

          sig { params(question: String).void }
          attr_writer :question

          # Community rules
          sig do
            returns(
              T.nilable(
                T::Array[
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule
                ]
              )
            )
          end
          attr_reader :rules

          sig do
            params(
              rules:
                T::Array[
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule::OrHash
                ]
            ).void
          end
          attr_writer :rules

          # Tags X finds the community by
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :search_tags

          sig { params(search_tags: T::Array[String]).void }
          attr_writer :search_tags

          # Community info object
          sig do
            params(
              id: String,
              admin: XTwitterScraper::Models::UserProfile::OrHash,
              banner:
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::OrHash,
              banner_url: String,
              created_at: String,
              creator:
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Creator::OrHash,
              description: String,
              invites_policy: String,
              is_nsfw: T::Boolean,
              join_policy: String,
              member_count: Integer,
              members_facepile:
                T::Array[
                  T.any(
                    XTwitterScraper::Models::UserProfile::OrHash,
                    XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::MembersFacepile::CommunityMemberPreview::OrHash
                  )
                ],
              moderator_count: Integer,
              name: String,
              primary_topic:
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic::OrHash,
              question: String,
              rules:
                T::Array[
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule::OrHash
                ],
              search_tags: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique community identifier
            id:,
            admin: nil,
            banner: nil,
            # Community banner image URL
            banner_url: nil,
            # Community creation timestamp
            created_at: nil,
            creator: nil,
            # About text for the community
            description: nil,
            # Invitation policy
            invites_policy: nil,
            # Whether the community is marked sensitive
            is_nsfw:,
            # Join policy (open or restricted)
            join_policy: nil,
            # Total member count
            member_count:,
            # The members X previews beside the member count. A keyword or topic result gives
            # each member's ID & picture only.
            members_facepile: nil,
            # Total moderator count
            moderator_count: nil,
            # Display name of the community
            name:,
            # Primary topic
            primary_topic: nil,
            # What the community asks a user who joins
            question: nil,
            # Community rules
            rules: nil,
            # Tags X finds the community by
            search_tags: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                admin: XTwitterScraper::Models::UserProfile,
                banner:
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner,
                banner_url: String,
                created_at: String,
                creator:
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Creator,
                description: String,
                invites_policy: String,
                is_nsfw: T::Boolean,
                join_policy: String,
                member_count: Integer,
                members_facepile:
                  T::Array[
                    XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::MembersFacepile::Variants
                  ],
                moderator_count: Integer,
                name: String,
                primary_topic:
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic,
                question: String,
                rules:
                  T::Array[
                    XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule
                  ],
                search_tags: T::Array[String]
              }
            )
          end
          def to_hash
          end

          class Creator < XTwitterScraper::Models::UserProfile
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Creator,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :id

            sig { returns(String) }
            attr_accessor :username

            sig { returns(T::Boolean) }
            attr_accessor :verified

            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            sig do
              params(
                id: String,
                username: String,
                verified: T::Boolean,
                name: String
              ).returns(T.attached_class)
            end
            def self.new(id:, username:, verified:, name: nil)
            end

            sig do
              override.returns(
                {
                  id: String,
                  username: String,
                  verified: T::Boolean,
                  name: String
                }
              )
            end
            def to_hash
            end
          end

          class PrimaryTopic < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :id

            sig { params(id: String).void }
            attr_writer :id

            sig { returns(String) }
            attr_accessor :name

            # Primary topic
            sig { params(id: String, name: String).returns(T.attached_class) }
            def self.new(id: nil, name:)
            end

            sig { override.returns({ id: String, name: String }) }
            def to_hash
            end
          end

          class Rule < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :id

            sig { params(id: String).void }
            attr_writer :id

            sig { returns(T.nilable(String)) }
            attr_reader :description

            sig { params(description: String).void }
            attr_writer :description

            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            sig do
              params(id: String, description: String, name: String).returns(
                T.attached_class
              )
            end
            def self.new(id: nil, description: nil, name: nil)
            end

            sig do
              override.returns(
                { id: String, description: String, name: String }
              )
            end
            def to_hash
            end
          end

          class Banner < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # Banner image URL at its original size
            sig { returns(String) }
            attr_accessor :url

            # Banner width in pixels
            sig { returns(T.nilable(Integer)) }
            attr_reader :width

            sig { params(width: Integer).void }
            attr_writer :width

            # Banner height in pixels
            sig { returns(T.nilable(Integer)) }
            attr_reader :height

            sig { params(height: Integer).void }
            attr_writer :height

            # Main colors of the banner, largest share first
            sig do
              returns(
                T.nilable(
                  T::Array[
                    XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Color
                  ]
                )
              )
            end
            attr_reader :colors

            sig do
              params(
                colors:
                  T::Array[
                    XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Color::OrHash
                  ]
              ).void
            end
            attr_writer :colors

            # Area X keeps in view when it crops the banner, in pixels from the top left
            sig do
              returns(
                T.nilable(
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Focus
                )
              )
            end
            attr_reader :focus

            sig do
              params(
                focus:
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Focus::OrHash
              ).void
            end
            attr_writer :focus

            # The banner X shows for a community, with its size & colors.
            sig do
              params(
                url: String,
                width: Integer,
                height: Integer,
                colors:
                  T::Array[
                    XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Color::OrHash
                  ],
                focus:
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Focus::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Banner image URL at its original size
              url:,
              # Banner width in pixels
              width: nil,
              # Banner height in pixels
              height: nil,
              # Main colors of the banner, largest share first
              colors: nil,
              # Area X keeps in view when it crops the banner, in pixels from the top left
              focus: nil
            )
            end

            sig do
              override.returns(
                {
                  url: String,
                  width: Integer,
                  height: Integer,
                  colors:
                    T::Array[
                      XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Color
                    ],
                  focus:
                    XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Focus
                }
              )
            end
            def to_hash
            end

            class Color < XTwitterScraper::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Color,
                    XTwitterScraper::Internal::AnyHash
                  )
                end

              # Share of the banner in this color
              sig { returns(Float) }
              attr_accessor :percentage

              # Red value of the color
              sig { returns(Integer) }
              attr_accessor :red

              # Green value of the color
              sig { returns(Integer) }
              attr_accessor :green

              # Blue value of the color
              sig { returns(Integer) }
              attr_accessor :blue

              sig do
                params(
                  percentage: Float,
                  red: Integer,
                  green: Integer,
                  blue: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                # Share of the banner in this color
                percentage:,
                # Red value of the color
                red:,
                # Green value of the color
                green:,
                # Blue value of the color
                blue:
              )
              end

              sig do
                override.returns(
                  {
                    percentage: Float,
                    red: Integer,
                    green: Integer,
                    blue: Integer
                  }
                )
              end
              def to_hash
              end
            end

            class Focus < XTwitterScraper::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Focus,
                    XTwitterScraper::Internal::AnyHash
                  )
                end

              # Distance from the left edge
              sig { returns(T.nilable(Integer)) }
              attr_reader :left

              sig { params(left: Integer).void }
              attr_writer :left

              # Distance from the top edge
              sig { returns(T.nilable(Integer)) }
              attr_reader :top

              sig { params(top: Integer).void }
              attr_writer :top

              # Width of the area
              sig { returns(T.nilable(Integer)) }
              attr_reader :width

              sig { params(width: Integer).void }
              attr_writer :width

              # Height of the area
              sig { returns(T.nilable(Integer)) }
              attr_reader :height

              sig { params(height: Integer).void }
              attr_writer :height

              # Area X keeps in view when it crops the banner, in pixels from the top left
              sig do
                params(
                  left: Integer,
                  top: Integer,
                  width: Integer,
                  height: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                # Distance from the left edge
                left: nil,
                # Distance from the top edge
                top: nil,
                # Width of the area
                width: nil,
                # Height of the area
                height: nil
              )
              end

              sig do
                override.returns(
                  {
                    left: Integer,
                    top: Integer,
                    width: Integer,
                    height: Integer
                  }
                )
              end
              def to_hash
              end
            end
          end

          module MembersFacepile
            extend XTwitterScraper::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::UserProfile,
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::MembersFacepile::CommunityMemberPreview
                )
              end

            class CommunityMemberPreview < XTwitterScraper::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::MembersFacepile::CommunityMemberPreview,
                    XTwitterScraper::Internal::AnyHash
                  )
                end

              # Numeric X user ID of the member
              sig { returns(String) }
              attr_accessor :id

              # Profile picture URL of the member
              sig { returns(T.nilable(String)) }
              attr_reader :profile_picture

              sig { params(profile_picture: String).void }
              attr_writer :profile_picture

              # The member's profile picture at full size
              sig { returns(T.nilable(String)) }
              attr_reader :profile_picture_original

              sig { params(profile_picture_original: String).void }
              attr_writer :profile_picture_original

              # A member X previews by ID & profile picture only.
              sig do
                params(
                  id: String,
                  profile_picture: String,
                  profile_picture_original: String
                ).returns(T.attached_class)
              end
              def self.new(
                # Numeric X user ID of the member
                id:,
                # Profile picture URL of the member
                profile_picture: nil,
                # The member's profile picture at full size
                profile_picture_original: nil
              )
              end

              sig do
                override.returns(
                  {
                    id: String,
                    profile_picture: String,
                    profile_picture_original: String
                  }
                )
              end
              def to_hash
              end
            end

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::MembersFacepile::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end
      end
    end
  end
end
