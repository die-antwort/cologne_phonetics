# ColognePhonetics

The [“Cologne phonetics (Kölner Phonetik)”](https://en.wikipedia.org/wiki/Cologne_phonetics) algorithm encodes words in a way that enables to search for similarly sounding words. It’s related to the [“Soundex”](https://en.wikipedia.org/wiki/Soundex) algorithm, but better suited for the German language.

This implementations closely follows the algorithm as described on its Wikipedia page. Support for umlauts (Ä, Ö, Ü) and ß has been added as suggested there.

Note that *other accented characters are not handled*. If your data may contain such characters you need to preprocess it (for example by using [`I18n.transliterate`](http://www.rubydoc.info/gems/i18n/I18n/Base#transliterate-instance_method)).

## Status

I consider this gem to be stable and (more or less) finished.

## Usage

Example usage:

```ruby
ColognePhonetics.encode('Wikipedia') # => "3412"

# Only basic characters and äöüß are handled, everything else gets ignored:
ColognePhonetics.encode('Åè1%-') # => ""

# If a string contains words separated by spaces, each word is encoded separately:
ColognePhonetics.encode('Heinz Classen') # => "068 4586"

# Use `encode_word` if you want to ignore spaces (note that this usually gives
# different results that  using `encode` and removing spaces afterwards; see
# Wikipedia article for details):
ColognePhonetics.encode_word('Heinz Classen') # => "068586"
```

You can set `ColognePhonetics.debug = true` to get warnings printed to `$stderr` about characters that can not be encoded:

```ruby
ColognePhonetics.debug = true
ColognePhonetics.encode('Olé')
# Cologne Phonetics: No rule for 'é' (prev: 'l', next: '')
# => "05"
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cologne_phonetics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cologne_phonetics

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/noniq/cologne_phonetics. Please make sure to include tests, and check that running `bin/rubocop` does not show any warnings.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
