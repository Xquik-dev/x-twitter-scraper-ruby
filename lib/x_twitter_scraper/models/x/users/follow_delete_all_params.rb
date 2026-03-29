# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Users
        # @see XTwitterScraper::Resources::X::Users::Follow#delete_all
        class FollowDeleteAllParams < XTwitterScraper::Internal::Type::BaseModel
          extend XTwitterScraper::Internal::Type::RequestParameters::Converter
          include XTwitterScraper::Internal::Type::RequestParameters

          # @!attribute user_id
          #
          #   @return [String]
          required :user_id, String

          # @!attribute account
          #   X account (@username or account ID)
          #
          #   @return [String]
          required :account, String

          # @!method initialize(user_id:, account:, request_options: {})
          #   @param user_id [String]
          #
          #   @param account [String] X account (@username or account ID)
          #
          #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
