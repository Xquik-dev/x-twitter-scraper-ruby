# typed: strong

module XTwitterScraper
  module Models
    XAccount = X::XAccount

    module X
      class XAccount < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::XAccount,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        # Derived login/cookie health. `healthy` = cookies valid. `needsReauth` = user
        # must submit fresh credentials. `locked` = X locked the account; unlock on x.com
        # first. `suspended` = X banned the account. `recovering` = past cooldown, will
        # auto-retry on next use. `temporaryIssue` = transient backend problem; retry
        # shortly.
        sig { returns(XTwitterScraper::X::XAccount::Health::TaggedSymbol) }
        attr_accessor :health

        sig { returns(String) }
        attr_accessor :status

        sig { returns(String) }
        attr_accessor :x_user_id

        sig { returns(String) }
        attr_accessor :x_username

        # Linked X account summary with username and connection status.
        sig do
          params(
            id: String,
            created_at: Time,
            health: XTwitterScraper::X::XAccount::Health::OrSymbol,
            status: String,
            x_user_id: String,
            x_username: String
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          # Derived login/cookie health. `healthy` = cookies valid. `needsReauth` = user
          # must submit fresh credentials. `locked` = X locked the account; unlock on x.com
          # first. `suspended` = X banned the account. `recovering` = past cooldown, will
          # auto-retry on next use. `temporaryIssue` = transient backend problem; retry
          # shortly.
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
              health: XTwitterScraper::X::XAccount::Health::TaggedSymbol,
              status: String,
              x_user_id: String,
              x_username: String
            }
          )
        end
        def to_hash
        end

        # Derived login/cookie health. `healthy` = cookies valid. `needsReauth` = user
        # must submit fresh credentials. `locked` = X locked the account; unlock on x.com
        # first. `suspended` = X banned the account. `recovering` = past cooldown, will
        # auto-retry on next use. `temporaryIssue` = transient backend problem; retry
        # shortly.
        module Health
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, XTwitterScraper::X::XAccount::Health) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HEALTHY =
            T.let(:healthy, XTwitterScraper::X::XAccount::Health::TaggedSymbol)
          LOCKED =
            T.let(:locked, XTwitterScraper::X::XAccount::Health::TaggedSymbol)
          NEEDS_REAUTH =
            T.let(
              :needsReauth,
              XTwitterScraper::X::XAccount::Health::TaggedSymbol
            )
          RECOVERING =
            T.let(
              :recovering,
              XTwitterScraper::X::XAccount::Health::TaggedSymbol
            )
          SUSPENDED =
            T.let(
              :suspended,
              XTwitterScraper::X::XAccount::Health::TaggedSymbol
            )
          TEMPORARY_ISSUE =
            T.let(
              :temporaryIssue,
              XTwitterScraper::X::XAccount::Health::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[XTwitterScraper::X::XAccount::Health::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
