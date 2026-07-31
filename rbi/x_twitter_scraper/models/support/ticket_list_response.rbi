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
            T::Array[
              XTwitterScraper::Models::Support::TicketListResponse::Ticket
            ]
          )
        end
        attr_accessor :tickets

        sig do
          params(
            tickets:
              T::Array[
                XTwitterScraper::Models::Support::TicketListResponse::Ticket::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(tickets:)
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

          sig { returns(Time) }
          attr_accessor :created_at

          sig { returns(Integer) }
          attr_accessor :message_count

          sig { returns(String) }
          attr_accessor :public_id

          sig do
            returns(
              XTwitterScraper::Models::Support::TicketListResponse::Ticket::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          sig { returns(String) }
          attr_accessor :subject

          sig { returns(Time) }
          attr_accessor :updated_at

          sig do
            params(
              created_at: Time,
              message_count: Integer,
              public_id: String,
              status:
                XTwitterScraper::Models::Support::TicketListResponse::Ticket::Status::OrSymbol,
              subject: String,
              updated_at: Time
            ).returns(T.attached_class)
          end
          def self.new(
            created_at:,
            message_count:,
            public_id:,
            status:,
            subject:,
            updated_at:
          )
          end

          sig do
            override.returns(
              {
                created_at: Time,
                message_count: Integer,
                public_id: String,
                status:
                  XTwitterScraper::Models::Support::TicketListResponse::Ticket::Status::TaggedSymbol,
                subject: String,
                updated_at: Time
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
                  XTwitterScraper::Models::Support::TicketListResponse::Ticket::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            OPEN =
              T.let(
                :open,
                XTwitterScraper::Models::Support::TicketListResponse::Ticket::Status::TaggedSymbol
              )
            IN_PROGRESS =
              T.let(
                :in_progress,
                XTwitterScraper::Models::Support::TicketListResponse::Ticket::Status::TaggedSymbol
              )
            RESOLVED =
              T.let(
                :resolved,
                XTwitterScraper::Models::Support::TicketListResponse::Ticket::Status::TaggedSymbol
              )
            CLOSED =
              T.let(
                :closed,
                XTwitterScraper::Models::Support::TicketListResponse::Ticket::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::Support::TicketListResponse::Ticket::Status::TaggedSymbol
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
