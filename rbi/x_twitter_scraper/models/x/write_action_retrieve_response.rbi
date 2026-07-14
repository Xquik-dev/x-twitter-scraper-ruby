# typed: strong

module XTwitterScraper
  module Models
    module X
      class WriteActionRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::WriteActionRetrieveResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :action

        sig { returns(T::Boolean) }
        attr_accessor :charged

        sig { returns(String) }
        attr_accessor :charged_credits

        sig { returns(Time) }
        attr_accessor :created_at

        sig do
          returns(
            XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media
          )
        end
        attr_reader :media

        sig do
          params(
            media:
              XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media::OrHash
          ).void
        end
        attr_writer :media

        sig { returns(T::Boolean) }
        attr_accessor :retryable

        sig { returns(T::Boolean) }
        attr_accessor :send_dispatched

        sig do
          returns(
            XTwitterScraper::Models::X::WriteActionRetrieveResponse::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig { returns(String) }
        attr_accessor :write_action_id

        sig { returns(T.nilable(Integer)) }
        attr_reader :confirmation_attempts

        sig { params(confirmation_attempts: Integer).void }
        attr_writer :confirmation_attempts

        sig { returns(T.nilable(Time)) }
        attr_reader :confirmation_checked_at

        sig { params(confirmation_checked_at: Time).void }
        attr_writer :confirmation_checked_at

        sig { returns(T.nilable(String)) }
        attr_accessor :confirmation_source

        sig { returns(T.nilable(Time)) }
        attr_reader :confirmed_at

        sig { params(confirmed_at: Time).void }
        attr_writer :confirmed_at

        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        sig { returns(T.nilable(String)) }
        attr_reader :message_id

        sig { params(message_id: String).void }
        attr_writer :message_id

        sig { returns(T.nilable(Time)) }
        attr_reader :send_dispatched_at

        sig { params(send_dispatched_at: Time).void }
        attr_writer :send_dispatched_at

        sig { returns(T.nilable(String)) }
        attr_accessor :target_id

        sig { returns(T.nilable(String)) }
        attr_reader :tweet_id

        sig { params(tweet_id: String).void }
        attr_writer :tweet_id

        sig do
          params(
            action: String,
            charged: T::Boolean,
            charged_credits: String,
            created_at: Time,
            media:
              XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media::OrHash,
            send_dispatched: T::Boolean,
            status:
              XTwitterScraper::Models::X::WriteActionRetrieveResponse::Status::OrSymbol,
            write_action_id: String,
            confirmation_attempts: Integer,
            confirmation_checked_at: Time,
            confirmation_source: T.nilable(String),
            confirmed_at: Time,
            message: String,
            message_id: String,
            send_dispatched_at: Time,
            target_id: T.nilable(String),
            tweet_id: String,
            retryable: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          action:,
          charged:,
          charged_credits:,
          created_at:,
          media:,
          send_dispatched:,
          status:,
          write_action_id:,
          confirmation_attempts: nil,
          confirmation_checked_at: nil,
          confirmation_source: nil,
          confirmed_at: nil,
          message: nil,
          message_id: nil,
          send_dispatched_at: nil,
          target_id: nil,
          tweet_id: nil,
          retryable: false
        )
        end

        sig do
          override.returns(
            {
              action: String,
              charged: T::Boolean,
              charged_credits: String,
              created_at: Time,
              media:
                XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media,
              retryable: T::Boolean,
              send_dispatched: T::Boolean,
              status:
                XTwitterScraper::Models::X::WriteActionRetrieveResponse::Status::TaggedSymbol,
              write_action_id: String,
              confirmation_attempts: Integer,
              confirmation_checked_at: Time,
              confirmation_source: T.nilable(String),
              confirmed_at: Time,
              message: String,
              message_id: String,
              send_dispatched_at: Time,
              target_id: T.nilable(String),
              tweet_id: String
            }
          )
        end
        def to_hash
        end

        class Media < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(Integer) }
          attr_accessor :count

          sig { returns(String) }
          attr_accessor :credits

          sig do
            returns(
              XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media::Kind::TaggedSymbol
            )
          end
          attr_accessor :kind

          sig { returns(String) }
          attr_accessor :total_bytes

          sig do
            params(
              count: Integer,
              credits: String,
              kind:
                XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media::Kind::OrSymbol,
              total_bytes: String
            ).returns(T.attached_class)
          end
          def self.new(count:, credits:, kind:, total_bytes:)
          end

          sig do
            override.returns(
              {
                count: Integer,
                credits: String,
                kind:
                  XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media::Kind::TaggedSymbol,
                total_bytes: String
              }
            )
          end
          def to_hash
          end

          module Kind
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media::Kind
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            NONE =
              T.let(
                :none,
                XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media::Kind::TaggedSymbol
              )
            IMAGE =
              T.let(
                :image,
                XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media::Kind::TaggedSymbol
              )
            VIDEO =
              T.let(
                :video,
                XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media::Kind::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media::Kind::TaggedSymbol
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
                XTwitterScraper::Models::X::WriteActionRetrieveResponse::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :success,
              XTwitterScraper::Models::X::WriteActionRetrieveResponse::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              XTwitterScraper::Models::X::WriteActionRetrieveResponse::Status::TaggedSymbol
            )
          PENDING_CONFIRMATION =
            T.let(
              :pending_confirmation,
              XTwitterScraper::Models::X::WriteActionRetrieveResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::X::WriteActionRetrieveResponse::Status::TaggedSymbol
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
