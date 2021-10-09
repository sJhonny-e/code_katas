require 'rspec'
require_relative '../app/string_validations'

describe 'validating that the given character exists within the given range in a string' do
    it 'validates that "a" exists between 1 and 3 times in "abcde"' do
        expect(valid_string?('1-3 a: abcde')).to eq(true)
    end

    it 'validates that "b" does not exist between 1 and 3 times in "cdefg"' do
        expect(valid_string?('1-3 b: cdefg')).to eq(false)
    end

    it 'validates that "b" does not exist between 1 and 3 times in "bcdefgbbb"' do
        expect(valid_string?('1-3 b: bcdefgbbb')).to eq(false)
    end

    it 'validates that "c" exist between 2 and 9 times in "2-9 c: ccccccccc"' do
        expect(valid_string?('2-9 c: ccccccccc')).to eq(true)
    end

    context 'invalid input' do
        it 'is false if lower bound is larger than upper bound' do
            expect(valid_string?('3-1 b: cdebb')).to eq(false)
        end

        it 'is false if one of the bounds isnt numeric' do
            expect(valid_string?('a-3 b: bcdefgbb')).to eq(false)
        end
    end
end