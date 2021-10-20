# Faraday Encode XML

[![Cirrus CI - Base Branch Build Status](https://img.shields.io/cirrus/github/AlexWayfer/faraday-encode_xml?style=flat-square)](https://cirrus-ci.com/github/AlexWayfer/faraday-encode_xml)
[![Depfu](https://img.shields.io/depfu/AlexWayfer/faraday-encode_xml?style=flat-square)](https://depfu.com/repos/github/AlexWayfer/faraday-encode_xml)
[![Gem](https://img.shields.io/gem/v/faraday-encode_xml.svg?style=flat-square)](https://rubygems.org/gems/faraday-encode_xml)
[![License](https://img.shields.io/github/license/AlexWayfer/faraday-encode_xml.svg?style=flat-square)](LICENSE.txt)

This repo is a [Faraday](https://github.com/lostisland/faraday) middleware for encoding requests as XML.
Faraday is an HTTP client library that provides a common interface for making requests.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'faraday-encode_xml'
```

And then execute:

```shell
bundle install
```

Or install it yourself as:

```shell
gem install faraday-encode_xml
```

## Usage

```ruby
require 'faraday/encode_xml'

connection = Faraday.new do |faraday|
  ## This gem only encodes requests
  faraday.request :xml

  ## For responses deconding use `faraday_middleware` gem and such code:
  # require 'faraday_middleware'
  # faraday.response :xml

  ## For example `httpbingo` responses as JSON, so let's enable it:
  require 'faraday_middleware'
  faraday.response :json
end

response = connection.post('https://httpbingo.org/post', { a: 1, b: 'foo', c: true })

puts response.body['data'] ## => <a>1</a><b>foo</b><c>true</c>
```

## Development

After checking out the repo, run `bundle install` to install dependencies.

Then, run `bundle exec rspec` to run the tests.

To install this gem onto your local machine, run `toys gem install`.

To release a new version, run `toys gem release %version%`.
See how it works [here](https://github.com/AlexWayfer/gem_toys#release).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/AlexWayfer/faraday-encode_xml).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
