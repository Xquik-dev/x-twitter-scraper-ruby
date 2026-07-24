# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    XAccountDetail = X::XAccountDetail

    module X
      class XAccountDetail < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::XAccountDetail,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        sig do
          returns(XTwitterScraper::X::XAccountDetail::Health::TaggedSymbol)
        end
        attr_accessor :health

        sig { returns(String) }
        attr_accessor :status

        sig { returns(String) }
        attr_accessor :x_user_id

        sig { returns(String) }
        attr_accessor :x_username

        sig { returns(T.nilable(Time)) }
        attr_reader :cookies_obtained_at

        sig { params(cookies_obtained_at: Time).void }
        attr_writer :cookies_obtained_at

        sig { returns(T.nilable(Time)) }
        attr_reader :updated_at

        sig { params(updated_at: Time).void }
        attr_writer :updated_at

        # Connected X account details with health and timestamp metadata.
        sig do
          params(
            id: String,
            created_at: Time,
            health: XTwitterScraper::X::XAccountDetail::Health::OrSymbol,
            status: String,
            x_user_id: String,
            x_username: String,
            cookies_obtained_at: Time,
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          health:,
          status:,
          x_user_id:,
          x_username:,
          cookies_obtained_at: nil,
          updated_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              health: XTwitterScraper::X::XAccountDetail::Health::TaggedSymbol,
              status: String,
              x_user_id: String,
              x_username: String,
              cookies_obtained_at: Time,
              updated_at: Time
            }
          )
        end
        def to_hash
        end

        module Health
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, XTwitterScraper::X::XAccountDetail::Health)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HEALTHY =
            T.let(
              :healthy,
              XTwitterScraper::X::XAccountDetail::Health::TaggedSymbol
            )
          LOCKED =
            T.let(
              :locked,
              XTwitterScraper::X::XAccountDetail::Health::TaggedSymbol
            )
          NEEDS_REAUTH =
            T.let(
              :needsReauth,
              XTwitterScraper::X::XAccountDetail::Health::TaggedSymbol
            )
          RECOVERING =
            T.let(
              :recovering,
              XTwitterScraper::X::XAccountDetail::Health::TaggedSymbol
            )
          SUSPENDED =
            T.let(
              :suspended,
              XTwitterScraper::X::XAccountDetail::Health::TaggedSymbol
            )
          TEMPORARY_ISSUE =
            T.let(
              :temporaryIssue,
              XTwitterScraper::X::XAccountDetail::Health::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[XTwitterScraper::X::XAccountDetail::Health::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
