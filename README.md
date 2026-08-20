# Xquik Ruby SDK: Twitter Search, Followers & X Automation

[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/13739/badge)](https://www.bestpractices.dev/projects/13739)

Use the Xquik Ruby SDK for Twitter search, timelines, profiles & followers. Manage media, webhooks & X automation with typed request objects. It provides a Twitter API alternative through documented Xquik REST routes.

[Ruby SDK Guide](https://docs.xquik.com/sdks/ruby) | [REST API](https://docs.xquik.com/api-reference/overview) | [RubyDoc](https://gemdocs.org/gems/x-twitter-scraper) | [Webhooks](https://docs.xquik.com/api-reference/webhooks/create)

## Choose the Ruby SDK

Choose this gem for Ruby services that use Sorbet or RBS. Reuse one client for pooled connections.

## Common Twitter & X Tasks

Map each task to its REST route.

| Task | REST Route | Usage |
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

Add the gem to your `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "x-twitter-scraper", "~> 0.10.2"
```

<!-- x-release-please-end -->

## Usage

```ruby
require "bundler/setup"
require "x_twitter_scraper"

x_twitter_scraper = XTwitterScraper::Client.new(
  api_key: ENV["X_TWITTER_SCRAPER_API_KEY"] # This is the default and can be omitted
)

response = x_twitter_scraper.x.tweets.search(q: "from:elonmusk", limit: 10)

puts(response)
```

### Handling Errors

The SDK raises an `APIError` subclass for connection failures and non-2xx responses:

```ruby
begin
  account = x_twitter_scraper.account.retrieve
rescue XTwitterScraper::Errors::APIConnectionError => e
  puts("Could not reach the server. Check the connection.")
  puts(e.cause)  # Underlying net/http exception.
rescue XTwitterScraper::Errors::RateLimitError => e
  puts("Rate limited. Retry later.")
rescue XTwitterScraper::Errors::APIStatusError => e
  puts("The server returned another non-2xx status.")
  puts(e.status)
end
```

The SDK uses these error classes:

| Cause            | Error Type                 |
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

The SDK retries connection errors, timeouts, and HTTP 408, 409, 429, and 5xx responses.
It uses exponential backoff and attempts 2 retries by default.
Set `max_retries` to change or disable retries:

```ruby
# Set the client default:
x_twitter_scraper = XTwitterScraper::Client.new(
  max_retries: 0 # default is 2
)

# Override one request:
x_twitter_scraper.account.retrieve(request_options: {max_retries: 5})
```

### Timeouts

Requests time out after 60 seconds. Set `timeout` to change or disable this limit:

```ruby
# Set the client default:
x_twitter_scraper = XTwitterScraper::Client.new(
  timeout: nil # default is 60
)

# Override one request:
x_twitter_scraper.account.retrieve(request_options: {timeout: 5})
```

On timeout, `XTwitterScraper::Errors::APITimeoutError` is raised.

Timed-out requests follow the default retry policy.

## Advanced Concepts

### BaseModel

All parameter and response objects inherit from `XTwitterScraper::Internal::Type::BaseModel`.
The base model provides these operations:

1. Access known and unknown fields with `obj[:prop]`.
2. Destructure fields with `obj => {prop: prop}` or pattern matching.
3. Compare objects by their field values with `==`.
4. Print classes and instances in a readable format.
5. Convert values with `#to_h`, `#deep_to_h`, `#to_json`, or `#to_yaml`.

### Making Custom or Undocumented Requests

#### Undocumented Properties

Send undocumented parameters and read undocumented response properties:

A matching `extra_` option overrides its documented parameter.

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

#### Undocumented Request Parameters

Pass extra values through `extra_query`, `extra_body`, or `extra_headers` under `request_options:`.

#### Undocumented Endpoints

Use `client.request` for undocumented endpoints while retaining authentication and retries:

```ruby
response = client.request(
  method: :post,
  path: '/undocumented/endpoint',
  query: {"dog": "woof"},
  headers: {"useful-header": "interesting-value"},
  body: {"hello": "world"}
)
```

### Concurrency & Connection Pooling

Clients are thread-safe. Fork them only when no HTTP requests are in flight.
Each client has an HTTP connection pool with a default size of 99.
Reuse one client per application in most cases.
Requests wait when every connection is busy. This wait counts toward the request timeout.
Other SDK classes do not lock their data.

## Sorbet

The SDK includes [RBI](https://sorbet.org/docs/rbi) definitions. It does not depend on `sorbet-runtime`.

Pass request hashes or typed parameter objects:

```ruby
# Hashes work without type safety:
x_twitter_scraper.x.tweets.search(q: "from:elonmusk", limit: 10)

# Splat a complete Params object:
params = XTwitterScraper::X::TweetSearchParams.new(q: "from:elonmusk", limit: 10)
x_twitter_scraper.x.tweets.search(**params)
```

### Enums

The SDK does not depend on `sorbet-runtime` or provide [`T::Enum`](https://sorbet.org/docs/tenum) instances.
It uses tagged symbols, which remain primitives at runtime:

```ruby
# :en
puts(XTwitterScraper::AccountUpdateLocaleParams::Locale::EN)

# Revealed type: `T.all(XTwitterScraper::AccountUpdateLocaleParams::Locale, Symbol)`
T.reveal_type(XTwitterScraper::AccountUpdateLocaleParams::Locale::EN)
```

Enum parameters accept constants or literal values:

```ruby
# Enum constants preserve tagged type information:
x_twitter_scraper.account.update_locale(
  locale: XTwitterScraper::AccountUpdateLocaleParams::Locale::EN,
  # …
)

# Literal values also work:
x_twitter_scraper.account.update_locale(
  locale: :en,
  # …
)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html). Version `0` releases may change APIs.

Changes to non-runtime `*.rbi` and `*.rbs` definitions remain non-breaking.

## Requirements

Ruby 3.2.0 or higher.

## Security & Support

- Report vulnerabilities through the [security policy](SECURITY.md).
- Ask usage questions through the [organization support policy](https://github.com/Xquik-dev/.github/blob/main/SUPPORT.md).

## Contributing

See [the contributing documentation](https://github.com/Xquik-dev/x-twitter-scraper-ruby/tree/main/CONTRIBUTING.md).

Xquik is an independent third-party service. Not affiliated with X Corp. "Twitter" and "X" are trademarks of X Corp.
