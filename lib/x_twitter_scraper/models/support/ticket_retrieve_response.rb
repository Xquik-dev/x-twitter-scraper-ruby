# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Support
      # @see XTwitterScraper::Resources::Support::Tickets#retrieve
      class TicketRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time, api_name: :createdAt

        # @!attribute messages
        #
        #   @return [Array<XTwitterScraper::Models::Support::TicketRetrieveResponse::Message>, nil]
        optional :messages,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Support::TicketRetrieveResponse::Message] }

        # @!attribute public_id
        #
        #   @return [String, nil]
        optional :public_id, String, api_name: :publicId

        # @!attribute status
        #
        #   @return [String, nil]
        optional :status, String

        # @!attribute subject
        #
        #   @return [String, nil]
        optional :subject, String

        # @!attribute updated_at
        #
        #   @return [Time, nil]
        optional :updated_at, Time, api_name: :updatedAt

        # @!method initialize(created_at: nil, messages: nil, public_id: nil, status: nil, subject: nil, updated_at: nil)
        #   @param created_at [Time]
        #   @param messages [Array<XTwitterScraper::Models::Support::TicketRetrieveResponse::Message>]
        #   @param public_id [String]
        #   @param status [String]
        #   @param subject [String]
        #   @param updated_at [Time]

        class Message < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute body
          #
          #   @return [String, nil]
          optional :body, String

          # @!attribute created_at
          #
          #   @return [Time, nil]
          optional :created_at, Time, api_name: :createdAt

          # @!attribute sender
          #
          #   @return [String, nil]
          optional :sender, String

          # @!method initialize(body: nil, created_at: nil, sender: nil)
          #   @param body [String]
          #   @param created_at [Time]
          #   @param sender [String]
        end
      end
    end
  end
end
