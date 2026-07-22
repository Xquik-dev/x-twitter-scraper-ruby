# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Dm
        # Get DM conversation history
        sig do
          params(
            user_id: String,
            account: String,
            cursor: String,
            max_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::DmRetrieveHistoryResponse)
        end
        def retrieve_history(
          # Target user ID
          user_id,
          # X handle (without the `@` prefix) of the connected X account used to read the
          # conversation. The account must be a participant in the conversation.
          account:,
          # Pagination cursor for DM history
          cursor: nil,
          # Legacy pagination cursor (backward compat)
          max_id: nil,
          request_options: {}
        )
        end

        # Send direct message
        sig do
          params(
            user_id: String,
            account: String,
            text: String,
            idempotency_key: String,
            media_ids: T::Array[String],
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::DmSendResponse)
        end
        def send_(
          # Path param: Recipient user ID
          user_id,
          # Body param: X account (@username or ID) sending the DM
          account:,
          # Body param
          text:,
          # Header param: Generate one unique value for each intended write. Reuse it only
          # when retrying the exact same account, action, target, and payload. A reused key
          # returns the original action. Reusing it with different input returns 409. Replay
          # protection remains active for at least 90 days.
          idempotency_key:,
          # Body param: Optional array containing exactly 1 uploaded media ID.
          media_ids: nil,
          request_options: {}
        )
        end

        # @api private
        sig do
          params(client: XTwitterScraper::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
