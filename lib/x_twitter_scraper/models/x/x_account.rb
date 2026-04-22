# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      class XAccount < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

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

        # @!method initialize(id:, created_at:, status:, x_user_id:, x_username:)
        #   Linked X account summary with username and connection status.
        #
        #   @param id [String]
        #   @param created_at [Time]
        #   @param status [String]
        #   @param x_user_id [String]
        #   @param x_username [String]
      end
    end

    XAccount = X::XAccount
  end
end
