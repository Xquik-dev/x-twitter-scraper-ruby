# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class XAccountConnectionLink < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::XAccountConnectionLink,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :object

        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(XTwitterScraper::X::XAccountConnectionLink::Purpose::TaggedSymbol)
        end
        attr_accessor :purpose

        # `failed` means 5 logins were refused, so make a new link. `revoked` means you
        # revoked it, or the key that made it is paused, revoked, expired, no longer Full
        # access or without `connectsXAccounts`. A link whose key resumes within its 30
        # minutes reads `pending` again.
        sig do
          returns(XTwitterScraper::X::XAccountConnectionLink::Status::TaggedSymbol)
        end
        attr_accessor :status

        # Your own ID for this person, as you sent it.
        sig { returns(T.nilable(String)) }
        attr_accessor :reference

        # The page the link offers as a button once the account connects.
        sig { returns(T.nilable(String)) }
        attr_accessor :return_url

        # The ID of the API key that made the link, or null when a dashboard session made
        # it.
        sig { returns(T.nilable(String)) }
        attr_accessor :api_key_id

        sig { returns(T.nilable(String)) }
        attr_accessor :account_id

        sig { returns(T.nilable(String)) }
        attr_accessor :x_user_id

        sig { returns(T.nilable(String)) }
        attr_accessor :x_username

        sig { returns(T.nilable(String)) }
        attr_accessor :health

        # Why the last login didn't finish.
        sig { returns(T.nilable(String)) }
        attr_accessor :failure

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(Time) }
        attr_accessor :expires_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :completed_at

        # Present only in the response that creates the link.
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # A link where a person connects an X account on Xquik's page.
        sig do
          params(
            id: String,
            purpose: XTwitterScraper::X::XAccountConnectionLink::Purpose::OrSymbol,
            status: XTwitterScraper::X::XAccountConnectionLink::Status::OrSymbol,
            reference: T.nilable(String),
            return_url: T.nilable(String),
            api_key_id: T.nilable(String),
            account_id: T.nilable(String),
            x_user_id: T.nilable(String),
            x_username: T.nilable(String),
            health: T.nilable(String),
            failure: T.nilable(String),
            created_at: Time,
            expires_at: Time,
            completed_at: T.nilable(Time),
            url: String,
            object: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          purpose:,
          # `failed` means 5 logins were refused, so make a new link. `revoked` means you
          # revoked it, or the key that made it is paused, revoked, expired, no longer Full
          # access or without `connectsXAccounts`. A link whose key resumes within its 30
          # minutes reads `pending` again.
          status:,
          # Your own ID for this person, as you sent it.
          reference:,
          # The page the link offers as a button once the account connects.
          return_url:,
          # The ID of the API key that made the link, or null when a dashboard session made
          # it.
          api_key_id:,
          account_id:,
          x_user_id:,
          x_username:,
          health:,
          # Why the last login didn't finish.
          failure:,
          created_at:,
          expires_at:,
          completed_at:,
          # Present only in the response that creates the link.
          url: nil,
          object: :x_account_connection_link
        )
        end

        sig do
          override.returns(
            {
              object: Symbol,
              id: String,
              purpose:
                XTwitterScraper::X::XAccountConnectionLink::Purpose::TaggedSymbol,
              status:
                XTwitterScraper::X::XAccountConnectionLink::Status::TaggedSymbol,
              reference: T.nilable(String),
              return_url: T.nilable(String),
              api_key_id: T.nilable(String),
              account_id: T.nilable(String),
              x_user_id: T.nilable(String),
              x_username: T.nilable(String),
              health: T.nilable(String),
              failure: T.nilable(String),
              created_at: Time,
              expires_at: Time,
              completed_at: T.nilable(Time),
              url: String
            }
          )
        end
        def to_hash
        end

        module Purpose
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, XTwitterScraper::X::XAccountConnectionLink::Purpose)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CONNECT =
            T.let(
              :connect,
              XTwitterScraper::X::XAccountConnectionLink::Purpose::TaggedSymbol
            )
          RECONNECT =
            T.let(
              :reconnect,
              XTwitterScraper::X::XAccountConnectionLink::Purpose::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::XAccountConnectionLink::Purpose::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # `failed` means 5 logins were refused, so make a new link. `revoked` means you
        # revoked it, or the key that made it is paused, revoked, expired, no longer Full
        # access or without `connectsXAccounts`. A link whose key resumes within its 30
        # minutes reads `pending` again.
        module Status
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, XTwitterScraper::X::XAccountConnectionLink::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :pending,
              XTwitterScraper::X::XAccountConnectionLink::Status::TaggedSymbol
            )
          CONNECTING =
            T.let(
              :connecting,
              XTwitterScraper::X::XAccountConnectionLink::Status::TaggedSymbol
            )
          REQUIRES_EMAIL_CODE =
            T.let(
              :requires_email_code,
              XTwitterScraper::X::XAccountConnectionLink::Status::TaggedSymbol
            )
          CONNECTED =
            T.let(
              :connected,
              XTwitterScraper::X::XAccountConnectionLink::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              XTwitterScraper::X::XAccountConnectionLink::Status::TaggedSymbol
            )
          EXPIRED =
            T.let(
              :expired,
              XTwitterScraper::X::XAccountConnectionLink::Status::TaggedSymbol
            )
          REVOKED =
            T.let(
              :revoked,
              XTwitterScraper::X::XAccountConnectionLink::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::XAccountConnectionLink::Status::TaggedSymbol
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
