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

          # @!attribute is_member
          #   Whether the authenticated viewer is a member
          #
          #   @return [Boolean, nil]
          optional :is_member, XTwitterScraper::Internal::Type::Boolean

          # @!attribute is_nsfw
          #   Whether the community is marked sensitive
          #
          #   @return [Boolean, nil]
          optional :is_nsfw, XTwitterScraper::Internal::Type::Boolean

          # @!attribute join_policy
          #   Join policy (open or restricted)
          #
          #   @return [String, nil]
          optional :join_policy, String

          # @!attribute member_count
          #   Total member count
          #
          #   @return [Integer, nil]
          optional :member_count, Integer

          # @!attribute moderator_count
          #   Total moderator count
          #
          #   @return [Integer, nil]
          optional :moderator_count, Integer

          # @!attribute name
          #   Display name of the community
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute primary_topic
          #   Primary topic
          #
          #   @return [XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic, nil]
          optional :primary_topic,
                   -> { XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic }

          # @!attribute role
          #   Authenticated viewer's community role
          #
          #   @return [String, nil]
          optional :role, String

          # @!attribute rules
          #   Community rules
          #
          #   @return [Array<XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule>, nil]
          optional :rules,
                   -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule] }

          # @!method initialize(id:, banner_url: nil, created_at: nil, creator: nil, description: nil, invites_policy: nil, is_member: nil, is_nsfw: nil, join_policy: nil, member_count: nil, moderator_count: nil, name: nil, primary_topic: nil, role: nil, rules: nil)
          #   Community info object
          #
          #   @param id [String] Unique community identifier
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
          #   @param is_member [Boolean] Whether the authenticated viewer is a member
          #
          #   @param is_nsfw [Boolean] Whether the community is marked sensitive
          #
          #   @param join_policy [String] Join policy (open or restricted)
          #
          #   @param member_count [Integer] Total member count
          #
          #   @param moderator_count [Integer] Total moderator count
          #
          #   @param name [String] Display name of the community
          #
          #   @param primary_topic [XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic] Primary topic
          #
          #   @param role [String] Authenticated viewer's community role
          #
          #   @param rules [Array<XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule>] Community rules

          # @see XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community#creator
          class Creator < XTwitterScraper::Internal::Type::BaseModel
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
            #   @return [Boolean]
            required :verified, XTwitterScraper::Internal::Type::Boolean

            # @!attribute name
            #
            #   @return [String, nil]
            optional :name, String

            # @!method initialize(id:, username:, verified:, name: nil)
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
            #   @return [String, nil]
            optional :name, String

            # @!method initialize(id: nil, name: nil)
            #   Primary topic
            #
            #   @param id [String]
            #   @param name [String]
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
        end
      end
    end
  end
end
