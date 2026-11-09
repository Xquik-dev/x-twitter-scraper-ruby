# Contributing

Follow the shared [Xquik contribution policy][contribution-policy].

## Set up

Install `.ruby-version` through rbenv or asdf, then run the bootstrap script.

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

Make the example executable, then run it.

```bash
chmod +x examples/<name>.rb
ruby examples/<name>.rb
```

## Use a source checkout

Reference GitHub or a local clone in your `Gemfile`.

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

It first compares the SDK with the API spec, as [API fields](#api-fields)
describes. It verifies a reproducible gem build, runs RuboCop, Steep and Sorbet,
audits gems, runs the tests and enforces coverage. It then runs the CodeQL
`security-extended` queries. Any finding fails the run, and so does any file
that CodeQL cannot parse. Last, it runs [REUSE](https://reuse.software) 6.2.0
through `uvx`. It stops at the first failure and names the failed check.

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

## API fields

The check right after the gem check fails when the SDK's fields differ from the
API spec. A change the API serves therefore fails `bin/check-local` before the
longer checks start.

For each operation both the API spec and the SDK have, it compares the query
parameters and JSON or multipart body fields of the request, and the JSON body
of each 2xx response, at every depth. It reads the spec's fields through `$ref`,
`allOf`, `oneOf` and `anyOf`. It reads the SDK's fields from the params and
response models each `@client.request` call in
`lib/x_twitter_scraper/resources` names. Path and header parameters, free-form
objects and fields under an object that allows extra properties stay out. A
field missing on 1 side counts once, at its top position.

Each difference prints as 1 line with the method, the full path, `request` or
`response`, a kind and the field's JSON path.

```text
GET /api/v1/monitors response enum monitors[].pausedReason
```

- `missing` means the spec has the field and the SDK does not. Add it to its
  model in `lib/x_twitter_scraper/models`, `rbi/x_twitter_scraper/models` and
  `sig/x_twitter_scraper/models`.
- `extra` means the SDK has a field the spec does not list. When the spec lists
  it under another name, as `minLikes` for `min_faves`, keep the parameter and
  send it under the spec's name. Otherwise keep it when callers may use it, and
  accept it.
- `enum` means both sides list values and the values differ. Add the missing
  values, and accept values the SDK keeps.
- `required` and `nullable` mean the flags differ. Fix them only when the change
  keeps old calls and old responses working.

Fixes stay additive. Never remove or rename a public field or parameter to
satisfy the check. Accept it instead.

`accepted-field-differences.json` holds the reviewed differences the SDK keeps
for now, in groups with a non-empty `reason`. A difference appears at most once.
An accepted difference the check no longer finds fails as stale, so remove it
from the file. `ACCEPTED_CEILING` in `scripts/check_api_fields.rb` holds the
list's length. The check fails when the list holds more, and a test fails until
the ceiling falls with the list. The list can therefore only fall as the SDK
catches up.

```json
[
  {
    "reason": "Filters the current spec no longer lists on these routes. The SDK keeps them, so code written for earlier versions keeps working.",
    "differences": ["GET /api/v1/x/users/{id}/mentions request extra near"]
  }
]
```

The check reads `XQUIK_OPENAPI_SPEC` as a local JSON file, or else downloads
`https://xquik.com/openapi.json`.

```bash
XQUIK_OPENAPI_SPEC=/path/to/openapi.json bundle exec ruby scripts/check_api_fields.rb
```

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
