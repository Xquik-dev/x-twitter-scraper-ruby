# typed: strong

module XTwitterScraper
  module Models
    class BotTrackUsageParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::BotTrackUsageParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :input_tokens

      sig { returns(Integer) }
      attr_accessor :output_tokens

      sig { returns(String) }
      attr_accessor :platform_user_id

      sig do
        params(
          input_tokens: Integer,
          output_tokens: Integer,
          platform_user_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        input_tokens:,
        output_tokens:,
        platform_user_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            input_tokens: Integer,
            output_tokens: Integer,
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
