# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Account#set_x_username
    class AccountSetXUsernameResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!attribute x_username
      #
      #   @return [String]
      required :x_username, String, api_name: :xUsername

      # @!method initialize(x_username:, success: true)
      #   @param x_username [String]
      #   @param success [Boolean, true]
    end
  end
end
