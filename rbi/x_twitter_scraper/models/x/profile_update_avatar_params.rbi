# typed: strong

module XTwitterScraper
  module Models
    module X
      class ProfileUpdateAvatarParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::ProfileUpdateAvatarParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # X account (@username or ID) for avatar update
        sig { returns(String) }
        attr_accessor :account

        # Avatar image (max 716KB)
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
          # X account (@username or ID) for avatar update
          account:,
          # Avatar image (max 716KB)
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
