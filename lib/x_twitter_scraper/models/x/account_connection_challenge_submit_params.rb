# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::AccountConnectionChallenges#submit
      class AccountConnectionChallengeSubmitParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute email_code
        #   Code sent to the account email.
        #
        #   @return [String]
        required :email_code, String

        # @!method initialize(id:, email_code:, request_options: {})
        #   @param id [String]
        #
        #   @param email_code [String] Code sent to the account email.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
