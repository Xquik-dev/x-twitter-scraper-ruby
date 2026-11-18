# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ActivityRecord < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ActivityRecord,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig do
        returns(
          XTwitterScraper::Models::ActivityRecord::ObjectItem::TaggedSymbol
        )
      end
      attr_reader :object

      sig do
        params(
          object: XTwitterScraper::Models::ActivityRecord::ObjectItem::OrSymbol
        ).void
      end
      attr_writer :object

      # Activity ID.
      sig { returns(String) }
      attr_accessor :id

      # Kind of the activity. Only a signed-in dashboard session sees an `api_key`
      # record.
      sig do
        returns(XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol)
      end
      attr_reader :kind

      sig do
        params(
          kind: XTwitterScraper::Models::ActivityRecord::Kind::OrSymbol
        ).void
      end
      attr_writer :kind

      # Type of the activity within its kind, the same as the type of its Activity log
      # row. Examples are a write action type, an extraction tool type, a monitor
      # change, a monitor event type or a ledger entry type.
      sig { returns(String) }
      attr_accessor :type

      sig do
        returns(XTwitterScraper::Models::ActivityRecord::Status::TaggedSymbol)
      end
      attr_reader :status

      sig do
        params(
          status: XTwitterScraper::Models::ActivityRecord::Status::OrSymbol
        ).void
      end
      attr_writer :status

      # Dashboard page of this activity.
      sig { returns(String) }
      attr_accessor :url

      # ID of the API request behind this activity.
      sig { returns(T.nilable(String)) }
      attr_accessor :request_id

      sig { returns(XTwitterScraper::Models::ActivityRecord::Timestamps) }
      attr_reader :timestamps

      sig do
        params(
          timestamps:
            XTwitterScraper::Models::ActivityRecord::Timestamps::OrHash
        ).void
      end
      attr_writer :timestamps

      # The API request behind this activity. Null for activity from before Oct 30,
      # 2026, and for activity no API request starts, such as a monitor event, a webhook
      # delivery or a credit grant.
      sig do
        returns(T.nilable(XTwitterScraper::Models::ActivityRecord::Request))
      end
      attr_reader :request

      sig do
        params(
          request:
            T.nilable(XTwitterScraper::Models::ActivityRecord::Request::OrHash)
        ).void
      end
      attr_writer :request

      sig { returns(XTwitterScraper::Models::ActivityRecord::Caller) }
      attr_reader :caller_

      sig do
        params(
          caller_: XTwitterScraper::Models::ActivityRecord::Caller::OrHash
        ).void
      end
      attr_writer :caller_

      # Credits charged for this activity.
      sig do
        returns(T.nilable(XTwitterScraper::Models::ActivityRecord::Charge))
      end
      attr_reader :charge

      sig do
        params(
          charge:
            T.nilable(XTwitterScraper::Models::ActivityRecord::Charge::OrHash)
        ).void
      end
      attr_writer :charge

      # Fields of this kind of activity, such as its target. A field can hold JSON, such
      # as the data of a monitor event or the payload of a webhook delivery.
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :details

      # Up to 5 other activities on the same subject within 7 days, newest first.
      sig do
        returns(T::Array[XTwitterScraper::Models::ActivityRecord::Related])
      end
      attr_reader :related

      sig do
        params(
          related:
            T::Array[XTwitterScraper::Models::ActivityRecord::Related::OrHash]
        ).void
      end
      attr_writer :related

      sig do
        params(
          object: XTwitterScraper::Models::ActivityRecord::ObjectItem::OrSymbol,
          id: String,
          kind: XTwitterScraper::Models::ActivityRecord::Kind::OrSymbol,
          type: String,
          status: XTwitterScraper::Models::ActivityRecord::Status::OrSymbol,
          url: String,
          request_id: T.nilable(String),
          timestamps:
            XTwitterScraper::Models::ActivityRecord::Timestamps::OrHash,
          request:
            T.nilable(XTwitterScraper::Models::ActivityRecord::Request::OrHash),
          caller_: XTwitterScraper::Models::ActivityRecord::Caller::OrHash,
          charge:
            T.nilable(XTwitterScraper::Models::ActivityRecord::Charge::OrHash),
          details: T::Hash[Symbol, T.anything],
          related:
            T::Array[XTwitterScraper::Models::ActivityRecord::Related::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        object:,
        # Activity ID.
        id:,
        # Kind of the activity. Only a signed-in dashboard session sees an `api_key`
        # record.
        kind:,
        # Type of the activity within its kind, the same as the type of its Activity log
        # row. Examples are a write action type, an extraction tool type, a monitor
        # change, a monitor event type or a ledger entry type.
        type:,
        status:,
        # Dashboard page of this activity.
        url:,
        # ID of the API request behind this activity.
        request_id:,
        timestamps:,
        # The API request behind this activity. Null for activity from before Oct 30,
        # 2026, and for activity no API request starts, such as a monitor event, a webhook
        # delivery or a credit grant.
        request:,
        caller_:,
        # Credits charged for this activity.
        charge:,
        # Fields of this kind of activity, such as its target. A field can hold JSON, such
        # as the data of a monitor event or the payload of a webhook delivery.
        details:,
        # Up to 5 other activities on the same subject within 7 days, newest first.
        related:
      )
      end

      sig do
        override.returns(
          {
            object:
              XTwitterScraper::Models::ActivityRecord::ObjectItem::TaggedSymbol,
            id: String,
            kind: XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol,
            type: String,
            status:
              XTwitterScraper::Models::ActivityRecord::Status::TaggedSymbol,
            url: String,
            request_id: T.nilable(String),
            timestamps: XTwitterScraper::Models::ActivityRecord::Timestamps,
            request:
              T.nilable(XTwitterScraper::Models::ActivityRecord::Request),
            caller_: XTwitterScraper::Models::ActivityRecord::Caller,
            charge: T.nilable(XTwitterScraper::Models::ActivityRecord::Charge),
            details: T::Hash[Symbol, T.anything],
            related: T::Array[XTwitterScraper::Models::ActivityRecord::Related]
          }
        )
      end
      def to_hash
      end

      module ObjectItem
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::ActivityRecord::ObjectItem)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVITY =
          T.let(
            :activity,
            XTwitterScraper::Models::ActivityRecord::ObjectItem::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::ActivityRecord::ObjectItem::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Kind of the activity. Only a signed-in dashboard session sees an `api_key`
      # record.
      module Kind
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::ActivityRecord::Kind)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WRITE_ACTION =
          T.let(
            :write_action,
            XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol
          )
        EXTRACTION =
          T.let(
            :extraction,
            XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol
          )
        MONITOR_CHANGE =
          T.let(
            :monitor_change,
            XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol
          )
        API_KEY =
          T.let(
            :api_key,
            XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol
          )
        BILLING =
          T.let(
            :billing,
            XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol
          )
        GIVEAWAY_DRAW =
          T.let(
            :giveaway_draw,
            XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol
          )
        MONITOR_EVENT =
          T.let(
            :monitor_event,
            XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol
          )
        MEDIA_DOWNLOAD =
          T.let(
            :media_download,
            XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol
          )
        MEDIA_SHARE =
          T.let(
            :media_share,
            XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol
          )
        SUPPORT_TICKET =
          T.let(
            :support_ticket,
            XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol
          )
        WEBHOOK_DELIVERY =
          T.let(
            :webhook_delivery,
            XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol
          )
        WEBHOOK_ENDPOINT =
          T.let(
            :webhook_endpoint,
            XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol
          )
        X_ACCOUNT_CONNECTION =
          T.let(
            :x_account_connection,
            XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::ActivityRecord::Kind::TaggedSymbol
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
            T.all(Symbol, XTwitterScraper::Models::ActivityRecord::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COMPLETED =
          T.let(
            :completed,
            XTwitterScraper::Models::ActivityRecord::Status::TaggedSymbol
          )
        RUNNING =
          T.let(
            :running,
            XTwitterScraper::Models::ActivityRecord::Status::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            XTwitterScraper::Models::ActivityRecord::Status::TaggedSymbol
          )
        CANCELED =
          T.let(
            :canceled,
            XTwitterScraper::Models::ActivityRecord::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::ActivityRecord::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Timestamps < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::ActivityRecord::Timestamps,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(T.nilable(Time)) }
        attr_reader :updated_at

        sig { params(updated_at: Time).void }
        attr_writer :updated_at

        sig { returns(T.nilable(Time)) }
        attr_reader :completed_at

        sig { params(completed_at: Time).void }
        attr_writer :completed_at

        sig { returns(T.nilable(Time)) }
        attr_reader :confirmed_at

        sig { params(confirmed_at: Time).void }
        attr_writer :confirmed_at

        sig { returns(T.nilable(Time)) }
        attr_reader :expires_at

        sig { params(expires_at: Time).void }
        attr_writer :expires_at

        sig { returns(T.nilable(Time)) }
        attr_reader :occurred_at

        sig { params(occurred_at: Time).void }
        attr_writer :occurred_at

        sig { returns(T.nilable(Time)) }
        attr_reader :discovered_at

        sig { params(discovered_at: Time).void }
        attr_writer :discovered_at

        sig { returns(T.nilable(Time)) }
        attr_reader :posted_at

        sig { params(posted_at: Time).void }
        attr_writer :posted_at

        sig { returns(T.nilable(Time)) }
        attr_reader :first_attempted_at

        sig { params(first_attempted_at: Time).void }
        attr_writer :first_attempted_at

        sig { returns(T.nilable(Time)) }
        attr_reader :delivered_at

        sig { params(delivered_at: Time).void }
        attr_writer :delivered_at

        sig { returns(T.nilable(Time)) }
        attr_reader :next_retry_at

        sig { params(next_retry_at: Time).void }
        attr_writer :next_retry_at

        sig { returns(T.nilable(Time)) }
        attr_reader :exhausted_at

        sig { params(exhausted_at: Time).void }
        attr_writer :exhausted_at

        sig { returns(T.nilable(Time)) }
        attr_reader :drawn_at

        sig { params(drawn_at: Time).void }
        attr_writer :drawn_at

        sig { returns(T.nilable(Time)) }
        attr_reader :last_used_at

        sig { params(last_used_at: Time).void }
        attr_writer :last_used_at

        sig { returns(T.nilable(Time)) }
        attr_reader :paused_at

        sig { params(paused_at: Time).void }
        attr_writer :paused_at

        sig do
          params(
            created_at: Time,
            updated_at: Time,
            completed_at: Time,
            confirmed_at: Time,
            expires_at: Time,
            occurred_at: Time,
            discovered_at: Time,
            posted_at: Time,
            first_attempted_at: Time,
            delivered_at: Time,
            next_retry_at: Time,
            exhausted_at: Time,
            drawn_at: Time,
            last_used_at: Time,
            paused_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          created_at:,
          updated_at: nil,
          completed_at: nil,
          confirmed_at: nil,
          expires_at: nil,
          occurred_at: nil,
          discovered_at: nil,
          posted_at: nil,
          first_attempted_at: nil,
          delivered_at: nil,
          next_retry_at: nil,
          exhausted_at: nil,
          drawn_at: nil,
          last_used_at: nil,
          paused_at: nil
        )
        end

        sig do
          override.returns(
            {
              created_at: Time,
              updated_at: Time,
              completed_at: Time,
              confirmed_at: Time,
              expires_at: Time,
              occurred_at: Time,
              discovered_at: Time,
              posted_at: Time,
              first_attempted_at: Time,
              delivered_at: Time,
              next_retry_at: Time,
              exhausted_at: Time,
              drawn_at: Time,
              last_used_at: Time,
              paused_at: Time
            }
          )
        end
        def to_hash
        end
      end

      class Request < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::ActivityRecord::Request,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            XTwitterScraper::Models::ActivityRecord::Request::Method::TaggedSymbol
          )
        end
        attr_reader :method_

        sig do
          params(
            method_:
              XTwitterScraper::Models::ActivityRecord::Request::Method::OrSymbol
          ).void
        end
        attr_writer :method_

        sig { returns(String) }
        attr_accessor :path

        sig { returns(Integer) }
        attr_accessor :http_status

        sig { returns(Integer) }
        attr_accessor :duration_ms

        sig { returns(T.nilable(String)) }
        attr_accessor :ip_address

        sig { returns(T.nilable(String)) }
        attr_accessor :user_agent

        sig { returns(Time) }
        attr_accessor :at

        sig do
          params(
            method_:
              XTwitterScraper::Models::ActivityRecord::Request::Method::OrSymbol,
            path: String,
            http_status: Integer,
            duration_ms: Integer,
            ip_address: T.nilable(String),
            user_agent: T.nilable(String),
            at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          method_:,
          path:,
          http_status:,
          duration_ms:,
          ip_address:,
          user_agent:,
          at:
        )
        end

        sig do
          override.returns(
            {
              method_:
                XTwitterScraper::Models::ActivityRecord::Request::Method::TaggedSymbol,
              path: String,
              http_status: Integer,
              duration_ms: Integer,
              ip_address: T.nilable(String),
              user_agent: T.nilable(String),
              at: Time
            }
          )
        end
        def to_hash
        end

        module Method
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::ActivityRecord::Request::Method
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DELETE =
            T.let(
              :DELETE,
              XTwitterScraper::Models::ActivityRecord::Request::Method::TaggedSymbol
            )
          PATCH =
            T.let(
              :PATCH,
              XTwitterScraper::Models::ActivityRecord::Request::Method::TaggedSymbol
            )
          POST =
            T.let(
              :POST,
              XTwitterScraper::Models::ActivityRecord::Request::Method::TaggedSymbol
            )
          PUT =
            T.let(
              :PUT,
              XTwitterScraper::Models::ActivityRecord::Request::Method::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::ActivityRecord::Request::Method::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Caller < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::ActivityRecord::Caller,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::ActivityRecord::Caller::AuthMethod::TaggedSymbol
            )
          )
        end
        attr_reader :auth_method

        sig do
          params(
            auth_method:
              T.nilable(
                XTwitterScraper::Models::ActivityRecord::Caller::AuthMethod::OrSymbol
              )
          ).void
        end
        attr_writer :auth_method

        # Name and prefix of the API key used. Never its value.
        sig do
          returns(
            T.nilable(XTwitterScraper::Models::ActivityRecord::Caller::ApiKey)
          )
        end
        attr_reader :api_key

        sig do
          params(
            api_key:
              T.nilable(
                XTwitterScraper::Models::ActivityRecord::Caller::ApiKey::OrHash
              )
          ).void
        end
        attr_writer :api_key

        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::ActivityRecord::Caller::OauthClient
            )
          )
        end
        attr_reader :oauth_client

        sig do
          params(
            oauth_client:
              T.nilable(
                XTwitterScraper::Models::ActivityRecord::Caller::OauthClient::OrHash
              )
          ).void
        end
        attr_writer :oauth_client

        sig do
          params(
            auth_method:
              T.nilable(
                XTwitterScraper::Models::ActivityRecord::Caller::AuthMethod::OrSymbol
              ),
            api_key:
              T.nilable(
                XTwitterScraper::Models::ActivityRecord::Caller::ApiKey::OrHash
              ),
            oauth_client:
              T.nilable(
                XTwitterScraper::Models::ActivityRecord::Caller::OauthClient::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          auth_method:,
          # Name and prefix of the API key used. Never its value.
          api_key:,
          oauth_client:
        )
        end

        sig do
          override.returns(
            {
              auth_method:
                T.nilable(
                  XTwitterScraper::Models::ActivityRecord::Caller::AuthMethod::TaggedSymbol
                ),
              api_key:
                T.nilable(
                  XTwitterScraper::Models::ActivityRecord::Caller::ApiKey
                ),
              oauth_client:
                T.nilable(
                  XTwitterScraper::Models::ActivityRecord::Caller::OauthClient
                )
            }
          )
        end
        def to_hash
        end

        module AuthMethod
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::ActivityRecord::Caller::AuthMethod
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          API_KEY =
            T.let(
              :api_key,
              XTwitterScraper::Models::ActivityRecord::Caller::AuthMethod::TaggedSymbol
            )
          OAUTH =
            T.let(
              :oauth,
              XTwitterScraper::Models::ActivityRecord::Caller::AuthMethod::TaggedSymbol
            )
          SESSION =
            T.let(
              :session,
              XTwitterScraper::Models::ActivityRecord::Caller::AuthMethod::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::ActivityRecord::Caller::AuthMethod::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class ApiKey < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ActivityRecord::Caller::ApiKey,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :name

          sig { returns(String) }
          attr_accessor :prefix

          sig { params(name: String, prefix: String).returns(T.attached_class) }
          def self.new(name:, prefix:)
          end

          sig { override.returns({ name: String, prefix: String }) }
          def to_hash
          end
        end

        class OauthClient < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ActivityRecord::Caller::OauthClient,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :name

          sig { params(id: String, name: String).returns(T.attached_class) }
          def self.new(id:, name:)
          end

          sig { override.returns({ id: String, name: String }) }
          def to_hash
          end
        end
      end

      class Charge < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::ActivityRecord::Charge,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :credits

        sig { returns(Integer) }
        attr_accessor :balance_after

        sig { returns(Time) }
        attr_accessor :at

        sig do
          params(credits: Integer, balance_after: Integer, at: Time).returns(
            T.attached_class
          )
        end
        def self.new(credits:, balance_after:, at:)
        end

        sig do
          override.returns(
            { credits: Integer, balance_after: Integer, at: Time }
          )
        end
        def to_hash
        end
      end

      class Related < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::ActivityRecord::Related,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :type

        sig do
          returns(
            XTwitterScraper::Models::ActivityRecord::Related::Status::TaggedSymbol
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              XTwitterScraper::Models::ActivityRecord::Related::Status::OrSymbol
          ).void
        end
        attr_writer :status

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            id: String,
            type: String,
            status:
              XTwitterScraper::Models::ActivityRecord::Related::Status::OrSymbol,
            created_at: Time,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(id:, type:, status:, created_at:, url:)
        end

        sig do
          override.returns(
            {
              id: String,
              type: String,
              status:
                XTwitterScraper::Models::ActivityRecord::Related::Status::TaggedSymbol,
              created_at: Time,
              url: String
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
                XTwitterScraper::Models::ActivityRecord::Related::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COMPLETED =
            T.let(
              :completed,
              XTwitterScraper::Models::ActivityRecord::Related::Status::TaggedSymbol
            )
          RUNNING =
            T.let(
              :running,
              XTwitterScraper::Models::ActivityRecord::Related::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              XTwitterScraper::Models::ActivityRecord::Related::Status::TaggedSymbol
            )
          CANCELED =
            T.let(
              :canceled,
              XTwitterScraper::Models::ActivityRecord::Related::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::ActivityRecord::Related::Status::TaggedSymbol
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
