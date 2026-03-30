# frozen_string_literal: true

module XTwitterScraper
  class Client < XTwitterScraper::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # @return [String, nil]
    attr_reader :api_key

    # OAuth 2.1 access token
    # @return [String, nil]
    attr_reader :bearer_token

    # Account info & settings
    # @return [XTwitterScraper::Resources::Account]
    attr_reader :account

    # API key management (session auth only)
    # @return [XTwitterScraper::Resources::APIKeys]
    attr_reader :api_keys

    # Subscription & billing
    # @return [XTwitterScraper::Resources::Subscribe]
    attr_reader :subscribe

    # Tweet composition, drafts, writing styles & radar
    # @return [XTwitterScraper::Resources::Compose]
    attr_reader :compose

    # Tweet composition, drafts, writing styles & radar
    # @return [XTwitterScraper::Resources::Drafts]
    attr_reader :drafts

    # Tweet composition, drafts, writing styles & radar
    # @return [XTwitterScraper::Resources::Styles]
    attr_reader :styles

    # Tweet composition, drafts, writing styles & radar
    # @return [XTwitterScraper::Resources::Radar]
    attr_reader :radar

    # Real-time X account monitoring
    # @return [XTwitterScraper::Resources::Monitors]
    attr_reader :monitors

    # Activity events from monitored accounts
    # @return [XTwitterScraper::Resources::Events]
    attr_reader :events

    # Bulk data extraction (20 tool types)
    # @return [XTwitterScraper::Resources::Extractions]
    attr_reader :extractions

    # Giveaway draws from tweet replies
    # @return [XTwitterScraper::Resources::Draws]
    attr_reader :draws

    # Webhook endpoint management & delivery
    # @return [XTwitterScraper::Resources::Webhooks]
    attr_reader :webhooks

    # Push notification integrations (Telegram)
    # @return [XTwitterScraper::Resources::Integrations]
    attr_reader :integrations

    # X data lookups (subscription required)
    # @return [XTwitterScraper::Resources::X]
    attr_reader :x

    # Trending topics by region
    # @return [XTwitterScraper::Resources::Trends]
    attr_reader :trends

    # @return [XTwitterScraper::Resources::Bot]
    attr_reader :bot

    # @return [XTwitterScraper::Resources::Support]
    attr_reader :support

    # Subscription & billing
    # @return [XTwitterScraper::Resources::Credits]
    attr_reader :credits

    # @api private
    #
    # @param security [Hash{Symbol=>Boolean}]
    #
    # @return [Hash{String=>String}]
    private def auth_headers(security:)
      {auth_api_key:, oauth_bearer:}.slice(*security.keys).values.reduce({}, :merge)
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_api_key
      {"x-api-key" => @api_key}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def oauth_bearer
      return {} if @bearer_token.nil?

      {"authorization" => "Bearer #{@bearer_token}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Defaults to `ENV["X_TWITTER_SCRAPER_API_KEY"]`
    #
    # @param bearer_token [String, nil] OAuth 2.1 access token Defaults to `ENV["X_TWITTER_SCRAPER_BEARER_TOKEN"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["X_TWITTER_SCRAPER_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["X_TWITTER_SCRAPER_API_KEY"],
      bearer_token: ENV["X_TWITTER_SCRAPER_BEARER_TOKEN"],
      base_url: ENV["X_TWITTER_SCRAPER_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://xquik.com/api/v1"

      @api_key = api_key&.to_s
      @bearer_token = bearer_token&.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @account = XTwitterScraper::Resources::Account.new(client: self)
      @api_keys = XTwitterScraper::Resources::APIKeys.new(client: self)
      @subscribe = XTwitterScraper::Resources::Subscribe.new(client: self)
      @compose = XTwitterScraper::Resources::Compose.new(client: self)
      @drafts = XTwitterScraper::Resources::Drafts.new(client: self)
      @styles = XTwitterScraper::Resources::Styles.new(client: self)
      @radar = XTwitterScraper::Resources::Radar.new(client: self)
      @monitors = XTwitterScraper::Resources::Monitors.new(client: self)
      @events = XTwitterScraper::Resources::Events.new(client: self)
      @extractions = XTwitterScraper::Resources::Extractions.new(client: self)
      @draws = XTwitterScraper::Resources::Draws.new(client: self)
      @webhooks = XTwitterScraper::Resources::Webhooks.new(client: self)
      @integrations = XTwitterScraper::Resources::Integrations.new(client: self)
      @x = XTwitterScraper::Resources::X.new(client: self)
      @trends = XTwitterScraper::Resources::Trends.new(client: self)
      @bot = XTwitterScraper::Resources::Bot.new(client: self)
      @support = XTwitterScraper::Resources::Support.new(client: self)
      @credits = XTwitterScraper::Resources::Credits.new(client: self)
    end
  end
end
