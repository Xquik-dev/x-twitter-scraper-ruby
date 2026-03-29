# typed: strong

module XTwitterScraper
  module Models
    module Bot
      class PlatformLinkDeleteParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Bot::PlatformLinkDeleteParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            XTwitterScraper::Bot::PlatformLinkDeleteParams::Platform::OrSymbol
          )
        end
        attr_accessor :platform

        sig { returns(String) }
        attr_accessor :platform_user_id

        sig do
          params(
            platform:
              XTwitterScraper::Bot::PlatformLinkDeleteParams::Platform::OrSymbol,
            platform_user_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(platform:, platform_user_id:, request_options: {})
        end

        sig do
          override.returns(
            {
              platform:
                XTwitterScraper::Bot::PlatformLinkDeleteParams::Platform::OrSymbol,
              platform_user_id: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end

        module Platform
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Bot::PlatformLinkDeleteParams::Platform
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TELEGRAM =
            T.let(
              :telegram,
              XTwitterScraper::Bot::PlatformLinkDeleteParams::Platform::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Bot::PlatformLinkDeleteParams::Platform::TaggedSymbol
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
