# ColognePhonetics

The [“Cologne phonetics (Kölner Phonetik)”](https://en.wikipedia.org/wiki/Cologne_phonetics) algorithm encodes words in a way that enables to search for similarly sounding words. It’s related to the (“Soundex”)[https://en.wikipedia.org/wiki/Soundex] algorithm, but better suited for the German language.

This implementations closely follows the algorithm as described on its Wikipedia page. Support for umlauts (Ä, Ö, Ü) and ß has been added as suggested.

Note that other accented characters are not handled by default. If you

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cologne_phonetics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cologne_phonetics

## Usage

Example usage:

```ruby
ColognePhonetics.encode('Wikipedia') # => '3412'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/noniq/cologne_phonetics.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
