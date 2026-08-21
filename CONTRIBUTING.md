# Contributing

## Set up

The `.ruby-version` file works with rbenv and asdf's Ruby plugin.
Install that Ruby version, then run:

```bash
./scripts/bootstrap
```

Run `bundle exec rake` to list every task.

## Generated code

Most SDK files come from the API generator.
Direct edits survive regeneration but can create conflicts.
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

Reference GitHub in your `Gemfile`:

```ruby
gem "x-twitter-scraper", git: "https://github.com/Xquik-dev/x-twitter-scraper-ruby"
```

Reference a local clone instead:

```ruby
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

Install Ruby LSP for definition lookup and Solargraph for completion.

Sorbet works here with 2 known caveats:

- Definition lookup can select the wrong declaration.
- Generic RBI types can report duplicate type members.

These warnings do not affect downstream gem users.
