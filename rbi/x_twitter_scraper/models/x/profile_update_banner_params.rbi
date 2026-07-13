# typed: strong

module XTwitterScraper
  module Models
    module X
      class ProfileUpdateBannerParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::ProfileUpdateBannerParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # X account (@username or ID) receiving banner from URL
        sig { returns(String) }
        attr_accessor :account

        # HTTPS URL to the banner image to download
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            account: String,
            url: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # X account (@username or ID) receiving banner from URL
          account:,
          # HTTPS URL to the banner image to download
          url:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account: String,
              url: String,
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
