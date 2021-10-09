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

    it 'validates that "c" exist between 2 and 19 times in "2-9 c: ccccccccc"' do
        expect(valid_string?('2-19 c: ccccccccc')).to eq(true)
    end

    it 'works on a large input set' do
        lines = File.readlines('./spec/fixtures/input2.txt')
        expect(lines.map{|line| valid_string?(line)}.tally).to eq({true => 666, false => 334})
    end

    context 'invalid input' do
        it 'is false if lower bound is larger than upper bound' do
            expect(valid_string?('3-1 b: cdebb')).to eq(false)
        end

        it 'is false if one of the bounds isnt numeric' do
            expect(valid_string?('a-3 b: bcdefgbb')).to eq(false)
        end

        it 'is false when bounds are not formatted correctly' do
            expect(valid_string?('1*3 b: cdefgbb')).to eq(false)
        end
    end
end

describe 'validating that a given character appears in exactly one of the given positions' do
    it 'validates that "a" exists exactly once in either positions 1 or 3 for "abcde"' do
        expect(valid_string_with_pos?('1-3 a: abcde')).to eq(true)
    end

    it 'validates that "b" doesnt exist in either positions 1 or 3 for "cdefg"' do
        expect(valid_string_with_pos?('1-3 b: cdefg')).to eq(false)
    end

    it 'validates that "c" exist in both positions 2 and 9 for "ccccccccc"' do
        expect(valid_string_with_pos?('2-9 c: ccccccccc')).to eq(false)
    end
end