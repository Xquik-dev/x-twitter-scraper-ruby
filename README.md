# Xquik Ruby SDK: Twitter search, followers & X automation

[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/13739/badge)](https://www.bestpractices.dev/projects/13739)

Use the Xquik Ruby SDK for Twitter search, timelines, profiles & followers.
Manage media, webhooks & X automation with typed requests.
Use documented Xquik REST routes as a Twitter API alternative.

[Ruby SDK Guide](https://docs.xquik.com/sdks/ruby) | [REST API](https://docs.xquik.com/api-reference/overview) | [RubyDoc](https://gemdocs.org/gems/x-twitter-scraper) | [Webhooks](https://docs.xquik.com/api-reference/webhooks/create)

## Common Twitter & X tasks

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

Requires Ruby 3.2.0 or higher.

Add the gem to your `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "x-twitter-scraper", "~> 0.11.0"
```

<!-- x-release-please-end -->

## Usage

```ruby
require "bundler/setup"
require "x_twitter_scraper"

x_twitter_scraper = XTwitterScraper::Client.new(
  api_key: ENV["X_TWITTER_SCRAPER_API_KEY"] # Optional; the client reads this variable.
)

response = x_twitter_scraper.x.tweets.search(q: "from:elonmusk", limit: 10)

puts(response)
```

### Handling errors

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
  puts("Request failed. Inspect the returned HTTP status.")
  puts(e.status)
end
```

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

The SDK retries connection errors, timeouts & HTTP 408, 409, 429, and 5xx responses.
It uses exponential backoff with 2 retries by default.
Set `max_retries` to change or disable retries:

```ruby
# Change the client default.
x_twitter_scraper = XTwitterScraper::Client.new(
  max_retries: 0
)

# Override one request.
x_twitter_scraper.account.retrieve(request_options: {max_retries: 5})
```

### Timeouts

Requests time out after 60 seconds. Set `timeout` to change or disable this limit:

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

All parameter and response objects inherit from `XTwitterScraper::Internal::Type::BaseModel` and support:

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

## Concurrency & connection pooling

Clients are thread-safe. Fork them only when no HTTP requests are in flight.
Each client has an HTTP connection pool with a default size of 99.
Reuse one client per application in most cases.
Requests wait when every connection is busy. This wait counts toward the request timeout.
Other SDK classes do not lock their data.

## Sorbet

The gem ships [RBI](https://sorbet.org/docs/rbi) definitions without `sorbet-runtime`.

Pass request hashes or typed parameter objects:

```ruby
# Hashes work without type safety:
x_twitter_scraper.x.tweets.search(q: "from:elonmusk", limit: 10)

# Splat a complete Params object:
params = XTwitterScraper::X::TweetSearchParams.new(q: "from:elonmusk", limit: 10)
x_twitter_scraper.x.tweets.search(**params)
```

### Enums

Tagged symbols replace [`T::Enum`](https://sorbet.org/docs/tenum) and remain runtime primitives:

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

## Help & contributing

- Report vulnerabilities through the [security policy](SECURITY.md).
- Ask usage questions through the [organization support policy](https://github.com/Xquik-dev/.github/blob/main/SUPPORT.md).
- Read the [contribution guide](CONTRIBUTING.md).

Xquik is an independent third-party service. Not affiliated with X Corp. "Twitter" and "X" are trademarks of X Corp.
