# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#delete
      class TweetDeleteResponse < XTwitterScraper::Internal::Type::BaseModel
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
