# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      class TweetAuthor < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute followers
        #
        #   @return [Integer]
        required :followers, Integer

        # @!attribute username
        #
        #   @return [String]
        required :username, String

        # @!attribute verified
        #
        #   @return [Boolean]
        required :verified, XTwitterScraper::Internal::Type::Boolean

        # @!attribute profile_picture
        #
        #   @return [String, nil]
        optional :profile_picture, String, api_name: :profilePicture

        # @!method initialize(id:, followers:, username:, verified:, profile_picture: nil)
        #   @param id [String]
        #   @param followers [Integer]
        #   @param username [String]
        #   @param verified [Boolean]
        #   @param profile_picture [String]
      end
    end
  end
end
