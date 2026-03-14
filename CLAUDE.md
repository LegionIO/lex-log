# lex-log: Async Logging Extension for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-core/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that provides asynchronous logging to STDOUT and files within the Legion framework. Dispatches log messages via the message bus to the `Output` runner, which writes them using `legion-logging`.

**GitHub**: https://github.com/LegionIO/lex-log
**License**: MIT
**Version**: 0.1.4

## Architecture

```
Legion::Extensions::Log
└── Runners/
    └── Output             # Log output handler (no explicit actor - auto-generated subscription)
        ├── to_file        # Write log message to a file at given path
        └── to_stdout      # Write log message to STDOUT via Legion::Logging
```

No explicit actors directory - the framework auto-generates a subscription actor for the Output runner.

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/log.rb` | Entry point, extension registration |
| `lib/legion/extensions/log/runners/output.rb` | `to_file` and `to_stdout` implementations |

## Runner Interface

**`to_file(location:, message:, level: 'info', **_opts)`**
Creates a `Legion::Logging::Logger` instance targeting `location` and writes at the given level.

**`to_stdout(message:, level: 'info', **_opts)`**
Delegates to `Legion::Logging` (debug/info/warn/error/fatal/unknown).

Both accept `level:` values: `debug`, `info`, `warn`, `error`, `fatal`, `unknown`.

## Dependencies

| Gem | Purpose |
|-----|---------|
| `legion-logging` | Core logging library used by both runners |

## Testing

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

Note: `spec/legion/extensions/output_spec.rb` exists but is entirely commented out. Only `spec/legion/extensions/log_spec.rb` (basic load test) runs.

---

**Maintained By**: Matthew Iverson (@Esity)
