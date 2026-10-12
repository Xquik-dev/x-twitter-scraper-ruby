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

Run every check before you open a pull request:

```bash
bin/check-local
```

It verifies a reproducible gem build, runs RuboCop, Steep and Sorbet, audits
gems with bundle-audit, runs the tests and enforces coverage. It also runs
`reuse lint` when [REUSE](https://reuse.software) is installed. It stops at the
first failure and names the failed check.

On a clean tree whose commit is on GitHub, it posts the result as the
`xquik-local-checks` commit status. Pull requests need that status to merge.
Pass `--no-status` to skip it.

Run single tasks while you work:

```bash
bundle exec rake test
bundle exec rake lint
bundle exec rake format
bundle exec rake docs:preview PORT=8808
```

`format` rewrites files. `docs:preview` starts a local server.

## Release

A maintainer releases from a local machine with:

```bash
bin/release-local
```

The script runs on a clean `main` that matches `origin/main`. It reads the
version from the gemspec and stops if tag `v<version>` already exists. It runs
`bin/check-local` and `bundle-audit`, then builds the gem. It pushes the gem to
RubyGems.org unless that version is already there. It then pushes the annotated
tag and creates a GitHub release from the version's `CHANGELOG.md` section.

The RubyGems API key stays in the macOS Keychain under the service name
`xquik-rubygems-api-key`. The script reads it only for `gem push`.

## Editor support

Use Ruby LSP for definitions and Solargraph for completion. Sorbet may select
the wrong declaration or report duplicate generic RBI members. Neither warning
affects downstream gem users.

[contribution-policy]: https://github.com/Xquik-dev/.github/blob/main/CONTRIBUTING.md
