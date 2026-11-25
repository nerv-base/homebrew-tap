# nerv-base Homebrew Tap

Homebrew casks for projects from [nerv-base](https://github.com/nerv-base).

## Casks

| Cask | Description |
| --- | --- |
| [`mytoken`](https://github.com/nerv-base/mytoken) | Local, read-only spend and plan-quota dashboard for AI coding tools |

## Install

Tap once:

```sh
brew tap nerv-base/tap
```

Then install a cask from the table:

```sh
brew trust --cask nerv-base/tap/mytoken   # Homebrew 7: trust third-party casks
brew install --cask mytoken
```

The MyToken cask installs **MyToken!!!!!** into *Applications* and links the
`mytoken` command into Homebrew's `bin`. If it is already in *Applications*
from the disk image, use `brew install --cask --adopt mytoken` to take over
the identical app instead of stopping on the existing copy.

## Upgrade

```sh
brew upgrade --cask mytoken
```

The app also checks for updates itself.

## Uninstall

```sh
brew uninstall --cask mytoken
```

Add `--zap` to also remove the local index, preferences and caches. The index
lives in `~/Library/Application Support/MyToken`; deleting it discards the
dashboard's local history.

## Adding a cask

1. Add `Casks/<token>.rb`.
2. Point `url` at a stable, versioned release asset.
3. Set `version` and `sha256` from that asset.
4. Run `brew style --cask <token>` and `brew audit --cask --strict --online <token>`.
5. Commit and push; users get it after `brew update`.

## Maintenance

The MyToken cask is updated from the latest stable GitHub release every day by
[.github/workflows/update-cask.yml](.github/workflows/update-cask.yml). To do it
by hand:

```sh
./scripts/update-cask           # latest release
./scripts/update-cask v0.6.0    # a specific tag
```

The script reads the release asset's GitHub digest and rewrites the version and
SHA-256 in `Casks/mytoken.rb`. Review the diff before committing.
