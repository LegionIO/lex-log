# lex-log

Async logging extension for [LegionIO](https://github.com/LegionIO/LegionIO). Routes log messages through the message bus to write to STDOUT or a file.

## Installation

```bash
gem install lex-log
```

## Usage

Dispatch log messages via the `Output` runner:

**Write to stdout:**
```ruby
Legion::Ingress.run('lex_log.output.to_stdout', message: 'Hello world', level: 'info')
```

**Write to a file:**
```ruby
Legion::Ingress.run('lex_log.output.to_file', location: '/var/log/myapp.log', message: 'Event occurred', level: 'warn')
```

### Log Levels

Accepted values for `level:`: `debug`, `info`, `warn`, `error`, `fatal`, `unknown`. Defaults to `info`.

## Requirements

- Ruby >= 3.4
- [LegionIO](https://github.com/LegionIO/LegionIO) framework
- `legion-logging`

## License

MIT
