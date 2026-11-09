# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Communities#retrieve_info
      class CommunityRetrieveInfoResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute community
        #   Community info object
        #
        #   @return [XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community]
        required :community, -> { XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community }

        # @!method initialize(community:)
        #   @param community [XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community] Community info object

        # @see XTwitterScraper::Models::X::CommunityRetrieveInfoResponse#community
        class Community < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #   Unique community identifier
          #
          #   @return [String]
          required :id, String

          # @!attribute admin
          #
          #   @return [XTwitterScraper::Models::UserProfile, nil]
          optional :admin, -> { XTwitterScraper::Models::UserProfile }

          # @!attribute banner
          #
          #   @return [XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner, nil]
          optional :banner,
                   -> { XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner }

          # @!attribute banner_url
          #   Community banner image URL
          #
          #   @return [String, nil]
          optional :banner_url, String

          # @!attribute created_at
          #   Community creation timestamp
          #
          #   @return [String, nil]
          optional :created_at, String

          # @!attribute creator
          #
          #   @return [XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Creator, nil]
          optional :creator, -> { XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Creator }

          # @!attribute description
          #   About text for the community
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute invites_policy
          #   Invitation policy
          #
          #   @return [String, nil]
          optional :invites_policy, String

          # @!attribute is_nsfw
          #   Whether the community is marked sensitive
          #
          #   @return [Boolean]
          required :is_nsfw, XTwitterScraper::Internal::Type::Boolean

          # @!attribute join_policy
          #   Join policy (open or restricted)
          #
          #   @return [String, nil]
          optional :join_policy, String

          # @!attribute member_count
          #   Total member count
          #
          #   @return [Integer]
          required :member_count, Integer

          # @!attribute members_facepile
          #   The members X previews beside the member count. A keyword or topic result gives
          #   each member's ID & picture only.
          #
          #   @return [Array<XTwitterScraper::Models::UserProfile, XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::MembersFacepile::CommunityMemberPreview>, nil]
          optional :members_facepile,
                   -> { XTwitterScraper::Internal::Type::ArrayOf[union: XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::MembersFacepile] },
                   api_name: :membersFacepile

          # @!attribute moderator_count
          #   Total moderator count
          #
          #   @return [Integer, nil]
          optional :moderator_count, Integer

          # @!attribute name
          #   Display name of the community
          #
          #   @return [String]
          required :name, String

          # @!attribute primary_topic
          #   Primary topic
          #
          #   @return [XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic, nil]
          optional :primary_topic,
                   -> { XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic }

          # @!attribute question
          #   What the community asks a user who joins
          #
          #   @return [String, nil]
          optional :question, String

          # @!attribute rules
          #   Community rules
          #
          #   @return [Array<XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule>, nil]
          optional :rules,
                   -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule] }

          # @!attribute search_tags
          #   Tags X finds the community by
          #
          #   @return [Array<String>, nil]
          optional :search_tags, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :searchTags

          # @!method initialize(id:, is_nsfw:, member_count:, name:, admin: nil, banner: nil, banner_url: nil, created_at: nil, creator: nil, description: nil, invites_policy: nil, join_policy: nil, members_facepile: nil, moderator_count: nil, primary_topic: nil, question: nil, rules: nil, search_tags: nil)
          #   Community info object
          #
          #   @param id [String] Unique community identifier
          #
          #   @param is_nsfw [Boolean] Whether the community is marked sensitive
          #
          #   @param member_count [Integer] Total member count
          #
          #   @param name [String] Display name of the community
          #
          #   @param admin [XTwitterScraper::Models::UserProfile]
          #
          #   @param banner [XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner]
          #
          #   @param banner_url [String] Community banner image URL
          #
          #   @param created_at [String] Community creation timestamp
          #
          #   @param creator [XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Creator]
          #
          #   @param description [String] About text for the community
          #
          #   @param invites_policy [String] Invitation policy
          #
          #   @param join_policy [String] Join policy (open or restricted)
          #
          #   @param members_facepile [Array<XTwitterScraper::Models::UserProfile, XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::MembersFacepile::CommunityMemberPreview>] The members X previews beside the member count. A keyword or topic result gives
          #
          #   @param moderator_count [Integer] Total moderator count
          #
          #   @param primary_topic [XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic] Primary topic
          #
          #   @param question [String] What the community asks a user who joins
          #
          #   @param rules [Array<XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule>] Community rules
          #
          #   @param search_tags [Array<String>] Tags X finds the community by

          # @see XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community#creator
          class Creator < XTwitterScraper::Models::UserProfile
            # @!attribute id
            #
            #   @return [String]
            required :id, String

            # @!attribute username
            #
            #   @return [String]
            required :username, String

            # @!attribute verified
            #
            #   @return [Boolean, nil]
            optional :verified, XTwitterScraper::Internal::Type::Boolean

            # @!attribute name
            #
            #   @return [String, nil]
            optional :name, String

            # @!method initialize(id:, username:, verified: nil, name: nil)
            #   @param id [String]
            #   @param username [String]
            #   @param verified [Boolean]
            #   @param name [String]
          end

          # @see XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community#primary_topic
          class PrimaryTopic < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String, nil]
            optional :id, String

            # @!attribute name
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:, id: nil)
            #   Primary topic
            #
            #   @param name [String]
            #   @param id [String]
          end

          class Rule < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String, nil]
            optional :id, String

            # @!attribute description
            #
            #   @return [String, nil]
            optional :description, String

            # @!attribute name
            #
            #   @return [String, nil]
            optional :name, String

            # @!method initialize(id: nil, description: nil, name: nil)
            #   @param id [String]
            #   @param description [String]
            #   @param name [String]
          end

          # @see XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community#banner
          class Banner < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute url
            #   Banner image URL at its original size
            #
            #   @return [String]
            required :url, String

            # @!attribute width
            #   Banner width in pixels
            #
            #   @return [Integer, nil]
            optional :width, Integer

            # @!attribute height
            #   Banner height in pixels
            #
            #   @return [Integer, nil]
            optional :height, Integer

            # @!attribute colors
            #   Main colors of the banner, largest share first
            #
            #   @return [Array<XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Color>, nil]
            optional :colors,
                     -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Color] }

            # @!attribute focus
            #   Area X keeps in view when it crops the banner, in pixels from the top left
            #
            #   @return [XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Focus, nil]
            optional :focus,
                     -> { XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Focus }

            # @!method initialize(url:, width: nil, height: nil, colors: nil, focus: nil)
            #   The banner X shows for a community, with its size & colors.
            #
            #   @param url [String] Banner image URL at its original size
            #
            #   @param width [Integer] Banner width in pixels
            #
            #   @param height [Integer] Banner height in pixels
            #
            #   @param colors [Array<XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Color>] Main colors of the banner, largest share first
            #
            #   @param focus [XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner::Focus] Area X keeps in view when it crops the banner, in pixels from the top left

            # @see XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner#colors
            class Color < XTwitterScraper::Internal::Type::BaseModel
              # @!attribute percentage
              #   Share of the banner in this color
              #
              #   @return [Float]
              required :percentage, Float

              # @!attribute red
              #   Red value of the color
              #
              #   @return [Integer]
              required :red, Integer

              # @!attribute green
              #   Green value of the color
              #
              #   @return [Integer]
              required :green, Integer

              # @!attribute blue
              #   Blue value of the color
              #
              #   @return [Integer]
              required :blue, Integer

              # @!method initialize(percentage:, red:, green:, blue:)
              #   @param percentage [Float] Share of the banner in this color
              #
              #   @param red [Integer] Red value of the color
              #
              #   @param green [Integer] Green value of the color
              #
              #   @param blue [Integer] Blue value of the color
            end

            # @see XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Banner#focus
            class Focus < XTwitterScraper::Internal::Type::BaseModel
              # @!attribute left
              #   Distance from the left edge
              #
              #   @return [Integer, nil]
              optional :left, Integer

              # @!attribute top
              #   Distance from the top edge
              #
              #   @return [Integer, nil]
              optional :top, Integer

              # @!attribute width
              #   Width of the area
              #
              #   @return [Integer, nil]
              optional :width, Integer

              # @!attribute height
              #   Height of the area
              #
              #   @return [Integer, nil]
              optional :height, Integer

              # @!method initialize(left: nil, top: nil, width: nil, height: nil)
              #   Area X keeps in view when it crops the banner, in pixels from the top left
              #
              #   @param left [Integer] Distance from the left edge
              #
              #   @param top [Integer] Distance from the top edge
              #
              #   @param width [Integer] Width of the area
              #
              #   @param height [Integer] Height of the area
            end
          end

          module MembersFacepile
            extend XTwitterScraper::Internal::Type::Union

            variant -> { XTwitterScraper::Models::UserProfile }

            variant -> { XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::MembersFacepile::CommunityMemberPreview }

            # @see XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::MembersFacepile
            class CommunityMemberPreview < XTwitterScraper::Internal::Type::BaseModel
              # @!attribute id
              #   Numeric X user ID of the member
              #
              #   @return [String]
              required :id, String

              # @!attribute profile_picture
              #   Profile picture URL of the member
              #
              #   @return [String, nil]
              optional :profile_picture, String, api_name: :profilePicture

              # @!attribute profile_picture_original
              #   The member's profile picture at full size
              #
              #   @return [String, nil]
              optional :profile_picture_original, String, api_name: :profilePictureOriginal

              # @!method initialize(id:, profile_picture: nil, profile_picture_original: nil)
              #   A member X previews by ID & profile picture only.
              #
              #   @param id [String] Numeric X user ID of the member
              #
              #   @param profile_picture [String] Profile picture URL of the member
              #
              #   @param profile_picture_original [String] The member's profile picture at full size
            end

            # @!method self.variants
            #   @return [Array(XTwitterScraper::Models::UserProfile, XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::MembersFacepile::CommunityMemberPreview)]
          end
        end
      end
    end
  end
end
