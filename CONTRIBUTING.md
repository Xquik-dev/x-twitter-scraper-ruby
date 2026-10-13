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

Run every check before you open a pull request.

```bash
bin/check-local
```

It verifies a reproducible gem build, runs RuboCop, Steep and Sorbet, audits
gems, runs the tests and enforces coverage. It then runs the CodeQL
`security-extended` queries, and any finding fails the run. Last, it runs
[REUSE](https://reuse.software) 6.2.0 through `uvx`. It stops at the first
failure and names the failed check.

CodeQL and uv are required. Install them with `brew install --cask codeql` and
`brew install uv`. REUSE needs no install, because uv runs the pinned version.

The audit uses bundler-audit and applies at every severity. It blocks on any
advisory for a runtime gem and on any development advisory that has a fix. An
unfixable development-only advisory passes only while `audit-exceptions.json`
lists it with its advisory ID, dependency path, reason and a recheck date
within 30 days. It blocks again on that date or once a fix exists.

On a clean tree whose commit is on GitHub, it posts the result as the
`xquik-local-checks` commit status with your `gh` login. Pull requests need
that status to merge. Pass `--no-status` to skip it.

Run single tasks while you work.

```bash
bundle exec rake test
bundle exec rake lint
bundle exec rake format
bundle exec rake docs:preview PORT=8808
```

`format` rewrites files. `docs:preview` starts a local server.

## Release

A maintainer releases from a local machine. Run the dry run first.

```bash
bin/release-local --dry-run
bin/release-local
```

The script runs on a clean `main` that matches `origin/main`. It reads the
version from the gemspec and stops if tag `v<version>` already exists. It runs
`bin/check-local` and the dependency audit, then builds the gem. It pushes the
gem to RubyGems.org unless that version is already there. It then pushes the
annotated tag and creates a GitHub release from the version's `CHANGELOG.md`
section.

`--dry-run` runs the same checks and builds the gem. It prints the version, the
listing fields and the file list, and RubyGems verifies the built gem. It stops
before the upload, the tag and the GitHub release.

The RubyGems API key stays in the macOS Keychain. On the release machine, set
`RUBYGEMS_KEYCHAIN_SERVICE` to the service name of that Keychain item. A
release stops at once when the variable is unset or empty. A dry run does not
need it. The script reads the key only for `gem push`.

RubyGems asks for a one-time code when the account uses MFA. In a terminal,
`gem push` asks for the code at push time. Without a terminal, set
`GEM_HOST_OTP_CODE` to a current code, or the release stops before the checks.
A one-time code expires quickly and the checks run first, so prefer a terminal.

## Editor support

Use Ruby LSP for definitions and Solargraph for completion. Sorbet may select
the wrong declaration or report duplicate generic RBI members. Neither warning
affects downstream gem users.

[contribution-policy]: https://github.com/Xquik-dev/.github/blob/main/CONTRIBUTING.md
