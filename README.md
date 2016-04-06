# DuckDuckGo
[![Build Status](https://travis-ci.com/stevesoltys/duckduckgo.svg?token=p8s7S7quPerPhARM711E&branch=master)](https://travis-ci.com/stevesoltys/duckduckgo)

An unofficial DuckDuckGo search API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'duckduckgo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install duckduckgo

## Usage

Using this library is very simple. Here's an example:

```ruby
#!/usr/bin/env ruby

require 'duckduckgo'

results = DuckDuckGo::search('Apples')
result = results.first

result.uri
# => "https://en.wikipedia.org/wiki/Apple"

result.title
# => "Apple - Wikipedia, the free encyclopedia"

result.description
# => "The apple tree (Malus domestica) is a deciduous tree in the rose family best known for its sweet, pomaceous fruit, the apple. It is cultivated worldwide as a fruit ..."
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/stevesoltys/duckduckgo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

