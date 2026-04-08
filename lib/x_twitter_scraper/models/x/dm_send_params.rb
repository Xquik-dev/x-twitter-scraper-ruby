# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Dm#send_
      class DmSendParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute account
        #   X account (@username or ID) sending the DM
        #
        #   @return [String]
        required :account, String

        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute media_ids
        #
        #   @return [Array<String>, nil]
        optional :media_ids, XTwitterScraper::Internal::Type::ArrayOf[String]

        # @!attribute reply_to_message_id
        #
        #   @return [String, nil]
        optional :reply_to_message_id, String

        # @!method initialize(user_id:, account:, text:, media_ids: nil, reply_to_message_id: nil, request_options: {})
        #   @param user_id [String]
        #
        #   @param account [String] X account (@username or ID) sending the DM
        #
        #   @param text [String]
        #
        #   @param media_ids [Array<String>]
        #
        #   @param reply_to_message_id [String]
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
