# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Users
        # @see XTwitterScraper::Resources::X::Users::Follow#delete_all
        class FollowDeleteAllParams < XTwitterScraper::Internal::Type::BaseModel
          extend XTwitterScraper::Internal::Type::RequestParameters::Converter
          include XTwitterScraper::Internal::Type::RequestParameters

          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute account
          #   X account identifier (@username or account ID)
          #
          #   @return [String]
          required :account, String

          # @!attribute idempotency_key
          #
          #   @return [String]
          required :idempotency_key, String

          # @!method initialize(id:, account:, idempotency_key:, request_options: {})
          #   @param id [String]
          #
          #   @param account [String] X account identifier (@username or account ID)
          #
          #   @param idempotency_key [String]
          #
          #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
