# X (Twitter) Ruby API SDK & Scraper by Xquik

[![Framer builds a tweet ticker with Xquik](https://img.youtube.com/vi/4UOSpoOoC3Y/maxresdefault.jpg)](https://youtu.be/4UOSpoOoC3Y?t=367)\
[Watch Framer build a tweet ticker with Xquik, from 6:07](https://youtu.be/4UOSpoOoC3Y?t=367).
This Ruby SDK calls the Xquik API.

Use this X (Twitter) scraper Ruby SDK by Xquik to search tweets & posts.
Export followers and read profiles as typed results.
Public reads need no X (Twitter) developer account.

Xquik is the world's fastest and cheapest X (Twitter) scraper service with the most complete X (Twitter) data.
Most other Apify Actors charge before filtering or deduplication.
Xquik charges only for delivered, unique, filter-matching results and never pads rows.
Xquik is independent and not affiliated with X Corp.

<!-- trust:win:start -->

The Xquik REST API read 45 tweets per second on 2026-10-15. That cost $0.15 per 1,000. The fastest of 4 rival Actors read 12.5 per second. The cheapest cost $0.173 per 1,000. [Compare each run](https://xquik.com/benchmarks#benchmark-x-tweet-scraper).

<!-- trust:win:end -->

## Install the X (Twitter) API Ruby gem

The SDK requires Ruby 3.2.0 or later.

Add the gem to your `Gemfile`.

```ruby
gem "x-twitter-scraper", "~> 0.10.6"
```

Or add it from a terminal.

```sh
bundle add x-twitter-scraper
```

## Scrape tweets with the Ruby X (Twitter) API

```ruby
require "bundler/setup"
require "x_twitter_scraper"

x_twitter_scraper = XTwitterScraper::Client.new(
  api_key: ENV["X_TWITTER_SCRAPER_API_KEY"] # Optional. The client reads this variable.
)

response = x_twitter_scraper.x.tweets.search(q: "from:elonmusk", limit: 10)

puts(response)
```

Next, read the [Ruby SDK guide](https://docs.xquik.com/sdks/ruby), [REST API reference](https://docs.xquik.com/api-reference/overview) or [RubyGems page](https://rubygems.org/gems/x-twitter-scraper).

<!-- trust:start -->

## Benchmarks & usage

[![x-twitter-scraper downloads on RubyGems](https://img.shields.io/endpoint?url=https%3A%2F%2Fxquik.com%2Fbadges%2Frubygems-x-twitter-scraper.json)](https://rubygems.org/gems/x-twitter-scraper)
[![X (Twitter) API p99 server read time](https://img.shields.io/endpoint?url=https%3A%2F%2Fxquik.com%2Fbadges%2Frest-p99.json)](https://xquik.com/benchmarks#speed)
[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/13739/badge)](https://www.bestpractices.dev/projects/13739)

- 10,000+ downloads of x-twitter-scraper on RubyGems ([source](https://rubygems.org/gems/x-twitter-scraper)) <!-- trust:rubygems-x-twitter-scraper 10546 -->
- 5.1 s p99 REST server read time over 7 days, failures included ([source](https://xquik.com/benchmarks#speed)) <!-- trust:rest-p99 5087 -->
- This repo meets the OpenSSF Best Practices passing criteria ([source](https://www.bestpractices.dev/projects/13739)) <!-- trust:openssf-x-twitter-scraper-ruby 1 -->

Checked on 2026-11-08. See each number with its date & source on [xquik.com/benchmarks](https://xquik.com/benchmarks) or as [JSON](https://xquik.com/trust.json).

<!-- trust:end -->

## Common X (Twitter) tasks

| Task | REST route | Usage |
| --- | --- | --- |
| Search tweets without the X API | `GET /x/tweets/search` | Use keyword or advanced operator queries. |
| Read an X (Twitter) profile timeline | `GET /x/users/{id}/tweets` | Paginate bounded results. |
| Scrape Twitter followers | `GET /x/users/{id}/followers` | Use an extraction for complete datasets. |
| Scrape following accounts | `GET /x/users/{id}/following` | Use an extraction for complete datasets. |
| Read a home timeline | `GET /x/timeline` | Approve this private read. |
| Export large X (Twitter) datasets | `POST /extractions` | Poll status, then download results. |
| Download or upload media | `/x/media/*` | Use typed file helpers. |
| Monitor an account | `POST /monitors` | Deliver events through HMAC webhooks. |
| Post a tweet or reply | `POST /x/tweets` | Confirm the account and payload. |

## Usage

### Handling errors

The SDK raises an `APIError` subclass for connection failures and non-2xx responses.

```ruby
begin
  account = x_twitter_scraper.account.retrieve
rescue XTwitterScraper::Errors::APIConnectionError => e
  puts("Could not reach the server. Check the connection.")
  puts(e.cause)  # Underlying net/http exception.
rescue XTwitterScraper::Errors::RateLimitError => e
  puts("Rate limited. Retry later.")
rescue XTwitterScraper::Errors::APIStatusError => e
  puts("Request failed. Inspect the returned HTTP status.")
  puts(e.status)
end
```

| Cause            | Error type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >= 500      | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

The SDK retries connection errors, timeouts & HTTP 408, 409, 429, and 5xx responses.
It uses exponential backoff with 2 retries by default.
Set `max_retries` to change or disable retries.

```ruby
# Change the client default.
x_twitter_scraper = XTwitterScraper::Client.new(
  max_retries: 0
)

# Override one request.
x_twitter_scraper.account.retrieve(request_options: {max_retries: 5})
```

### Timeouts

Requests time out after 60 seconds. Set `timeout` to change or disable this limit.

```ruby
# Change the client default.
x_twitter_scraper = XTwitterScraper::Client.new(
  timeout: nil
)

# Override one request.
x_twitter_scraper.account.retrieve(request_options: {timeout: 5})
```

Timeouts raise `XTwitterScraper::Errors::APITimeoutError` and follow the retry policy.

## BaseModel

All parameter and response objects inherit from `XTwitterScraper::Internal::Type::BaseModel` and support these operations.

1. Access known and unknown fields with `obj[:prop]`.
2. Destructure fields with `obj => {prop: prop}` or pattern matching.
3. Compare objects by their field values with `==`.
4. Print classes and instances in a readable format.
5. Convert values with `#to_h`, `#deep_to_h`, `#to_json`, or `#to_yaml`.

## Custom requests

Use `extra_query`, `extra_body`, or `extra_headers` under `request_options`.
Matching `extra_` values override documented parameters.

```ruby
account =
  x_twitter_scraper.account.retrieve(
    request_options: {
      extra_query: {my_query_parameter: value},
      extra_body: {my_body_parameter: value},
      extra_headers: {"my-header": value}
    }
  )

puts(account[:my_undocumented_property])
```

Use `client.request` for undocumented endpoints. It keeps authentication and retries.

```ruby
response = client.request(
  method: :post,
  path: '/undocumented/endpoint',
  query: {my_query_parameter: "value"},
  headers: {"my-header": "value"},
  body: {my_body_parameter: "value"}
)
```

## Concurrency & connection pooling

Clients are thread-safe. Fork them only when no HTTP requests are in flight.
Each client pools at least 99 HTTP connections by default.
Reuse 1 client per application in most cases.
Requests wait when every connection is busy. This wait counts toward the request timeout.
Other SDK classes do not lock their data.

## Sorbet

The gem ships [RBI](https://sorbet.org/docs/rbi) definitions without `sorbet-runtime`.

Pass request hashes or typed parameter objects.

```ruby
x_twitter_scraper.x.tweets.search(q: "from:elonmusk", limit: 10)

params = XTwitterScraper::X::TweetSearchParams.new(q: "from:elonmusk", limit: 10)
x_twitter_scraper.x.tweets.search(**params)
```

### Enums

Tagged symbols replace [`T::Enum`](https://sorbet.org/docs/tenum) and remain runtime primitives.

```ruby
# :en
puts(XTwitterScraper::AccountUpdateLocaleParams::Locale::EN)

# Revealed type: `T.all(XTwitterScraper::AccountUpdateLocaleParams::Locale, Symbol)`
T.reveal_type(XTwitterScraper::AccountUpdateLocaleParams::Locale::EN)
```

Enum parameters accept constants or literal values.

```ruby
x_twitter_scraper.account.update_locale(
  locale: XTwitterScraper::AccountUpdateLocaleParams::Locale::EN,
  # …
)

x_twitter_scraper.account.update_locale(
  locale: :en,
  # …
)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html). Version `0` releases may change APIs.

Changes to non-runtime `*.rbi` and `*.rbs` definitions are non-breaking.

## Questions

### Do I need an X (Twitter) developer account?

No. Public reads need only an Xquik API key.
Private reads & account actions need a connected X (Twitter) account.

### Is this the official X API?

No. Xquik runs its own REST API. This SDK calls that API, not the official X API.

## More Xquik tools

- [X (Twitter) scraper API & X (Twitter) MCP server](https://github.com/Xquik-dev/x-twitter-scraper) with REST, MCP & Skill setup.
- X (Twitter) API SDKs for [TypeScript](https://github.com/Xquik-dev/x-twitter-scraper-typescript), [Python](https://github.com/Xquik-dev/x-twitter-scraper-python), [Go](https://github.com/Xquik-dev/x-twitter-scraper-go) & [Java](https://github.com/Xquik-dev/x-twitter-scraper-java).
- X (Twitter) API SDKs for [Kotlin](https://github.com/Xquik-dev/x-twitter-scraper-kotlin), [C#](https://github.com/Xquik-dev/x-twitter-scraper-csharp) & [PHP](https://github.com/Xquik-dev/x-twitter-scraper-php).
- [Twitter CLI & X CLI](https://github.com/Xquik-dev/x-twitter-scraper-cli) for terminal workflows.
- [Twitter advanced search operators](https://github.com/Xquik-dev/x-twitter-advanced-search) with tested examples.
- X (Twitter) agent plugins for [OpenClaw](https://github.com/Xquik-dev/tweetclaw) & [Hermes Agent](https://github.com/Xquik-dev/hermes-tweet).
- X (Twitter) integrations for [n8n](https://github.com/Xquik-dev/n8n-nodes-xquik), [Prefect](https://github.com/Xquik-dev/prefect-xquik), [Haystack](https://github.com/Xquik-dev/xquik-haystack) & [Paperclip](https://github.com/Xquik-dev/paperclip-plugin-xquik).
- X (Twitter) integrations for [Terraform](https://github.com/Xquik-dev/terraform-provider-x-twitter-scraper), [Convex](https://github.com/Xquik-dev/xquik-convex), [Supabase](https://github.com/Xquik-dev/xquik-supabase) & [Strapi](https://github.com/Xquik-dev/strapi-plugin-xquik).
- X (Twitter) MCP for [AI agents](https://github.com/Xquik-dev/xquik-mcp), [VS Code](https://github.com/Xquik-dev/xquik-vscode) & [Raycast](https://github.com/Xquik-dev/xquik-raycast).
- [Xquik X API & Twitter scraper](https://xquik.com).
- [X (Twitter) API documentation](https://docs.xquik.com/api-reference/overview) and its [source](https://github.com/Xquik-dev/xquik-docs).

## Help & contributing

- Report vulnerabilities through the [security policy](SECURITY.md).
- Ask usage questions through the [organization support policy](https://github.com/Xquik-dev/.github/blob/main/SUPPORT.md).
- Read the [contribution guide](CONTRIBUTING.md).

Xquik is an independent third-party service. Not affiliated with X Corp. "Twitter" and "X" are trademarks of X Corp.
