# X API & Twitter API Ruby SDK by Xquik

[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/13739/badge)](https://www.bestpractices.dev/projects/13739)

Use this X API & Twitter API SDK to work with X from Ruby.
It works as a Twitter scraper & tweet scraper for search, profiles & followers.
Scrape Twitter timelines, lists, communities & trends into typed results.
Manage media, webhooks, monitors & X automation with typed requests.
It provides a Twitter API alternative through documented Xquik REST routes.

Xquik is the world's fastest and cheapest X Twitter scraper service with the most complete X data.
Xquik charges only for delivered, unique, filter-matching results and never pads rows.

> Xquik is an independent third-party service. Not affiliated with X Corp.
> "Twitter" and "X" are trademarks of X Corp.

[Ruby SDK guide](https://docs.xquik.com/sdks/ruby) | [REST API](https://docs.xquik.com/api-reference/overview) | [RubyDoc](https://gemdocs.org/gems/x-twitter-scraper) | [Webhooks](https://docs.xquik.com/api-reference/webhooks/create)

<!-- trust:start -->

## Trust & usage

[![Twitter API package downloads](https://img.shields.io/endpoint?url=https%3A%2F%2Fxquik.com%2Fbadges%2Fdownloads.json)](https://xquik.com/trust#downloads)
[![Twitter scraper users on Apify](https://img.shields.io/endpoint?url=https%3A%2F%2Fxquik.com%2Fbadges%2Fapify-users.json)](https://apify.com/xquik)
[![Twitter scraper runs on Apify](https://img.shields.io/endpoint?url=https%3A%2F%2Fxquik.com%2Fbadges%2Fapify-runs.json)](https://apify.com/xquik)
[![Tweet scraper rating on Apify](https://img.shields.io/endpoint?url=https%3A%2F%2Fxquik.com%2Fbadges%2Fapify-rating.json)](https://apify.com/xquik/x-tweet-scraper/reviews)
[![Xquik Twitter API accounts](https://img.shields.io/endpoint?url=https%3A%2F%2Fxquik.com%2Fbadges%2Faccounts.json)](https://xquik.com/trust#accounts)
[![Twitter Skill installs](https://img.shields.io/endpoint?url=https%3A%2F%2Fxquik.com%2Fbadges%2Fskill-installs.json)](https://xquik.com/trust#skill-installs)
[![Xquik verified revenue on TrustMRR](https://img.shields.io/endpoint?url=https%3A%2F%2Fxquik.com%2Fbadges%2Frevenue.json)](https://trustmrr.com/startup/xquik)
[![Twitter API p99 server read time](https://img.shields.io/endpoint?url=https%3A%2F%2Fxquik.com%2Fbadges%2Frest-p99.json)](https://xquik.com/trust#speed)
[![Xquik GitHub stars](https://img.shields.io/endpoint?url=https%3A%2F%2Fxquik.com%2Fbadges%2Fgithub-stars.json)](https://github.com/Xquik-dev)
[![x-twitter-scraper downloads on RubyGems](https://img.shields.io/endpoint?url=https%3A%2F%2Fxquik.com%2Fbadges%2Frubygems-x-twitter-scraper.json)](https://rubygems.org/gems/x-twitter-scraper)
[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/13739/badge)](https://www.bestpractices.dev/projects/13739)

- 53,000+ downloads of Xquik's Twitter API packages on npm, PyPI, RubyGems, NuGet, Packagist & Terraform ([source](https://xquik.com/trust#downloads)) <!-- trust:downloads 53547 -->
- 9,500+ users of Xquik's Twitter scraper Actors on Apify ([source](https://apify.com/xquik)) <!-- trust:apify-users 9595 -->
- 6,700,000+ runs of Xquik's Twitter scraper Actors on Apify ([source](https://apify.com/xquik)) <!-- trust:apify-runs 6765249 -->
- 4.66 of 5 for the X Tweet Scraper from 16 Apify reviews ([source](https://apify.com/xquik/x-tweet-scraper/reviews)) <!-- trust:apify-rating 4.66 16 -->
- 4,000+ accounts on xquik.com ([source](https://xquik.com/trust#accounts)) <!-- trust:accounts 4073 -->
- 1,600+ installs of Xquik's Twitter Skills on skills.sh ([source](https://xquik.com/trust#skill-installs)) <!-- trust:skill-installs 1617 -->
- $39,000+ in revenue verified by TrustMRR ([source](https://trustmrr.com/startup/xquik)) <!-- trust:revenue 39784 -->
- 13.2 s p99 REST API server read time over 7 days, failed reads included ([source](https://xquik.com/trust#speed)) <!-- trust:rest-p99 13194 -->
- 380+ GitHub stars across Xquik's repos ([source](https://github.com/Xquik-dev)) <!-- trust:github-stars 383 -->
- 10,000+ downloads of x-twitter-scraper on RubyGems ([source](https://rubygems.org/gems/x-twitter-scraper)) <!-- trust:rubygems-x-twitter-scraper 10404 -->
- This repo meets the OpenSSF Best Practices passing criteria ([source](https://www.bestpractices.dev/projects/13739)) <!-- trust:openssf-x-twitter-scraper-ruby 1 -->

Checked on 2026-10-25. See each number with its date & source on [xquik.com/trust](https://xquik.com/trust) or as [JSON](https://xquik.com/trust.json).

<!-- trust:end -->

## Common Twitter & X tasks

| Task | REST route | Usage |
| --- | --- | --- |
| Search tweets without the X API | `GET /x/tweets/search` | Use keyword or advanced operator queries. |
| Read an X profile timeline | `GET /x/users/{id}/tweets` | Paginate bounded results. |
| Scrape Twitter followers | `GET /x/users/{id}/followers` | Use an extraction for complete datasets. |
| Scrape following accounts | `GET /x/users/{id}/following` | Use an extraction for complete datasets. |
| Read a home timeline | `GET /x/timeline` | Approve this private read. |
| Export large X datasets | `POST /extractions` | Poll status, then download results. |
| Download or upload media | `/x/media/*` | Use typed file helpers. |
| Monitor an account | `POST /monitors` | Deliver events through HMAC webhooks. |
| Post or reply | `POST /x/tweets` | Confirm the account and payload. |

## Installation

The SDK requires Ruby 3.2.0 or later.

Add the gem to your `Gemfile`.

```ruby
gem "x-twitter-scraper", "~> 0.10.6"
```

## Usage

```ruby
require "bundler/setup"
require "x_twitter_scraper"

x_twitter_scraper = XTwitterScraper::Client.new(
  api_key: ENV["X_TWITTER_SCRAPER_API_KEY"] # Optional. The client reads this variable.
)

response = x_twitter_scraper.x.tweets.search(q: "from:elonmusk", limit: 10)

puts(response)
```

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
  query: {"dog": "woof"},
  headers: {"useful-header": "interesting-value"},
  body: {"hello": "world"}
)
```

## Concurrency & connection pooling

Clients are thread-safe. Fork them only when no HTTP requests are in flight.
Each client has an HTTP connection pool with a default size of 99.
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

## More Xquik tools

- [X (Twitter) scraper API & Twitter MCP server](https://github.com/Xquik-dev/x-twitter-scraper) with REST, MCP & Skill setup.
- Twitter API SDKs for [TypeScript](https://github.com/Xquik-dev/x-twitter-scraper-typescript), [Python](https://github.com/Xquik-dev/x-twitter-scraper-python), [Go](https://github.com/Xquik-dev/x-twitter-scraper-go), [Java](https://github.com/Xquik-dev/x-twitter-scraper-java), [Kotlin](https://github.com/Xquik-dev/x-twitter-scraper-kotlin), [C#](https://github.com/Xquik-dev/x-twitter-scraper-csharp) & [PHP](https://github.com/Xquik-dev/x-twitter-scraper-php).
- [Twitter CLI & X CLI](https://github.com/Xquik-dev/x-twitter-scraper-cli) for terminal workflows.
- [Twitter advanced search operators](https://github.com/Xquik-dev/x-twitter-advanced-search) with tested examples.
- [Xquik X API & Twitter scraper](https://xquik.com) and the [Twitter API documentation](https://docs.xquik.com/api-reference/overview).

## Help & contributing

- Report vulnerabilities through the [security policy](SECURITY.md).
- Ask usage questions through the [organization support policy](https://github.com/Xquik-dev/.github/blob/main/SUPPORT.md).
- Read the [contribution guide](CONTRIBUTING.md).

Xquik is an independent third-party service. Not affiliated with X Corp. "Twitter" and "X" are trademarks of X Corp.
