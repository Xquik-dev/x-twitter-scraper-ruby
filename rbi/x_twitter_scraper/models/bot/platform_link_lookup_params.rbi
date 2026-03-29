# typed: strong

module XTwitterScraper
  module Models
    module Bot
      class PlatformLinkLookupParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Bot::PlatformLinkLookupParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :platform

        sig { returns(String) }
        attr_accessor :platform_user_id

        sig do
          params(
            platform: String,
            platform_user_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(platform:, platform_user_id:, request_options: {})
        end

        sig do
          override.returns(
            {
              platform: String,
              platform_user_id: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
