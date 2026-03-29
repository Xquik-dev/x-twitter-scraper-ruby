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

        sig { returns(T.nilable(String)) }
        attr_reader :public_id

        sig { params(public_id: String).void }
        attr_writer :public_id

        sig { params(public_id: String).returns(T.attached_class) }
        def self.new(public_id: nil)
        end

        sig { override.returns({ public_id: String }) }
        def to_hash
        end
      end
    end
  end
end
