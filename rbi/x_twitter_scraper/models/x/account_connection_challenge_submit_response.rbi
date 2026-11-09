# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class AccountConnectionChallengeSubmitResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health::TaggedSymbol
            )
          )
        end
        attr_reader :health

        sig do
          params(
            health:
              XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health::OrSymbol
          ).void
        end
        attr_writer :health

        sig do
          returns(
            XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig { returns(T.nilable(String)) }
        attr_reader :x_user_id

        sig { params(x_user_id: String).void }
        attr_writer :x_user_id

        sig { returns(T.nilable(String)) }
        attr_reader :x_username

        sig { params(x_username: String).void }
        attr_writer :x_username

        # Sanitized X account summary returned by connect and reauth.
        sig do
          params(
            id: String,
            status:
              XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Status::OrSymbol,
            created_at: Time,
            health:
              XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health::OrSymbol,
            x_user_id: String,
            x_username: String
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          status:,
          created_at: nil,
          health: nil,
          x_user_id: nil,
          x_username: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              health:
                XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health::TaggedSymbol,
              status:
                XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Status::TaggedSymbol,
              x_user_id: String,
              x_username: String
            }
          )
        end
        def to_hash
        end

        module Health
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HEALTHY =
            T.let(
              :healthy,
              XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health::TaggedSymbol
            )
          LOCKED =
            T.let(
              :locked,
              XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health::TaggedSymbol
            )
          NEEDS_REAUTH =
            T.let(
              :needsReauth,
              XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health::TaggedSymbol
            )
          RECOVERING =
            T.let(
              :recovering,
              XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health::TaggedSymbol
            )
          SUSPENDED =
            T.let(
              :suspended,
              XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health::TaggedSymbol
            )
          TEMPORARY_ISSUE =
            T.let(
              :temporaryIssue,
              XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Status
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Status::TaggedSymbol
            )
          REQUIRES_EMAIL_CODE =
            T.let(
              :requires_email_code,
              XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Status::TaggedSymbol
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
