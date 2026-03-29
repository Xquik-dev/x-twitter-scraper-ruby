# typed: strong

module XTwitterScraper
  module Models
    class AccountSetXUsernameParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::AccountSetXUsernameParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X username without @
      sig { returns(String) }
      attr_accessor :username

      sig do
        params(
          username: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # X username without @
        username:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { username: String, request_options: XTwitterScraper::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
