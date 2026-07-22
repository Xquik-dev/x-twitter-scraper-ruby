# typed: strong

module XTwitterScraper
  module Resources
    # Subscription, billing, and credits
    class Credits
      # Redirect to an active top-up payment page
      sig do
        params(
          session_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).void
      end
      def redirect_topup_checkout(
        # Billing session ID returned by the top-up billing flow.
        session_id:,
        request_options: {}
      )
      end

      # Get credits balance
      sig do
        params(
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::CreditRetrieveBalanceResponse)
      end
      def retrieve_balance(request_options: {})
      end

      # Get top-up billing status
      sig do
        params(
          session_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::CreditRetrieveTopupStatusResponse)
      end
      def retrieve_topup_status(
        # Top-up session ID to inspect.
        session_id:,
        request_options: {}
      )
      end

      # Create a Stripe Checkout session only after the user confirms. The request never
      # completes payment or adds credits by itself.
      sig do
        params(
          dollars: Integer,
          locale: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::CreditTopupBalanceResponse)
      end
      def topup_balance(
        # Amount to top up in US dollars. Minimum 10.
        dollars:,
        # Optional checkout locale. Defaults to en.
        locale: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: XTwitterScraper::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
