# Homebrew tap

```
brew install --cask ryanjn/tap/callstage           # the app
brew install --cask ryanjn/tap/callstage-location  # `location`: prints your city, address, metro area… for a Text layer
brew trust --tap ryanjn/tap                        # optional: lets a plain `brew upgrade` include this tap
```

Callstage updates itself after install, so `brew upgrade` isn't needed for it.

`location --help` lists its presets (`city`, `address`, `street`, `county`, `state`,
`zip`, `metro`, `country`, `coords`, `timezone`, `json`) and `-f` template tokens.
Metro data: US Census Bureau (public domain) and GeoNames (CC BY 4.0).
