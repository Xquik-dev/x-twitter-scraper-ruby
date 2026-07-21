# typed: strong

module XTwitterScraper
  module Models
    module Support
      class TicketCreateResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Support::TicketCreateResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              T::Array[
                XTwitterScraper::Models::Support::TicketCreateResponse::Attachment
              ]
            )
          )
        end
        attr_reader :attachments

        sig do
          params(
            attachments:
              T::Array[
                XTwitterScraper::Models::Support::TicketCreateResponse::Attachment::OrHash
              ]
          ).void
        end
        attr_writer :attachments

        sig { returns(T.nilable(String)) }
        attr_reader :public_id

        sig { params(public_id: String).void }
        attr_writer :public_id

        sig do
          params(
            attachments:
              T::Array[
                XTwitterScraper::Models::Support::TicketCreateResponse::Attachment::OrHash
              ],
            public_id: String
          ).returns(T.attached_class)
        end
        def self.new(attachments: nil, public_id: nil)
        end

        sig do
          override.returns(
            {
              attachments:
                T::Array[
                  XTwitterScraper::Models::Support::TicketCreateResponse::Attachment
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
                XTwitterScraper::Models::Support::TicketCreateResponse::Attachment,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :public_id

          sig do
            returns(
              XTwitterScraper::Models::Support::TicketCreateResponse::Attachment::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          sig do
            params(
              public_id: String,
              status:
                XTwitterScraper::Models::Support::TicketCreateResponse::Attachment::Status::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(public_id:, status:)
          end

          sig do
            override.returns(
              {
                public_id: String,
                status:
                  XTwitterScraper::Models::Support::TicketCreateResponse::Attachment::Status::TaggedSymbol
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
                  XTwitterScraper::Models::Support::TicketCreateResponse::Attachment::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PENDING =
              T.let(
                :pending,
                XTwitterScraper::Models::Support::TicketCreateResponse::Attachment::Status::TaggedSymbol
              )
            READY =
              T.let(
                :ready,
                XTwitterScraper::Models::Support::TicketCreateResponse::Attachment::Status::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                XTwitterScraper::Models::Support::TicketCreateResponse::Attachment::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::Support::TicketCreateResponse::Attachment::Status::TaggedSymbol
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
