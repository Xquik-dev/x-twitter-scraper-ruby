# typed: strong

module XTwitterScraper
  module Models
    module Support
      class TicketCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Support::TicketCreateParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :body

        sig { returns(String) }
        attr_accessor :subject

        sig { returns(T.nilable(String)) }
        attr_reader :idempotency_key

        sig { params(idempotency_key: String).void }
        attr_writer :idempotency_key

        sig do
          params(
            body: String,
            subject: String,
            idempotency_key: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(body:, subject:, idempotency_key: nil, request_options: {})
        end

        sig do
          override.returns(
            {
              body: String,
              subject: String,
              idempotency_key: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
