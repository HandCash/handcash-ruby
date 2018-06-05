# handcash

Ruby gem for handcash's API @ http://handcash.io/api-docs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'handcash'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install handcash

## Usage

```ruby
require 'handcash/api'
hc = Handcash::API.new(network: :testnet)
hc.receive('someuser')
```

This returns:

```ruby
{
    receivingAddress: 'mxszqDyaNGFcmTkPjJ2BGRpSTChdVWaNPZ',
    publicKey: '03d193439a2f06ed1121be5b4e61381386ffee5ec5bec33daf17e33ccb34622753'
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/HandCash/handcash-ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
