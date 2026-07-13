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

        # Public media URL for tweet `media` arrays.
        sig { returns(String) }
        attr_accessor :media_url

        sig { returns(T::Boolean) }
        attr_accessor :success

        sig do
          params(
            media_id: String,
            media_url: String,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          media_id:,
          # Public media URL for tweet `media` arrays.
          media_url:,
          success: true
        )
        end

        sig do
          override.returns(
            { media_id: String, media_url: String, success: T::Boolean }
          )
        end
        def to_hash
        end
      end
    end
  end
end
