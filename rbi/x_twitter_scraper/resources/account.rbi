# typed: strong

module XTwitterScraper
  module Resources
    # Account info and settings
    class Account
      # Get account info
      sig do
        params(
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::AccountRetrieveResponse)
      end
      def retrieve(request_options: {})
      end

      # Set linked X username
      sig do
        params(
          username: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::AccountSetXUsernameResponse)
      end
      def set_x_username(
        # X username without @
        username:,
        request_options: {}
      )
      end

      # Update account locale
      sig do
        params(
          locale: XTwitterScraper::AccountUpdateLocaleParams::Locale::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::AccountUpdateLocaleResponse)
      end
      def update_locale(locale:, request_options: {})
      end

      # @api private
      sig { params(client: XTwitterScraper::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
