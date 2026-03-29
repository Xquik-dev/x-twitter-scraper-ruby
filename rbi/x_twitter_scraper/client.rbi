# typed: strong

module XTwitterScraper
  class Client < XTwitterScraper::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(T.nilable(String)) }
    attr_reader :api_key

    # OAuth 2.1 access token
    sig { returns(T.nilable(String)) }
    attr_reader :bearer_token

    # Account info & settings
    sig { returns(XTwitterScraper::Resources::Account) }
    attr_reader :account

    # API key management (session auth only)
    sig { returns(XTwitterScraper::Resources::APIKeys) }
    attr_reader :api_keys

    # Subscription & billing
    sig { returns(XTwitterScraper::Resources::Subscribe) }
    attr_reader :subscribe

    # Tweet composition, drafts, writing styles & radar
    sig { returns(XTwitterScraper::Resources::Compose) }
    attr_reader :compose

    # Tweet composition, drafts, writing styles & radar
    sig { returns(XTwitterScraper::Resources::Drafts) }
    attr_reader :drafts

    # Tweet composition, drafts, writing styles & radar
    sig { returns(XTwitterScraper::Resources::Styles) }
    attr_reader :styles

    # Tweet composition, drafts, writing styles & radar
    sig { returns(XTwitterScraper::Resources::Radar) }
    attr_reader :radar

    # Real-time X account monitoring
    sig { returns(XTwitterScraper::Resources::Monitors) }
    attr_reader :monitors

    # Activity events from monitored accounts
    sig { returns(XTwitterScraper::Resources::Events) }
    attr_reader :events

    # Bulk data extraction (20 tool types)
    sig { returns(XTwitterScraper::Resources::Extractions) }
    attr_reader :extractions

    # Giveaway draws from tweet replies
    sig { returns(XTwitterScraper::Resources::Draws) }
    attr_reader :draws

    # Webhook endpoint management & delivery
    sig { returns(XTwitterScraper::Resources::Webhooks) }
    attr_reader :webhooks

    # Push notification integrations (Telegram)
    sig { returns(XTwitterScraper::Resources::Integrations) }
    attr_reader :integrations

    # X data lookups (subscription required)
    sig { returns(XTwitterScraper::Resources::X) }
    attr_reader :x

    # Trending topics by region
    sig { returns(XTwitterScraper::Resources::Trends) }
    attr_reader :trends

    # Telegram bot service endpoints
    sig { returns(XTwitterScraper::Resources::Bot) }
    attr_reader :bot

    sig { returns(XTwitterScraper::Resources::Support) }
    attr_reader :support

    # Subscription & billing
    sig { returns(XTwitterScraper::Resources::Credits) }
    attr_reader :credits

    # @api private
    sig do
      override
        .params(
          security: {
            auth_api_key: T::Boolean,
            oauth_bearer: T::Boolean
          }
        )
        .returns(T::Hash[String, String])
    end
    private def auth_headers(security:)
    end

    # @api private
    sig { returns(T::Hash[String, String]) }
    private def auth_api_key
    end

    # @api private
    sig { returns(T::Hash[String, String]) }
    private def oauth_bearer
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        bearer_token: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Defaults to `ENV["X_TWITTER_SCRAPER_API_KEY"]`
      api_key: ENV["X_TWITTER_SCRAPER_API_KEY"],
      # OAuth 2.1 access token Defaults to `ENV["X_TWITTER_SCRAPER_BEARER_TOKEN"]`
      bearer_token: ENV["X_TWITTER_SCRAPER_BEARER_TOKEN"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["X_TWITTER_SCRAPER_BASE_URL"]`
      base_url: ENV["X_TWITTER_SCRAPER_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: XTwitterScraper::Client::DEFAULT_MAX_RETRIES,
      timeout: XTwitterScraper::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: XTwitterScraper::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: XTwitterScraper::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
