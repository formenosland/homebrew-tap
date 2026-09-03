# formenos.land Homebrew tap

Third-party [Homebrew](https://brew.sh) formulae for [formenos.land](https://github.com/formenosland) tools. Use fully qualified names (`formenosland/tap/<formula>`) so they stay unambiguous across taps.

## Usage

Homebrew 6+ requires trusting a third-party tap before formulae from it will install:

```sh
brew tap formenosland/tap
brew trust formenosland/tap
brew install formenosland/tap/<formula>
```

After the tap is trusted, later formulae from it install the same way. In a `Brewfile`:

```ruby
tap "formenosland/tap"
brew "formenosland/tap/<formula>"
```

## Formulae

| Formula | Description |
| --- | --- |
| [`skillsync`](https://github.com/formenosland/skillsync) | One skill store for every AI coding agent |

Example:

```sh
brew install formenosland/tap/skillsync
```
