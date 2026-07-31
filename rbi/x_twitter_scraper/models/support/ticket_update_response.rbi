# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module Support
      class TicketUpdateResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Support::TicketUpdateResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :public_id

        sig do
          returns(
            XTwitterScraper::Models::Support::TicketUpdateResponse::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          params(
            public_id: String,
            status:
              XTwitterScraper::Models::Support::TicketUpdateResponse::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(public_id:, status:)
        end

        sig do
          override.returns(
            {
              public_id: String,
              status:
                XTwitterScraper::Models::Support::TicketUpdateResponse::Status::TaggedSymbol
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
                XTwitterScraper::Models::Support::TicketUpdateResponse::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OPEN =
            T.let(
              :open,
              XTwitterScraper::Models::Support::TicketUpdateResponse::Status::TaggedSymbol
            )
          RESOLVED =
            T.let(
              :resolved,
              XTwitterScraper::Models::Support::TicketUpdateResponse::Status::TaggedSymbol
            )
          CLOSED =
            T.let(
              :closed,
              XTwitterScraper::Models::Support::TicketUpdateResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::Support::TicketUpdateResponse::Status::TaggedSymbol
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
