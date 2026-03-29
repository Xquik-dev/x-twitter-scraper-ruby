# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Tweets
        # @see XTwitterScraper::Resources::X::Tweets::Like#delete
        class LikeDeleteResponse < XTwitterScraper::Internal::Type::BaseModel
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
