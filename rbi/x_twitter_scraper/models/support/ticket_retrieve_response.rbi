# typed: strong

module XTwitterScraper
  module Models
    module Support
      class TicketRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Support::TicketRetrieveResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        sig do
          returns(
            T.nilable(
              T::Array[
                XTwitterScraper::Models::Support::TicketRetrieveResponse::Message
              ]
            )
          )
        end
        attr_reader :messages

        sig do
          params(
            messages:
              T::Array[
                XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::OrHash
              ]
          ).void
        end
        attr_writer :messages

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
            messages:
              T::Array[
                XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::OrHash
              ],
            public_id: String,
            status: String,
            subject: String,
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          created_at: nil,
          messages: nil,
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
              messages:
                T::Array[
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message
                ],
              public_id: String,
              status: String,
              subject: String,
              updated_at: Time
            }
          )
        end
        def to_hash
        end

        class Message < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::Support::TicketRetrieveResponse::Message,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :body

          sig { params(body: String).void }
          attr_writer :body

          sig { returns(T.nilable(Time)) }
          attr_reader :created_at

          sig { params(created_at: Time).void }
          attr_writer :created_at

          sig { returns(T.nilable(String)) }
          attr_reader :sender

          sig { params(sender: String).void }
          attr_writer :sender

          sig do
            params(body: String, created_at: Time, sender: String).returns(
              T.attached_class
            )
          end
          def self.new(body: nil, created_at: nil, sender: nil)
          end

          sig do
            override.returns({ body: String, created_at: Time, sender: String })
          end
          def to_hash
          end
        end
      end
    end
  end
end
