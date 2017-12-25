# LittleSax

LittleSax is a very small gem that doesn't blow up your memory when parsing large XML files.

It's still in very early development.

If you are reading this, please, come and help.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'little_sax'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install little_sax

## Usage

TODO: Write better docs.


```ruby
LittleSax.parse_file(path, 'url') do |saxy_string, i|

  # http://www.example.com/
  puts saxy_string.match(/<loc.*>(.*)<\/loc>/).to_a[1..-1].to_s

  # http://www.example.com/
  puts saxy_string.sax_node_value('loc'))

  # 2005-01-01
  puts saxy_string.sax_node_value('lastmod')

  # 0.8
  puts saxy_string.sax_node_value('priority')
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thejamespinto/little_sax. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LittleSax project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/thejamespinto/little_sax/blob/master/CODE_OF_CONDUCT.md).
