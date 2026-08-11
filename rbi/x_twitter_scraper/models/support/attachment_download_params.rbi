# typed: strong

module XTwitterScraper
  module Models
    module Support
      class AttachmentDownloadParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Support::AttachmentDownloadParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.nilable(String)) }
        attr_reader :range

        sig { params(range: String).void }
        attr_writer :range

        sig do
          params(
            id: String,
            range: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(id:, range: nil, request_options: {})
        end

        sig do
          override.returns(
            {
              id: String,
              range: String,
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
