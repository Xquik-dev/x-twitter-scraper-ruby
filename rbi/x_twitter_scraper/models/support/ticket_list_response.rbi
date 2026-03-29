# typed: strong

module XTwitterScraper
  module Models
    module Support
      class TicketListResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Support::TicketListResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              T::Array[
                XTwitterScraper::Models::Support::TicketListResponse::Ticket
              ]
            )
          )
        end
        attr_reader :tickets

        sig do
          params(
            tickets:
              T::Array[
                XTwitterScraper::Models::Support::TicketListResponse::Ticket::OrHash
              ]
          ).void
        end
        attr_writer :tickets

        sig do
          params(
            tickets:
              T::Array[
                XTwitterScraper::Models::Support::TicketListResponse::Ticket::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(tickets: nil)
        end

        sig do
          override.returns(
            {
              tickets:
                T::Array[
                  XTwitterScraper::Models::Support::TicketListResponse::Ticket
                ]
            }
          )
        end
        def to_hash
        end

        class Ticket < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::Support::TicketListResponse::Ticket,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Time)) }
          attr_reader :created_at

          sig { params(created_at: Time).void }
          attr_writer :created_at

          sig { returns(T.nilable(Integer)) }
          attr_reader :message_count

          sig { params(message_count: Integer).void }
          attr_writer :message_count

          sig { returns(T.nilable(String)) }
          attr_reader :public_id

          sig { params(public_id: String).void }
          attr_writer :public_id

          sig { returns(T.nilable(String)) }
          attr_reader :status

          sig { params(status: String).void }
          attr_writer :status

          sig { returns(T.nilable(String)) }
          attr_reader :subject

          sig { params(subject: String).void }
          attr_writer :subject

          sig { returns(T.nilable(Time)) }
          attr_reader :updated_at

          sig { params(updated_at: Time).void }
          attr_writer :updated_at

          sig do
            params(
              created_at: Time,
              message_count: Integer,
              public_id: String,
              status: String,
              subject: String,
              updated_at: Time
            ).returns(T.attached_class)
          end
          def self.new(
            created_at: nil,
            message_count: nil,
            public_id: nil,
            status: nil,
            subject: nil,
            updated_at: nil
          )
          end

          sig do
            override.returns(
              {
                created_at: Time,
                message_count: Integer,
                public_id: String,
                status: String,
                subject: String,
                updated_at: Time
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
