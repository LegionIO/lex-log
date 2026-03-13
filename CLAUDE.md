# lex-log: Async Logging Extension for LegionIO

**Repository Level 3 Documentation**
- **Category**: `/Users/miverso2/rubymine/legion/extensions/CLAUDE.md`

## Purpose

Legion Extension that provides asynchronous logging to STDOUT and files within the Legion framework. Wraps `legion-logging` to provide extension-level log output capabilities.

**GitHub**: https://github.com/LegionIO/lex-log
**License**: MIT

## Architecture

```
Legion::Extensions::Log
└── Runners/
    └── Output             # Log output handler
```

## Dependencies

| Gem | Purpose |
|-----|---------|
| `legion-logging` | Core logging library |

## Testing

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
