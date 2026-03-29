# typed: strong

module XTwitterScraper
  module Models
    module Bot
      class PlatformLinkCreateResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Bot::PlatformLinkCreateResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :platform

        sig { returns(String) }
        attr_accessor :platform_user_id

        sig do
          params(
            id: String,
            created_at: Time,
            platform: String,
            platform_user_id: String
          ).returns(T.attached_class)
        end
        def self.new(id:, created_at:, platform:, platform_user_id:)
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              platform: String,
              platform_user_id: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
