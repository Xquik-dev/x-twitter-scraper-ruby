# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Dm
        # Get DM conversation history
        sig do
          params(
            user_id: String,
            cursor: String,
            max_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::DmRetrieveHistoryResponse)
        end
        def retrieve_history(
          # Target user ID
          user_id,
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
            media_ids: T::Array[String],
            reply_to_message_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::DmSendResponse)
        end
        def send_(
          # Recipient user ID
          user_id,
          # X account (@username or ID) sending the DM
          account:,
          text:,
          media_ids: nil,
          reply_to_message_id: nil,
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
