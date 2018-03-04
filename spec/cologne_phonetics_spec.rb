# frozen_string_literal: true

require 'spec_helper'
require 'cologne_phonetics'

RSpec.describe ColognePhonetics do
  RSpec::Matchers.define :get_encoded_as do |code|
    match do |string|
      @string = string
      @expected_code = code
      @actual_code = described_class.encode(string)
      @expected_code == @actual_code
    end
    failure_message{ |_string| "Expected '#{@expected_code}', but got '#{@actual_code}\'" }
    description{ "encode '#{@string}' as '#{@expected_code}'" }
  end

  # Example given in the original paper (as stated by Wikipedia)
  example{ expect('Breschnew').to get_encoded_as('17863') }

  # These examples are taken from the Perl module Text::Phonetic::Koeln (v2.08).
  # One incorrect example ('hoffmann' => '36) has been corrected.
  # https://metacpan.org/pod/Text::Phonetic::Koeln
  # rubocop:disable SpaceInsideParens
  example{ expect('Wikipedia'          ).to get_encoded_as('3412'    ) }
  example{ expect('Müller-Lüdenscheidt').to get_encoded_as('65752682') }
  example{ expect('Breschnew'          ).to get_encoded_as('17863'   ) }
  example{ expect('Müller'             ).to get_encoded_as('657'     ) }
  example{ expect('schmidt'            ).to get_encoded_as('862'     ) }
  example{ expect('schneider'          ).to get_encoded_as('8627'    ) }
  example{ expect('fischer'            ).to get_encoded_as('387'     ) }
  example{ expect('weber'              ).to get_encoded_as('317'     ) }
  example{ expect('meyer'              ).to get_encoded_as('67'      ) }
  example{ expect('wagner'             ).to get_encoded_as('3467'    ) }
  example{ expect('schulz'             ).to get_encoded_as('858'     ) }
  example{ expect('becker'             ).to get_encoded_as('147'     ) }
  example{ expect('hoffmann'           ).to get_encoded_as('0366'    ) }
  example{ expect('schäfer'            ).to get_encoded_as('837'     ) }
  example{ expect('cater'              ).to get_encoded_as('427'     ) }
  example{ expect('axel'               ).to get_encoded_as('0485'    ) }
  # rubocop:enable SpaceInsideParens

  it 'encodes words separately' do
    expect('Heinz Classen').to get_encoded_as('068 4586')
  end

  it 'encodes ß like s' do
    expect('Claßen').to get_encoded_as('4586')
  end

  context 'encoding umlauts like vowels' do
    # rubocop:disable SpaceInsideParens
    example{ expect('über' ).to get_encoded_as('017') }
    example{ expect('Mähne').to get_encoded_as('66' ) }
    example{ expect('RÖHRE').to get_encoded_as('77' ) }
    # rubocop:enable SpaceInsideParens
  end
end
