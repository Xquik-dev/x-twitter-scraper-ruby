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

          sig { returns(T.nilable(String)) }
          attr_reader :created_at

          sig { params(created_at: String).void }
          attr_writer :created_at

          sig { returns(T.nilable(String)) }
          attr_reader :receiver_id

          sig { params(receiver_id: String).void }
          attr_writer :receiver_id

          sig { returns(T.nilable(String)) }
          attr_reader :sender_id

          sig { params(sender_id: String).void }
          attr_writer :sender_id

          sig { returns(T.nilable(String)) }
          attr_reader :text

          sig { params(text: String).void }
          attr_writer :text

          sig do
            params(
              id: String,
              created_at: String,
              receiver_id: String,
              sender_id: String,
              text: String
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            created_at: nil,
            receiver_id: nil,
            sender_id: nil,
            text: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: String,
                receiver_id: String,
                sender_id: String,
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
