# typed: strong

module XTwitterScraper
  module Models
    module X
      class MediaUploadResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::MediaUploadResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :media_id

        sig { returns(T::Boolean) }
        attr_accessor :success

        sig do
          params(media_id: String, success: T::Boolean).returns(
            T.attached_class
          )
        end
        def self.new(media_id:, success: true)
        end

        sig { override.returns({ media_id: String, success: T::Boolean }) }
        def to_hash
        end
      end
    end
  end
end
