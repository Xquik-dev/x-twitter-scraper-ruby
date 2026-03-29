# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Communities#retrieve_info
      class CommunityRetrieveInfoResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute community
        #   Community info object
        #
        #   @return [Object]
        required :community, XTwitterScraper::Internal::Type::Unknown

        # @!method initialize(community:)
        #   @param community [Object] Community info object
      end
    end
  end
end
