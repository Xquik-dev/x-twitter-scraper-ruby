# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      class TweetAuthor < XTwitterScraper::Models::UserProfile
        # @!attribute followers
        #
        #   @return [Integer]
        required :followers, Integer

        # @!attribute verified
        #
        #   @return [Boolean]
        required :verified, XTwitterScraper::Internal::Type::Boolean

        # @!method initialize(followers:, verified:)
        #   Tweet author profile. The lookup route always includes follower count and
        #   verification state. Other profile fields appear when available.
        #
        #   @param followers [Integer]
        #   @param verified [Boolean]
      end
    end
  end
end
