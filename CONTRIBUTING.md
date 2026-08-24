# Contributing

Follow the shared [Xquik contribution policy][contribution-policy].

## Set up

Install `.ruby-version` through rbenv or asdf, then run:

```bash
./scripts/bootstrap
```

Run `bundle exec rake` to list every task.

## Generated code

The API generator owns most SDK files. Direct edits can conflict later.
The generator never changes `lib/x_twitter_scraper/helpers/` or `examples/`.

## Add examples

Files under `examples/` remain handwritten.

```ruby
#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/x_twitter_scraper"
```

Make the example executable, then run it:

```bash
chmod +x examples/<name>.rb
ruby examples/<name>.rb
```

## Use a source checkout

Reference GitHub or a local clone in your `Gemfile`:

```ruby
# GitHub
gem "x-twitter-scraper", git: "https://github.com/Xquik-dev/x-twitter-scraper-ruby"
# Local clone
gem "x-twitter-scraper", path: "<path-to-repo>"
```

## Run checks

```bash
bundle exec rake test
bundle exec rake lint
bundle exec rake format
bundle exec rake docs:preview PORT=8808
```

`format` rewrites files. `docs:preview` starts a local server.

## Editor support

Use Ruby LSP for definitions and Solargraph for completion. Sorbet may select
the wrong declaration or report duplicate generic RBI members. Neither warning
affects downstream gem users.

[contribution-policy]: https://github.com/Xquik-dev/.github/blob/main/CONTRIBUTING.md
