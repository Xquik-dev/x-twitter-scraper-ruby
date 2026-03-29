# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Users
        # @see XTwitterScraper::Resources::X::Users::Follow#delete_all
        class FollowDeleteAllResponse < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute success
          #
          #   @return [Boolean, true]
          required :success, const: true

          # @!method initialize(success: true)
          #   @param success [Boolean, true]
        end
      end
    end
  end
end
