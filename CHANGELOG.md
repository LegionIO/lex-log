# Changelog

## [0.1.7] - 2026-03-30

### Changed
- Add rubocop-legion 0.1.7 shared config via `inherit_gem`
- Revert auto-corrected `log.*` calls in `to_stdout` to `Legion::Logging.*` with inline disable comments to match spec expectations
- Update CI workflow: rename `lint` job to `excluded-files`, update workflow ref to `excluded-files.yml@main`

## [0.1.6] - 2026-03-22

### Changed
- Add runtime dependencies for all Legion sub-gems (legion-cache, legion-crypt, legion-data, legion-json, legion-logging, legion-settings, legion-transport) to support full TIER 1 helper integration
- Update spec_helper to require real sub-gem helpers with Helpers::Lex stub

## [0.1.5] - 2026-03-22

### Changed
- Updated `legion-logging` gemspec dependency to `>= 1.2.8`

## [0.1.4]

Cleaning up things for github migration
