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

        # X account (@username or account ID)
        sig { returns(String) }
        attr_accessor :account

        # Banner image (max 2MB)
        sig { returns(XTwitterScraper::Internal::FileInput) }
        attr_accessor :file

        sig do
          params(
            account: String,
            file: XTwitterScraper::Internal::FileInput,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # X account (@username or account ID)
          account:,
          # Banner image (max 2MB)
          file:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account: String,
              file: XTwitterScraper::Internal::FileInput,
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
