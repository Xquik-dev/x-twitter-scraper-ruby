# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Communities
        # @see XTwitterScraper::Resources::X::Communities::Join#delete_all
        class JoinDeleteAllResponse < XTwitterScraper::Internal::Type::BaseModel
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
