# fluent-plugin-json-string-parser

[Fluentd](https://fluentd.org/) filter plugin to do parse json strings.

This Gem is a Fluentd plugin filter that helps to manage text logs. When enabled, it's main functionality is to check and convert quoted JSON log messages into real JSON format.

## Installation

### RubyGems

```ruby
$ gem install specific_install
$ gem specific_install https://github.com/kumarappan-arumugam/fluent-plugin-json-string-parser.git
```

### Bundler

Add following line to your [Gemfile](https://bundler.io/guides/git.html):

```ruby
gem 'fluent-plugin-json-string-parser', github: 'kumarappan-arumugam/fluent-plugin-json-string-parser'
```

And then execute:

```
$ bundle
```

## Configuration

* See also: [Filter Plugin Overview](https://docs.fluentd.org/v/1.0/filter#overview)

##### key_name (string) (required)

Specify field name in the record to parse.

## Usage

In your Fluentd configuration file, the plugin filter can be used as follows:

```
<source>
  type forward
  port 24224
  bind 0.0.0.0
</source>

<filter xyz.**>
  @type json_string_parser
  key_name message
</filter>

<match **>
  type stdout
</match>
```

## Copyright

* Copyright(c) 2019- kumarappan-arumugam
* License
  * Apache License, Version 2.0
