# typed: strong

module XTwitterScraper
  module Models
    module X
      class MediaUploadParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::MediaUploadParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # X account (@username or account ID)
        sig { returns(String) }
        attr_accessor :account

        # Media file to upload
        sig { returns(XTwitterScraper::Internal::FileInput) }
        attr_accessor :file

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_long_video

        sig { params(is_long_video: T::Boolean).void }
        attr_writer :is_long_video

        sig do
          params(
            account: String,
            file: XTwitterScraper::Internal::FileInput,
            is_long_video: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # X account (@username or account ID)
          account:,
          # Media file to upload
          file:,
          is_long_video: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account: String,
              file: XTwitterScraper::Internal::FileInput,
              is_long_video: T::Boolean,
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
