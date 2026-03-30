# typed: strong

module XTwitterScraper
  module Resources
    class X
      # X write actions (tweets, likes, follows, DMs)
      class Profile
        # Update X profile
        sig do
          params(
            account: String,
            description: String,
            location: String,
            name: String,
            url: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::ProfileUpdateResponse)
        end
        def update(
          # X account (@username or account ID)
          account:,
          # Bio description
          description: nil,
          location: nil,
          # Display name
          name: nil,
          # Website URL
          url: nil,
          request_options: {}
        )
        end

        # Update profile avatar
        sig do
          params(
            account: String,
            file: XTwitterScraper::Internal::FileInput,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::ProfileUpdateAvatarResponse)
        end
        def update_avatar(
          # X account (@username or account ID)
          account:,
          # Avatar image (max 716KB)
          file:,
          request_options: {}
        )
        end

        # Update profile banner
        sig do
          params(
            account: String,
            file: XTwitterScraper::Internal::FileInput,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::ProfileUpdateBannerResponse)
        end
        def update_banner(
          # X account (@username or account ID)
          account:,
          # Banner image (max 2MB)
          file:,
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
