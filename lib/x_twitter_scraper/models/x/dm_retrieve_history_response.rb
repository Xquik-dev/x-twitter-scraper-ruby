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

          # @!attribute receiver_id
          #
          #   @return [String]
          required :receiver_id, String, api_name: :receiverId

          # @!attribute sender_id
          #
          #   @return [String]
          required :sender_id, String, api_name: :senderId

          # @!attribute created_at
          #
          #   @return [String, nil]
          optional :created_at, String, api_name: :createdAt

          # @!attribute media_url
          #   URL of attached media (image, GIF, or video). Omitted when the message has no
          #   media attachment.
          #
          #   @return [String, nil]
          optional :media_url, String, api_name: :mediaUrl

          # @!attribute text
          #
          #   @return [String, nil]
          optional :text, String

          # @!method initialize(id:, receiver_id:, sender_id:, created_at: nil, media_url: nil, text: nil)
          #   Some parameter documentations has been truncated, see
          #   {XTwitterScraper::Models::X::DmRetrieveHistoryResponse::Message} for more
          #   details.
          #
          #   @param id [String]
          #
          #   @param receiver_id [String]
          #
          #   @param sender_id [String]
          #
          #   @param created_at [String]
          #
          #   @param media_url [String] URL of attached media (image, GIF, or video). Omitted when the message has no me
          #
          #   @param text [String]
        end
      end
    end
  end
end
