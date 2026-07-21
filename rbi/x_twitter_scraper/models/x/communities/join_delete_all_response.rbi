# typed: strong

module XTwitterScraper
  module Models
    module X
      module Communities
        class JoinDeleteAllResponse < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          # Connected account selected for the write.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Account
              )
            )
          end
          attr_reader :account

          sig do
            params(
              account:
                T.nilable(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Account::OrHash
                )
            ).void
          end
          attr_writer :account

          sig do
            returns(
              XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
            )
          end
          attr_accessor :action

          # plannedCredits is the approved maximum. chargedCredits comes from the settled
          # credit ledger. Pending or failed writes are not charged.
          sig do
            returns(
              XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing
            )
          end
          attr_reader :billing

          sig do
            params(
              billing:
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing::OrHash
            ).void
          end
          attr_writer :billing

          sig { returns(T::Boolean) }
          attr_accessor :charged

          sig { returns(String) }
          attr_accessor :charged_credits

          # Exact follow-up an API client or agent should perform.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::NextAction
              )
            )
          end
          attr_reader :next_action

          sig do
            params(
              next_action:
                T.nilable(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::NextAction::OrHash
                )
            ).void
          end
          attr_writer :next_action

          sig { returns(Symbol) }
          attr_accessor :object

          sig { returns(T.nilable(Integer)) }
          attr_accessor :poll_after_ms

          # Stable fingerprint and sanitized payload for replay checks.
          sig do
            returns(
              XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Request
            )
          end
          attr_reader :request

          sig do
            params(
              request:
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Request::OrHash
            ).void
          end
          attr_writer :request

          # Confirmed result produced by the write, when available.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result
              )
            )
          end
          attr_reader :result

          sig do
            params(
              result:
                T.nilable(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result::OrHash
                )
            ).void
          end
          attr_writer :result

          # True only when a new attempt can reasonably succeed.
          sig { returns(T::Boolean) }
          attr_accessor :retryable

          # True only when no write was dispatched and a new idempotency key may be used.
          sig { returns(T::Boolean) }
          attr_accessor :safe_to_retry

          sig { returns(T::Boolean) }
          attr_accessor :send_dispatched

          sig do
            returns(
              XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          sig { returns(String) }
          attr_accessor :status_url

          sig { returns(T::Boolean) }
          attr_accessor :success

          # Existing X resource targeted by the write, when applicable.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Target
              )
            )
          end
          attr_reader :target

          sig do
            params(
              target:
                T.nilable(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Target::OrHash
                )
            ).void
          end
          attr_writer :target

          sig { returns(T.nilable(String)) }
          attr_accessor :target_id

          sig { returns(T::Boolean) }
          attr_accessor :terminal

          sig { returns(String) }
          attr_accessor :write_action_id

          # Compatibility field for a confirmed community ID.
          sig { returns(T.nilable(String)) }
          attr_reader :community_id

          sig { params(community_id: String).void }
          attr_writer :community_id

          # Confirmed community name when available.
          sig { returns(T.nilable(String)) }
          attr_reader :community_name

          sig { params(community_name: String).void }
          attr_writer :community_name

          sig { returns(T.nilable(Time)) }
          attr_reader :completed_at

          sig { params(completed_at: Time).void }
          attr_writer :completed_at

          sig { returns(T.nilable(Integer)) }
          attr_reader :confirmation_attempts

          sig { params(confirmation_attempts: Integer).void }
          attr_writer :confirmation_attempts

          sig { returns(T.nilable(Time)) }
          attr_reader :confirmation_checked_at

          sig { params(confirmation_checked_at: Time).void }
          attr_writer :confirmation_checked_at

          sig { returns(T.nilable(Time)) }
          attr_reader :confirmed_at

          sig { params(confirmed_at: Time).void }
          attr_writer :confirmed_at

          sig { returns(T.nilable(Time)) }
          attr_reader :created_at

          sig { params(created_at: Time).void }
          attr_writer :created_at

          # Structured recovery context for a failed write.
          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :details

          sig { params(details: T::Hash[Symbol, T.anything]).void }
          attr_writer :details

          sig { returns(T.nilable(String)) }
          attr_reader :error

          sig { params(error: String).void }
          attr_writer :error

          # Deadline for resolving a non-terminal write. This is not the Idempotency-Key
          # retention deadline.
          sig { returns(T.nilable(Time)) }
          attr_reader :expires_at

          sig { params(expires_at: Time).void }
          attr_writer :expires_at

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :idempotent

          sig { params(idempotent: T::Boolean).void }
          attr_writer :idempotent

          # Media count, kind, size, and billing details when used.
          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :media

          sig { params(media: T::Hash[Symbol, T.anything]).void }
          attr_writer :media

          # Compatibility field for a confirmed media upload ID.
          sig { returns(T.nilable(String)) }
          attr_reader :media_id

          sig { params(media_id: String).void }
          attr_writer :media_id

          # Public media URL when the upload creates one.
          sig { returns(T.nilable(String)) }
          attr_reader :media_url

          sig { params(media_url: String).void }
          attr_writer :media_url

          sig { returns(T.nilable(String)) }
          attr_reader :message

          sig { params(message: String).void }
          attr_writer :message

          # Compatibility field for a confirmed direct message ID.
          sig { returns(T.nilable(String)) }
          attr_reader :message_id

          sig { params(message_id: String).void }
          attr_writer :message_id

          sig { returns(T.nilable(String)) }
          attr_reader :request_hash

          sig { params(request_hash: String).void }
          attr_writer :request_hash

          sig { returns(T.nilable(String)) }
          attr_reader :request_id

          sig { params(request_id: String).void }
          attr_writer :request_id

          # Compatibility result ID for other write actions.
          sig { returns(T.nilable(String)) }
          attr_reader :result_id

          sig { params(result_id: String).void }
          attr_writer :result_id

          # Dispatch timestamp when the write reached execution.
          sig { returns(T.nilable(Time)) }
          attr_reader :send_dispatched_at

          sig { params(send_dispatched_at: Time).void }
          attr_writer :send_dispatched_at

          # Compatibility field for a confirmed tweet result ID.
          sig { returns(T.nilable(String)) }
          attr_reader :tweet_id

          sig { params(tweet_id: String).void }
          attr_writer :tweet_id

          sig { returns(T.nilable(Time)) }
          attr_reader :updated_at

          sig { params(updated_at: Time).void }
          attr_writer :updated_at

          # Durable write lifecycle record. Poll statusUrl until terminal is true. Reusing
          # the original Idempotency-Key returns this same record. Submit a new write only
          # when safeToRetry is true, using a new key.
          sig do
            params(
              id: String,
              account:
                T.nilable(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Account::OrHash
                ),
              action:
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::OrSymbol,
              billing:
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing::OrHash,
              charged: T::Boolean,
              charged_credits: String,
              next_action:
                T.nilable(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::NextAction::OrHash
                ),
              poll_after_ms: T.nilable(Integer),
              request:
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Request::OrHash,
              result:
                T.nilable(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result::OrHash
                ),
              retryable: T::Boolean,
              safe_to_retry: T::Boolean,
              send_dispatched: T::Boolean,
              status:
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Status::OrSymbol,
              status_url: String,
              success: T::Boolean,
              target:
                T.nilable(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Target::OrHash
                ),
              target_id: T.nilable(String),
              terminal: T::Boolean,
              write_action_id: String,
              community_id: String,
              community_name: String,
              completed_at: Time,
              confirmation_attempts: Integer,
              confirmation_checked_at: Time,
              confirmed_at: Time,
              created_at: Time,
              details: T::Hash[Symbol, T.anything],
              error: String,
              expires_at: Time,
              idempotent: T::Boolean,
              media: T::Hash[Symbol, T.anything],
              media_id: String,
              media_url: String,
              message: String,
              message_id: String,
              request_hash: String,
              request_id: String,
              result_id: String,
              send_dispatched_at: Time,
              tweet_id: String,
              updated_at: Time,
              object: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            # Connected account selected for the write.
            account:,
            action:,
            # plannedCredits is the approved maximum. chargedCredits comes from the settled
            # credit ledger. Pending or failed writes are not charged.
            billing:,
            charged:,
            charged_credits:,
            # Exact follow-up an API client or agent should perform.
            next_action:,
            poll_after_ms:,
            # Stable fingerprint and sanitized payload for replay checks.
            request:,
            # Confirmed result produced by the write, when available.
            result:,
            # True only when a new attempt can reasonably succeed.
            retryable:,
            # True only when no write was dispatched and a new idempotency key may be used.
            safe_to_retry:,
            send_dispatched:,
            status:,
            status_url:,
            success:,
            # Existing X resource targeted by the write, when applicable.
            target:,
            target_id:,
            terminal:,
            write_action_id:,
            # Compatibility field for a confirmed community ID.
            community_id: nil,
            # Confirmed community name when available.
            community_name: nil,
            completed_at: nil,
            confirmation_attempts: nil,
            confirmation_checked_at: nil,
            confirmed_at: nil,
            created_at: nil,
            # Structured recovery context for a failed write.
            details: nil,
            error: nil,
            # Deadline for resolving a non-terminal write. This is not the Idempotency-Key
            # retention deadline.
            expires_at: nil,
            idempotent: nil,
            # Media count, kind, size, and billing details when used.
            media: nil,
            # Compatibility field for a confirmed media upload ID.
            media_id: nil,
            # Public media URL when the upload creates one.
            media_url: nil,
            message: nil,
            # Compatibility field for a confirmed direct message ID.
            message_id: nil,
            request_hash: nil,
            request_id: nil,
            # Compatibility result ID for other write actions.
            result_id: nil,
            # Dispatch timestamp when the write reached execution.
            send_dispatched_at: nil,
            # Compatibility field for a confirmed tweet result ID.
            tweet_id: nil,
            updated_at: nil,
            object: :x_write_action
          )
          end

          sig do
            override.returns(
              {
                id: String,
                account:
                  T.nilable(
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Account
                  ),
                action:
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol,
                billing:
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing,
                charged: T::Boolean,
                charged_credits: String,
                next_action:
                  T.nilable(
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::NextAction
                  ),
                object: Symbol,
                poll_after_ms: T.nilable(Integer),
                request:
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Request,
                result:
                  T.nilable(
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result
                  ),
                retryable: T::Boolean,
                safe_to_retry: T::Boolean,
                send_dispatched: T::Boolean,
                status:
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Status::TaggedSymbol,
                status_url: String,
                success: T::Boolean,
                target:
                  T.nilable(
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Target
                  ),
                target_id: T.nilable(String),
                terminal: T::Boolean,
                write_action_id: String,
                community_id: String,
                community_name: String,
                completed_at: Time,
                confirmation_attempts: Integer,
                confirmation_checked_at: Time,
                confirmed_at: Time,
                created_at: Time,
                details: T::Hash[Symbol, T.anything],
                error: String,
                expires_at: Time,
                idempotent: T::Boolean,
                media: T::Hash[Symbol, T.anything],
                media_id: String,
                media_url: String,
                message: String,
                message_id: String,
                request_hash: String,
                request_id: String,
                result_id: String,
                send_dispatched_at: Time,
                tweet_id: String,
                updated_at: Time
              }
            )
          end
          def to_hash
          end

          class Account < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Account,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :id

            sig { returns(String) }
            attr_accessor :username

            # Connected account selected for the write.
            sig do
              params(id: String, username: String).returns(T.attached_class)
            end
            def self.new(id:, username:)
            end

            sig { override.returns({ id: String, username: String }) }
            def to_hash
            end
          end

          module Action
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CREATE_TWEET =
              T.let(
                :create_tweet,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            DELETE_TWEET =
              T.let(
                :delete_tweet,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            LIKE =
              T.let(
                :like,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            UNLIKE =
              T.let(
                :unlike,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            RETWEET =
              T.let(
                :retweet,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            UNRETWEET =
              T.let(
                :unretweet,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            FOLLOW =
              T.let(
                :follow,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            UNFOLLOW =
              T.let(
                :unfollow,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            REMOVE_FOLLOWER =
              T.let(
                :remove_follower,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            SEND_DM =
              T.let(
                :send_dm,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            UPLOAD_MEDIA =
              T.let(
                :upload_media,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            UPDATE_PROFILE =
              T.let(
                :update_profile,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            UPDATE_AVATAR =
              T.let(
                :update_avatar,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            UPDATE_BANNER =
              T.let(
                :update_banner,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            CREATE_COMMUNITY =
              T.let(
                :create_community,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            DELETE_COMMUNITY =
              T.let(
                :delete_community,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            JOIN_COMMUNITY =
              T.let(
                :join_community,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )
            LEAVE_COMMUNITY =
              T.let(
                :leave_community,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Action::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Billing < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(T::Boolean) }
            attr_accessor :charged

            sig { returns(String) }
            attr_accessor :charged_credits

            sig { returns(String) }
            attr_accessor :planned_credits

            sig do
              returns(
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing::Status::TaggedSymbol
              )
            end
            attr_accessor :status

            # plannedCredits is the approved maximum. chargedCredits comes from the settled
            # credit ledger. Pending or failed writes are not charged.
            sig do
              params(
                charged: T::Boolean,
                charged_credits: String,
                planned_credits: String,
                status:
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing::Status::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(charged:, charged_credits:, planned_credits:, status:)
            end

            sig do
              override.returns(
                {
                  charged: T::Boolean,
                  charged_credits: String,
                  planned_credits: String,
                  status:
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing::Status::TaggedSymbol
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
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing::Status
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              NOT_CHARGED =
                T.let(
                  :not_charged,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing::Status::TaggedSymbol
                )
              PENDING =
                T.let(
                  :pending,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing::Status::TaggedSymbol
                )
              CHARGED =
                T.let(
                  :charged,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing::Status::TaggedSymbol
                )
              CHARGE_FAILED =
                T.let(
                  :charge_failed,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing::Status::TaggedSymbol
                )
              REFUNDED =
                T.let(
                  :refunded,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing::Status::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Billing::Status::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class NextAction < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::NextAction,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig do
              returns(
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::NextAction::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            sig { returns(T.nilable(Integer)) }
            attr_reader :after_ms

            sig { params(after_ms: Integer).void }
            attr_writer :after_ms

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :requires_new_idempotency_key

            sig { params(requires_new_idempotency_key: T::Boolean).void }
            attr_writer :requires_new_idempotency_key

            sig { returns(T.nilable(String)) }
            attr_reader :url

            sig { params(url: String).void }
            attr_writer :url

            # Exact follow-up an API client or agent should perform.
            sig do
              params(
                type:
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::NextAction::Type::OrSymbol,
                after_ms: Integer,
                requires_new_idempotency_key: T::Boolean,
                url: String
              ).returns(T.attached_class)
            end
            def self.new(
              type:,
              after_ms: nil,
              requires_new_idempotency_key: nil,
              url: nil
            )
            end

            sig do
              override.returns(
                {
                  type:
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::NextAction::Type::TaggedSymbol,
                  after_ms: Integer,
                  requires_new_idempotency_key: T::Boolean,
                  url: String
                }
              )
            end
            def to_hash
            end

            module Type
              extend XTwitterScraper::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::NextAction::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              POLL =
                T.let(
                  :poll,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::NextAction::Type::TaggedSymbol
                )
              RETRY =
                T.let(
                  :retry,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::NextAction::Type::TaggedSymbol
                )
              VERIFY_RESULT =
                T.let(
                  :verify_result,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::NextAction::Type::TaggedSymbol
                )
              FIX_REQUEST =
                T.let(
                  :fix_request,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::NextAction::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::NextAction::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Request < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Request,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # Stable hash of account, action, target, and payload.
            sig { returns(T.nilable(String)) }
            attr_accessor :hash_

            # Exact sanitized payload dispatched for this action.
            sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
            attr_accessor :payload

            # Stable fingerprint and sanitized payload for replay checks.
            sig do
              params(
                hash_: T.nilable(String),
                payload: T.nilable(T::Hash[Symbol, T.anything])
              ).returns(T.attached_class)
            end
            def self.new(
              # Stable hash of account, action, target, and payload.
              hash_:,
              # Exact sanitized payload dispatched for this action.
              payload:
            )
            end

            sig do
              override.returns(
                {
                  hash_: T.nilable(String),
                  payload: T.nilable(T::Hash[Symbol, T.anything])
                }
              )
            end
            def to_hash
            end
          end

          class Result < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :id

            sig { params(id: String).void }
            attr_writer :id

            sig { returns(T.nilable(String)) }
            attr_reader :state

            sig { params(state: String).void }
            attr_writer :state

            sig do
              returns(
                T.nilable(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result::Type::TaggedSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result::Type::OrSymbol
              ).void
            end
            attr_writer :type

            # Confirmed result produced by the write, when available.
            sig do
              params(
                id: String,
                state: String,
                type:
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(id: nil, state: nil, type: nil)
            end

            sig do
              override.returns(
                {
                  id: String,
                  state: String,
                  type:
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result::Type::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            module Type
              extend XTwitterScraper::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              TWEET =
                T.let(
                  :tweet,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result::Type::TaggedSymbol
                )
              DIRECT_MESSAGE =
                T.let(
                  :direct_message,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result::Type::TaggedSymbol
                )
              MEDIA =
                T.let(
                  :media,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result::Type::TaggedSymbol
                )
              COMMUNITY =
                T.let(
                  :community,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result::Type::TaggedSymbol
                )
              STATE_CHANGE =
                T.let(
                  :state_change,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Result::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          module Status
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACCEPTED =
              T.let(
                :accepted,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Status::TaggedSymbol
              )
            DISPATCHING =
              T.let(
                :dispatching,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Status::TaggedSymbol
              )
            PENDING_CONFIRMATION =
              T.let(
                :pending_confirmation,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Status::TaggedSymbol
              )
            SUCCESS =
              T.let(
                :success,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Status::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Status::TaggedSymbol
              )
            EXPIRED =
              T.let(
                :expired,
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Target < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Target,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :id

            sig do
              returns(
                XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Target::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            # Existing X resource targeted by the write, when applicable.
            sig do
              params(
                id: String,
                type:
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Target::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(id:, type:)
            end

            sig do
              override.returns(
                {
                  id: String,
                  type:
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Target::Type::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            module Type
              extend XTwitterScraper::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Target::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              TWEET =
                T.let(
                  :tweet,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Target::Type::TaggedSymbol
                )
              USER =
                T.let(
                  :user,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Target::Type::TaggedSymbol
                )
              COMMUNITY =
                T.let(
                  :community,
                  XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Target::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse::Target::Type::TaggedSymbol
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
end
