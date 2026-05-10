# X (Twitter) Scraper Ruby SDK: Tweet Search, Profile Tweets, Followers & Posting

[![Ask DeepWiki](https://deepwiki.com/badge.svg?url=https%3A%2F%2Fgithub.com%2FXquik-dev%2Fx-twitter-scraper-ruby)](https://deepwiki.com/Xquik-dev/x-twitter-scraper-ruby)
[![Skills.sh x-twitter-scraper Skill](https://skills.sh/b/xquik-dev/x-twitter-scraper)](https://skills.sh/xquik-dev/x-twitter-scraper)
<a href="https://nothumansearch.ai/site/xquik.com" target="_blank" rel="noopener"><img src="https://nothumansearch.ai/badge/xquik.com.svg" alt="NHS Agentic Readiness Score" height="28"></a>

The Xquik Ruby SDK is a Twitter API SDK and X API alternative for tweet search, advanced Twitter search queries, profile tweets, user lookup, follower export, media download, media upload, monitoring, webhooks, and posting automation.

Use it from Ruby 3.2.0+ applications to get tweets from profiles, search tweets by keyword or operator query, send tweets, post replies, like, repost, follow, DM, run giveaway draws, and automate X workflows. It ships with comprehensive types and docstrings in Yard, RBS, and RBI. The standard library's `net/http` is used as the HTTP transport, with connection pooling via the `connection_pool` gem.

It is generated with [Stainless](https://www.stainless.com/).

## Documentation

Documentation for releases of this gem can be found [on RubyDoc](https://gemdocs.org/gems/x-twitter-scraper).

The REST API documentation can be found on [xquik.com](https://xquik.com).

## Installation

To use this gem, install via Bundler by adding the following to your application's `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "x-twitter-scraper", "~> 0.4.0"
```

<!-- x-release-please-end -->

## Usage

```ruby
require "bundler/setup"
require "x_twitter_scraper"

x_twitter_scraper = XTwitterScraper::Client.new(
  api_key: ENV["X_TWITTER_SCRAPER_API_KEY"] # This is the default and can be omitted
)

paginated_tweets = x_twitter_scraper.x.tweets.search(q: "from:elonmusk", limit: 10)

puts(paginated_tweets.has_next_page)
```

### File uploads

Request parameters that correspond to file uploads can be passed as raw contents, a [`Pathname`](https://rubyapi.org/3.2/o/pathname) instance, [`StringIO`](https://rubyapi.org/3.2/o/stringio), or more.

```ruby
require "pathname"

# Use `Pathname` to send the filename and/or avoid paging a large file into memory:
response = x_twitter_scraper.x.media.upload(file: Pathname("/path/to/file"))

# Alternatively, pass file contents or a `StringIO` directly:
response = x_twitter_scraper.x.media.upload(file: File.read("/path/to/file"))

# Or, to control the filename and/or content type:
file =
  XTwitterScraper::FilePart.new(File.read("/path/to/file"), filename: "/path/to/file", content_type: "…")
response = x_twitter_scraper.x.media.upload(file: file)

puts(response.mediaId)
```

Note that you can also pass a raw `IO` descriptor, but this disables retries, as the library can't be sure if the descriptor is a file or pipe (which cannot be rewound).

### Handling errors

When the library is unable to connect to the API, or if the API returns a non-success status code (i.e., 4xx or 5xx response), a subclass of `XTwitterScraper::Errors::APIError` will be thrown:

```ruby
begin
  tweet = x_twitter_scraper.x.tweets.search(q: "from:elonmusk", limit: 10)
rescue XTwitterScraper::Errors::APIConnectionError => e
  puts("The server could not be reached")
  puts(e.cause)  # an underlying Exception, likely raised within `net/http`
rescue XTwitterScraper::Errors::RateLimitError => e
  puts("A 429 status code was received; we should back off a bit.")
rescue XTwitterScraper::Errors::APIStatusError => e
  puts("Another non-200-range status code was received")
  puts(e.status)
end
```

Error codes are as follows:

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

Certain errors will be automatically retried 2 times by default, with a short exponential backoff.

Connection errors (for example, due to a network connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors, and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
x_twitter_scraper = XTwitterScraper::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
x_twitter_scraper.x.tweets.search(q: "from:elonmusk", limit: 10, request_options: {max_retries: 5})
```

### Timeouts

By default, requests will time out after 60 seconds. You can use the timeout option to configure or disable this:

```ruby
# Configure the default for all requests:
x_twitter_scraper = XTwitterScraper::Client.new(
  timeout: nil # default is 60
)

# Or, configure per-request:
x_twitter_scraper.x.tweets.search(q: "from:elonmusk", limit: 10, request_options: {timeout: 5})
```

On timeout, `XTwitterScraper::Errors::APITimeoutError` is raised.

Note that requests that time out are retried by default.

## Advanced concepts

### BaseModel

All parameter and response objects inherit from `XTwitterScraper::Internal::Type::BaseModel`, which provides several conveniences, including:

1. All fields, including unknown ones, are accessible with `obj[:prop]` syntax, and can be destructured with `obj => {prop: prop}` or pattern-matching syntax.

2. Structural equivalence for equality; if two API calls return the same values, comparing the responses with == will return true.

3. Both instances and the classes themselves can be pretty-printed.

4. Helpers such as `#to_h`, `#deep_to_h`, `#to_json`, and `#to_yaml`.

### Making custom or undocumented requests

#### Undocumented properties

You can send undocumented parameters to any endpoint, and read undocumented response properties, like so:

Note: the `extra_` parameters of the same name overrides the documented parameters.

```ruby
paginated_tweets =
  x_twitter_scraper.x.tweets.search(
    q: "from:elonmusk",
    limit: 10,
    request_options: {
      extra_query: {my_query_parameter: value},
      extra_body: {my_body_parameter: value},
      extra_headers: {"my-header": value}
    }
  )

puts(paginated_tweets[:my_undocumented_property])
```

#### Undocumented request params

If you want to explicitly send an extra param, you can do so with the `extra_query`, `extra_body`, and `extra_headers` under the `request_options:` parameter when making a request, as seen in the examples above.

#### Undocumented endpoints

To make requests to undocumented endpoints while retaining the benefit of auth, retries, and so on, you can make requests using `client.request`, like so:

```ruby
response = client.request(
  method: :post,
  path: '/undocumented/endpoint',
  query: {"dog": "woof"},
  headers: {"useful-header": "interesting-value"},
  body: {"hello": "world"}
)
```

### Concurrency & connection pooling

The `XTwitterScraper::Client` instances are threadsafe, but are only are fork-safe when there are no in-flight HTTP requests.

Each instance of `XTwitterScraper::Client` has its own HTTP connection pool with a default size of 99. As such, we recommend instantiating the client once per application in most settings.

When all available connections from the pool are checked out, requests wait for a new connection to become available, with queue time counting towards the request timeout.

Unless otherwise specified, other classes in the SDK do not have locks protecting their underlying data structure.

## Sorbet

This library provides comprehensive [RBI](https://sorbet.org/docs/rbi) definitions, and has no dependency on sorbet-runtime.

You can provide typesafe request parameters like so:

```ruby
x_twitter_scraper.x.tweets.search(q: "from:elonmusk", limit: 10)
```

Or, equivalently:

```ruby
# Hashes work, but are not typesafe:
x_twitter_scraper.x.tweets.search(q: "from:elonmusk", limit: 10)

# You can also splat a full Params class:
params = XTwitterScraper::X::TweetSearchParams.new(q: "from:elonmusk", limit: 10)
x_twitter_scraper.x.tweets.search(**params)
```

### Enums

Since this library does not depend on `sorbet-runtime`, it cannot provide [`T::Enum`](https://sorbet.org/docs/tenum) instances. Instead, we provide "tagged symbols" instead, which is always a primitive at runtime:

```ruby
# :en
puts(XTwitterScraper::AccountUpdateLocaleParams::Locale::EN)

# Revealed type: `T.all(XTwitterScraper::AccountUpdateLocaleParams::Locale, Symbol)`
T.reveal_type(XTwitterScraper::AccountUpdateLocaleParams::Locale::EN)
```

Enum parameters have a "relaxed" type, so you can either pass in enum constants or their literal value:

```ruby
# Using the enum constants preserves the tagged type information:
x_twitter_scraper.account.update_locale(
  locale: XTwitterScraper::AccountUpdateLocaleParams::Locale::EN,
  # …
)

# Literal values are also permissible:
x_twitter_scraper.account.update_locale(
  locale: :en,
  # …
)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the library is in initial development and has a major version of `0`, APIs may change at any time.

This package considers improvements to the (non-runtime) `*.rbi` and `*.rbs` type definitions to be non-breaking changes.

## Requirements

Ruby 3.2.0 or higher.

## Contributing

See [the contributing documentation](https://github.com/Xquik-dev/x-twitter-scraper-ruby/tree/main/CONTRIBUTING.md).
