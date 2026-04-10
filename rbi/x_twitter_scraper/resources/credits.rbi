# typed: strong

module XTwitterScraper
  module Resources
    # Subscription, billing, and credits
    class Credits
      # Get credits balance
      sig do
        params(
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::CreditRetrieveBalanceResponse)
      end
      def retrieve_balance(request_options: {})
      end

      # Top up credits balance
      sig do
        params(
          amount: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::CreditTopupBalanceResponse)
      end
      def topup_balance(
        # Amount to top up in credits
        amount:,
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
