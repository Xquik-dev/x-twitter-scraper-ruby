# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module Support
      class TicketReplyResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Support::TicketReplyResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::Support::TicketReplyResponse::Attachment
            ]
          )
        end
        attr_accessor :attachments

        sig { returns(String) }
        attr_accessor :public_id

        sig do
          params(
            attachments:
              T::Array[
                XTwitterScraper::Models::Support::TicketReplyResponse::Attachment::OrHash
              ],
            public_id: String
          ).returns(T.attached_class)
        end
        def self.new(attachments:, public_id:)
        end

        sig do
          override.returns(
            {
              attachments:
                T::Array[
                  XTwitterScraper::Models::Support::TicketReplyResponse::Attachment
                ],
              public_id: String
            }
          )
        end
        def to_hash
        end

        class Attachment < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::Support::TicketReplyResponse::Attachment,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :public_id

          sig do
            returns(
              XTwitterScraper::Models::Support::TicketReplyResponse::Attachment::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          # Attachment identifier and initial processing state.
          sig do
            params(
              public_id: String,
              status:
                XTwitterScraper::Models::Support::TicketReplyResponse::Attachment::Status::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(public_id:, status:)
          end

          sig do
            override.returns(
              {
                public_id: String,
                status:
                  XTwitterScraper::Models::Support::TicketReplyResponse::Attachment::Status::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module Status
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::Support::TicketReplyResponse::Attachment::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PENDING =
              T.let(
                :pending,
                XTwitterScraper::Models::Support::TicketReplyResponse::Attachment::Status::TaggedSymbol
              )
            READY =
              T.let(
                :ready,
                XTwitterScraper::Models::Support::TicketReplyResponse::Attachment::Status::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                XTwitterScraper::Models::Support::TicketReplyResponse::Attachment::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::Support::TicketReplyResponse::Attachment::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
