# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Accounts#reauth
      class AccountReauthResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute status
        #
        #   @return [String]
        required :status, String

        # @!attribute x_username
        #
        #   @return [String]
        required :x_username, String, api_name: :xUsername

        # @!method initialize(id:, status:, x_username:)
        #   @param id [String]
        #   @param status [String]
        #   @param x_username [String]
      end
    end
  end
end
