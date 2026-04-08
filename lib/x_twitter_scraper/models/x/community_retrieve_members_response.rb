# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Communities#retrieve_members
      class CommunityRetrieveMembersResponse < XTwitterScraper::Internal::Type::BaseModel
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
        #   @return [Array<XTwitterScraper::Models::X::CommunityRetrieveMembersResponse::User>]
        required :users,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::CommunityRetrieveMembersResponse::User] }

        # @!method initialize(has_next_page:, next_cursor:, users:)
        #   Paginated list of user profiles with cursor-based navigation.
        #
        #   @param has_next_page [Boolean]
        #   @param next_cursor [String]
        #   @param users [Array<XTwitterScraper::Models::X::CommunityRetrieveMembersResponse::User>]

        class User < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute username
          #
          #   @return [String]
          required :username, String

          # @!attribute created_at
          #
          #   @return [String, nil]
          optional :created_at, String, api_name: :createdAt

          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute followers
          #
          #   @return [Integer, nil]
          optional :followers, Integer

          # @!attribute following
          #
          #   @return [Integer, nil]
          optional :following, Integer

          # @!attribute location
          #
          #   @return [String, nil]
          optional :location, String

          # @!attribute profile_picture
          #
          #   @return [String, nil]
          optional :profile_picture, String, api_name: :profilePicture

          # @!attribute statuses_count
          #
          #   @return [Integer, nil]
          optional :statuses_count, Integer, api_name: :statusesCount

          # @!attribute verified
          #
          #   @return [Boolean, nil]
          optional :verified, XTwitterScraper::Internal::Type::Boolean

          # @!method initialize(id:, name:, username:, created_at: nil, description: nil, followers: nil, following: nil, location: nil, profile_picture: nil, statuses_count: nil, verified: nil)
          #   X user profile with bio, follower counts, and verification status.
          #
          #   @param id [String]
          #   @param name [String]
          #   @param username [String]
          #   @param created_at [String]
          #   @param description [String]
          #   @param followers [Integer]
          #   @param following [Integer]
          #   @param location [String]
          #   @param profile_picture [String]
          #   @param statuses_count [Integer]
          #   @param verified [Boolean]
        end
      end
    end
  end
end
