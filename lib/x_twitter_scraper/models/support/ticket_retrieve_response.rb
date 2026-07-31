# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Support
      # @see XTwitterScraper::Resources::Support::Tickets#retrieve
      class TicketRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute messages
        #
        #   @return [Array<XTwitterScraper::Models::Support::TicketRetrieveResponse::Message>]
        required :messages,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Support::TicketRetrieveResponse::Message] }

        # @!attribute public_id
        #
        #   @return [String]
        required :public_id, String, api_name: :publicId

        # @!attribute status
        #
        #   @return [Symbol, XTwitterScraper::Models::Support::TicketRetrieveResponse::Status]
        required :status, enum: -> { XTwitterScraper::Models::Support::TicketRetrieveResponse::Status }

        # @!attribute subject
        #
        #   @return [String]
        required :subject, String

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!method initialize(created_at:, messages:, public_id:, status:, subject:, updated_at:)
        #   @param created_at [Time]
        #   @param messages [Array<XTwitterScraper::Models::Support::TicketRetrieveResponse::Message>]
        #   @param public_id [String]
        #   @param status [Symbol, XTwitterScraper::Models::Support::TicketRetrieveResponse::Status]
        #   @param subject [String]
        #   @param updated_at [Time]

        class Message < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute attachments
          #
          #   @return [Array<XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment>]
          required :attachments,
                   -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment] }

          # @!attribute body
          #
          #   @return [String]
          required :body, String

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time, api_name: :createdAt

          # @!attribute sender
          #
          #   @return [Symbol, XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Sender]
          required :sender, enum: -> { XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Sender }

          # @!method initialize(attachments:, body:, created_at:, sender:)
          #   @param attachments [Array<XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment>]
          #   @param body [String]
          #   @param created_at [Time]
          #   @param sender [Symbol, XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Sender]

          class Attachment < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute content_type
            #   Validated media type.
            #
            #   @return [Symbol, XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType]
            required :content_type,
                     enum: -> { XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType },
                     api_name: :contentType

            # @!attribute filename
            #
            #   @return [String]
            required :filename, String

            # @!attribute kind
            #   Attachment media class.
            #
            #   @return [Symbol, XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Kind]
            required :kind,
                     enum: -> { XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Kind }

            # @!attribute public_id
            #
            #   @return [String]
            required :public_id, String, api_name: :publicId

            # @!attribute size_bytes
            #
            #   @return [Integer]
            required :size_bytes, Integer, api_name: :sizeBytes

            # @!attribute status
            #   Storage processing state.
            #
            #   @return [Symbol, XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Status]
            required :status,
                     enum: -> { XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Status }

            # @!attribute url
            #
            #   @return [String]
            required :url, String

            # @!method initialize(content_type:, filename:, kind:, public_id:, size_bytes:, status:, url:)
            #   Downloadable image or video attached to a support message.
            #
            #   @param content_type [Symbol, XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType] Validated media type.
            #
            #   @param filename [String]
            #
            #   @param kind [Symbol, XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Kind] Attachment media class.
            #
            #   @param public_id [String]
            #
            #   @param size_bytes [Integer]
            #
            #   @param status [Symbol, XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Status] Storage processing state.
            #
            #   @param url [String]

            # Validated media type.
            #
            # @see XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment#content_type
            module ContentType
              extend XTwitterScraper::Internal::Type::Enum

              IMAGE_JPEG = :"image/jpeg"
              IMAGE_PNG = :"image/png"
              IMAGE_GIF = :"image/gif"
              IMAGE_WEBP = :"image/webp"
              VIDEO_MP4 = :"video/mp4"
              VIDEO_QUICKTIME = :"video/quicktime"
              VIDEO_WEBM = :"video/webm"

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Attachment media class.
            #
            # @see XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment#kind
            module Kind
              extend XTwitterScraper::Internal::Type::Enum

              IMAGE = :image
              VIDEO = :video

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Storage processing state.
            #
            # @see XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment#status
            module Status
              extend XTwitterScraper::Internal::Type::Enum

              PENDING = :pending
              READY = :ready
              FAILED = :failed

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see XTwitterScraper::Models::Support::TicketRetrieveResponse::Message#sender
          module Sender
            extend XTwitterScraper::Internal::Type::Enum

            USER = :user
            SUPPORT = :support
            SYSTEM = :system

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see XTwitterScraper::Models::Support::TicketRetrieveResponse#status
        module Status
          extend XTwitterScraper::Internal::Type::Enum

          OPEN = :open
          IN_PROGRESS = :in_progress
          RESOLVED = :resolved
          CLOSED = :closed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
