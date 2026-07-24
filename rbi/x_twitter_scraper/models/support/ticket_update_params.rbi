# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module Support
      class TicketUpdateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Support::TicketUpdateParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            XTwitterScraper::Support::TicketUpdateParams::Status::OrSymbol
          )
        end
        attr_accessor :status

        sig do
          params(
            id: String,
            status:
              XTwitterScraper::Support::TicketUpdateParams::Status::OrSymbol,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(id:, status:, request_options: {})
        end

        sig do
          override.returns(
            {
              id: String,
              status:
                XTwitterScraper::Support::TicketUpdateParams::Status::OrSymbol,
              request_options: XTwitterScraper::RequestOptions
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
                XTwitterScraper::Support::TicketUpdateParams::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OPEN =
            T.let(
              :open,
              XTwitterScraper::Support::TicketUpdateParams::Status::TaggedSymbol
            )
          RESOLVED =
            T.let(
              :resolved,
              XTwitterScraper::Support::TicketUpdateParams::Status::TaggedSymbol
            )
          CLOSED =
            T.let(
              :closed,
              XTwitterScraper::Support::TicketUpdateParams::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Support::TicketUpdateParams::Status::TaggedSymbol
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
