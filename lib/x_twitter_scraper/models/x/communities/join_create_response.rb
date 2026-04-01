# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Communities
        # @see XTwitterScraper::Resources::X::Communities::Join#create
        class JoinCreateResponse < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute community_id
          #
          #   @return [String]
          required :community_id, String, api_name: :communityId

          # @!attribute community_name
          #
          #   @return [String]
          required :community_name, String, api_name: :communityName

          # @!attribute success
          #
          #   @return [Boolean, true]
          required :success, const: true

          # @!method initialize(community_id:, community_name:, success: true)
          #   @param community_id [String]
          #   @param community_name [String]
          #   @param success [Boolean, true]
        end
      end
    end
  end
end
