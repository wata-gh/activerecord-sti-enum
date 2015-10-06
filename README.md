# ActiveRecord::Sti::Enum

Automatically creates enums of STI.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-sti-enum'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-sti-enum

## Usage

Just include ActiveRecord::Sti::Enum to parent model of STI.

```ruby
include ActiveRecord::Sti::Enum
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wata-gh/activerecord-sti-enum.
