# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class DmRetrieveHistoryResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::DmRetrieveHistoryResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :has_next_page

        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::X::DmRetrieveHistoryResponse::Message
            ]
          )
        end
        attr_accessor :messages

        sig { returns(String) }
        attr_accessor :next_cursor

        sig do
          params(
            has_next_page: T::Boolean,
            messages:
              T::Array[
                XTwitterScraper::Models::X::DmRetrieveHistoryResponse::Message::OrHash
              ],
            next_cursor: String
          ).returns(T.attached_class)
        end
        def self.new(has_next_page:, messages:, next_cursor:)
        end

        sig do
          override.returns(
            {
              has_next_page: T::Boolean,
              messages:
                T::Array[
                  XTwitterScraper::Models::X::DmRetrieveHistoryResponse::Message
                ],
              next_cursor: String
            }
          )
        end
        def to_hash
        end

        class Message < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::DmRetrieveHistoryResponse::Message,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :receiver_id

          sig { returns(String) }
          attr_accessor :sender_id

          sig { returns(T.nilable(String)) }
          attr_reader :created_at

          sig { params(created_at: String).void }
          attr_writer :created_at

          # URL of attached media (image, GIF, or video). Omitted when the message has no
          # media attachment.
          sig { returns(T.nilable(String)) }
          attr_reader :media_url

          sig { params(media_url: String).void }
          attr_writer :media_url

          sig { returns(T.nilable(String)) }
          attr_reader :text

          sig { params(text: String).void }
          attr_writer :text

          sig do
            params(
              id: String,
              receiver_id: String,
              sender_id: String,
              created_at: String,
              media_url: String,
              text: String
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            receiver_id:,
            sender_id:,
            created_at: nil,
            # URL of attached media (image, GIF, or video). Omitted when the message has no
            # media attachment.
            media_url: nil,
            text: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                receiver_id: String,
                sender_id: String,
                created_at: String,
                media_url: String,
                text: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
