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

        sig { returns(Time) }
        attr_accessor :created_at

        sig do
          returns(
            XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health::TaggedSymbol
          )
        end
        attr_accessor :health

        sig { returns(String) }
        attr_accessor :status

        sig { returns(String) }
        attr_accessor :x_user_id

        sig { returns(String) }
        attr_accessor :x_username

        # Sanitized X account summary returned by connect and reauth.
        sig do
          params(
            id: String,
            created_at: Time,
            health:
              XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health::OrSymbol,
            status: String,
            x_user_id: String,
            x_username: String
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          health:,
          status:,
          x_user_id:,
          x_username:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              health:
                XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health::TaggedSymbol,
              status: String,
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
      end
    end
  end
end
