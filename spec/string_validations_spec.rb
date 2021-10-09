require 'rspec'
require_relative '../app/string_validations'

describe 'validating that the given character exists within the given range in a string' do
    it 'validates that "a" exists between 1 and 3 times in "abcde"' do
        expect(valid_string?('1-3 a: abcde')).to eq(true)
    end
end