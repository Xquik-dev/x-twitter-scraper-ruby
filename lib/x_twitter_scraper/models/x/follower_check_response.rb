# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Followers#check
      class FollowerCheckResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute is_followed_by
        #
        #   @return [Boolean]
        required :is_followed_by, XTwitterScraper::Internal::Type::Boolean, api_name: :isFollowedBy

        # @!attribute is_following
        #
        #   @return [Boolean]
        required :is_following, XTwitterScraper::Internal::Type::Boolean, api_name: :isFollowing

        # @!attribute source_username
        #
        #   @return [String]
        required :source_username, String, api_name: :sourceUsername

        # @!attribute target_username
        #
        #   @return [String]
        required :target_username, String, api_name: :targetUsername

        # @!method initialize(is_followed_by:, is_following:, source_username:, target_username:)
        #   @param is_followed_by [Boolean]
        #   @param is_following [Boolean]
        #   @param source_username [String]
        #   @param target_username [String]
      end
    end
  end
end
