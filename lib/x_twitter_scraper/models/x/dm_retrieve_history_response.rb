# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Dm#retrieve_history
      class DmRetrieveHistoryResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute has_next_page
        #
        #   @return [Boolean]
        required :has_next_page, XTwitterScraper::Internal::Type::Boolean

        # @!attribute messages
        #
        #   @return [Array<XTwitterScraper::Models::X::DmRetrieveHistoryResponse::Message>]
        required :messages,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::DmRetrieveHistoryResponse::Message] }

        # @!attribute next_cursor
        #
        #   @return [String]
        required :next_cursor, String

        # @!method initialize(has_next_page:, messages:, next_cursor:)
        #   @param has_next_page [Boolean]
        #   @param messages [Array<XTwitterScraper::Models::X::DmRetrieveHistoryResponse::Message>]
        #   @param next_cursor [String]

        class Message < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #
          #   @return [String, nil]
          optional :created_at, String, api_name: :createdAt

          # @!attribute receiver_id
          #
          #   @return [String, nil]
          optional :receiver_id, String, api_name: :receiverId

          # @!attribute sender_id
          #
          #   @return [String, nil]
          optional :sender_id, String, api_name: :senderId

          # @!attribute text
          #
          #   @return [String, nil]
          optional :text, String

          # @!method initialize(id:, created_at: nil, receiver_id: nil, sender_id: nil, text: nil)
          #   @param id [String]
          #   @param created_at [String]
          #   @param receiver_id [String]
          #   @param sender_id [String]
          #   @param text [String]
        end
      end
    end
  end
end
