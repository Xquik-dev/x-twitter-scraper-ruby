# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Accounts#create
      class AccountCreateResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute status
        #
        #   @return [String]
        required :status, String

        # @!attribute x_user_id
        #
        #   @return [String]
        required :x_user_id, String, api_name: :xUserId

        # @!attribute x_username
        #
        #   @return [String]
        required :x_username, String, api_name: :xUsername

        # @!method initialize(id:, status:, x_user_id:, x_username:)
        #   @param id [String]
        #   @param status [String]
        #   @param x_user_id [String]
        #   @param x_username [String]
      end
    end
  end
end
