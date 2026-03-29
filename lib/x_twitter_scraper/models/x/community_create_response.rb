# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Communities#create
      class CommunityCreateResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute community_id
        #
        #   @return [String]
        required :community_id, String, api_name: :communityId

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!attribute community_name
        #
        #   @return [String, nil]
        optional :community_name, String, api_name: :communityName

        # @!method initialize(community_id:, community_name: nil, success: true)
        #   @param community_id [String]
        #   @param community_name [String]
        #   @param success [Boolean, true]
      end
    end
  end
end
