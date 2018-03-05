# frozen_string_literal: true

require 'cologne_phonetics/rules'
require 'cologne_phonetics/version'

module ColognePhonetics
  class << self
    # Enable / disable debug mode. If set to true, using {.encode} or {.encode_word} will output
    # warnings to `$stderr` if they encounter characters that cannot be encoded.
    attr_accessor :debug
  end

  # rubocop:disable SpaceBeforeComma
  Rules.define do
    change 'aeijouy', to: '0'
    change 'äöü'    , to: '0' # additional rule: treat umlauts like vowels
    change 'h'      , to: ''
    change 'b'      , to: '1'
    change 'p'      , to: '1', not_before: 'h'
    change 'dt'     , to: '2', not_before: 'csz'
    change 'fvw'    , to: '3'
    change 'p'      , to: '3', before: 'h'
    change 'gkq'    , to: '4'
    change 'c'      , to: '4', initial: true, before: 'ahkloqrux'
    change 'c'      , to: '4', before: 'ahkoqux', not_after: 'sz'
    change 'x'      , to: '48', not_after: 'ckq'
    change 'l'      , to: '5'
    change 'mn'     , to: '6'
    change 'r'      , to: '7'
    change 'sz'     , to: '8'
    change 'ß'      , to: '8' # additional rule: treat 'ß' like 's'
    change 'c'      , to: '8', after: 'sz'
    change 'c'      , to: '8', initial: true, not_before: 'ahkloqrux'
    change 'c'      , to: '8', not_before: 'ahkoqux'
    change 'dt'     , to: '8', before: 'csz'
    change 'x'      , to: '8', after: 'ckq'
  end
  # rubocop:enable SpaceBeforeComma

  # Encode string using Cologne phonetics rules. The encoding process can handle upper and lower case
  # characters in the range of `a–z`, as well as `äöüß`. Everything else is ignored.
  #
  # If the string consists of several words separated by spaces, each word is encoded seperately,
  # and the resulting codes are then again joined together with spaces.
  #
  # @return [String] Encoded string (consist of digits only, and maybe spaces)
  def self.encode(string)
    string.split(' ').map{ |word| encode_word(word) }.join(' ')
  end

  # Low-level method for encoding a single word using Cologne phonetics rules (spaces will be
  # ignored). You most probably want to use {.encode} instead.
  #
  # @return [String] Encoded word (consists of digits only)
  def self.encode_word(word)
    Rules.apply_to(word).squeeze.gsub(/(.)0/, '\1')
  end
end
